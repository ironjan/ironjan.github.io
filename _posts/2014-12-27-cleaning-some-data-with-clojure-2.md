---
id: 273
title: Cleaning some data with Clojure 2
date: 2014-12-27T19:00:27+00:00
author: ironjan
layout: post
guid: http://ironjan.de/?p=273
permalink: /2014/12/27/cleaning-some-data-with-clojure-2/
categories:
  - All
  - Data
  - Programming
---
&#8220;[Cleaning some data with Clojure 1](http://ironjan.de/cleaning-some-data-with-clojure-1/ "Cleaning some data with Clojure 1")&#8221; provides some context on this project. This post here focusses on the question

> **&#8220;Can we tell, if two strings are similar?&#8221;.**

**Levenshtein Distance:** My first idea was to use the [Levenshtein Distance](http://en.wikipedia.org/wiki/Levenshtein_distance "Levenshtein Distance on wikipedia"). This metric counts the minimum number of operations needed to transform one string into the other when allowing insertion, deletion or substition of characters. Its definition is as follows:<figure id="attachment_280" style="width: 400px" class="wp-caption alignnone">

[<img class="size-medium wp-image-280" src="/uploads/2014/12/Levenshtein_distance-400x75.png" alt="Definition of Levenshtein Distance" width="400" height="75" srcset="/uploads/2014/12/Levenshtein_distance-400x75.png 400w, /uploads/2014/12/Levenshtein_distance-200x37.png 200w, /uploads/2014/12/Levenshtein_distance.png 587w" sizes="(max-width: 400px) 100vw, 400px" />]({{ site.url }}/uploads/2014/12/Levenshtein_distance.png)<figcaption class="wp-caption-text">Definition of Levenshtein Distance</figcaption></figure> 

[<img class=" size-full wp-image-281 alignleft" src="/uploads/2014/12/indicator_function.png" alt="indicator_function" width="55" height="21" />]({{ site.url }}/uploads/2014/12/indicator_function.png)denotes the indicator function, which is equal to 0 when the i-th character of a is equal to the j-th character of b. Otherwise it&#8217;s 1.

Transforming this into clojure-code is fairly simple, given the definitions. First, the indicator-function:

<pre class="wp-code-highlight prettyprint">(defn indicator
  "0, if the i-th character of a and the j-th character of b
are the same. 1 otherwise."
  [a b i j]
  (if (= (get a (dec i)) (get b (dec j)))
   0
   1))
</pre>

Next, a helper function which will be called recursively:

<pre class="wp-code-highlight prettyprint">(defn lev
  "Helper function to compute the levenshtein distance"
  [a b i j]
  (if (zero? (min i j))
   (max i j)
   (min (inc (lev a b (dec i) j))
        (inc (lev a b i (dec j)))
        (+ (lev a b (dec i) (dec j)) (indicator a b i j)))))</pre>

And finally the &#8220;public api&#8221;:

<pre class="wp-code-highlight prettyprint">(defn levenshtein
  "Computes the Levenshtein distance between two strings a and b"
  [a b]
  (lev a b (count a) (count b)))
</pre>

Unfortunately, this solution is not very performant [0]. Also it blows the stack somewhere above 50 characters (tested for 140 characters). Nonetheless, this is enough for my use-case 😉

<pre class="wp-code-highlight prettyprint">=&gt; (def alphabet "alphabetdefghijklmnopqrstuvwxyz")
#&#039;/alphabet
=&gt; (time (levenshtein (subs alphabet 0 10) (subs alphabet 0 10)))
"Elapsed time: 3855.856306 msecs"
0
=&gt; (time (levenshtein (subs alphabet 0 11) (subs alphabet 0 11)))
"Elapsed time: 21493.424412 msecs"
0
</pre>

We have this performance issue because most values are computed multiple times; some are computed extremely often. The solution in this case is a well-placed `memoize` to reuse the computed values: `(def lev (memoize lev))`. All in all we get a huge performance boost [1]:

<pre class="wp-code-highlight prettyprint">=&gt; (time (levenshtein (subs alphabet 0 11) (subs alphabet 0 11)))
"Elapsed time: 1.230304 msecs"
0
=&gt; (time (levenshtein (subs alphabet 0 15) (subs alphabet 0 15)))
"Elapsed time: 1.280788 msecs"
0
=&gt; (time (levenshtein alphabet alphabet))
"Elapsed time: 3.099704 msecs"
0
=&gt; (time (levenshtein rnd_50_1 rnd_50_2))
"Elapsed time: 11.464978 msecs"
38
=&gt; (time (levenshtein rnd_140_1 rnd_140_2))
StackOverflowError clojure.lang.AFn.applyToHelper (AFn.java:148)
</pre>

Note, that &#8220;rnd\_X\_Y&#8221; are distinct pseudo-random strings that were &#8220;generated&#8221; by hitting the keyboard X times.

**Extending this metric:** This metric does not take into account that _\&#8221;o_ is equivalent to _ö_. We can fix this by replacing these special values with more common ones before computing the distances:

<pre class="wp-code-highlight prettyprint">(defn cleanString
  "A hacky cleaning function. Replaces unusual characters by more common ones."
  [s]
  (switch "\"A" "Ä"
   (switch "\"O" "Ö"
    (switch "\"U" "Ü"
     (switch "\"a" "ä"
      (switch "\"o" "ö"
       (switch "\"u" "ü"
        (switch "\\ss{}" "ß" s))))))))))))
</pre>

And for a vector etc. of strings:

<pre class="wp-code-highlight prettyprint">(defn clean 
  "Cleans a vector of strings"
  [strings]
  (map cleanString strings))
</pre>

**From distance to similarity:** Our next step is to convert distances between two strings into a &#8220;similarity value&#8221;. The Levenshtein distance of two strings is `(<= 0 (levenshtein a b) (max (count a) (count b)))`. Therefore we can convert a Levenshtein distance to a similarity metric as follows:

<pre class="wp-code-highlight prettyprint">(defn levensthein-similarity
  "Computes a similarity measure based on Levenshtein distance. 0 ~ a and b completely different, 1 ~ a and b equal"
  [a b]
  (- 1 (/ (levensthein a b)
          (max (count a) (count b)))))
</pre>

**TL;DR:** Use an appropriate [String Metric](http://en.wikipedia.org/wiki/String_metric "String Metrics on wikipedia") and convert it to a similarity metric. I tried out [Levenshtein Distance](http://en.wikipedia.org/wiki/Levenshtein_distance "Levenshtein Distance on wikipedia") which does not takes into account that _\&#8221;o_ and _ö_ are equivalent.

[0] &#8220;_We should forget about small efficiencies, say about 97% of the time: premature optimization is the root of all evil._&#8221; (Knuth, Donald. <a class="externallink" title="Structured Programming with go to Statements" href="http://pplab.snu.ac.kr/courses/adv_pl05/papers/p261-knuth.pdf" target="_blank" rel="noreferrer">Structured Programming with go to Statements</a>, ACM Journal Computing Surveys, Vol 6, No. 4, Dec. 1974. p.268.); from [clean-code-developer.de](http://clean-code-developer.de/Vorsicht-vor-Optimierungen.ashx ""Vorsicht vor Optimierungen" - clean-code-developers.de")

[1] These numbers mean next to nothing: we don&#8217;t know yet if these improvements hold true for random strings. This will probably be on a later post.

* * *

Edit: Better code listings.

&nbsp;

&nbsp;