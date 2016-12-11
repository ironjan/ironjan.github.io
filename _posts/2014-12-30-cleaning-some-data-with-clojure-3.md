---
id: 275
title: Cleaning some data with Clojure 3
date: 2014-12-30T14:05:53+00:00
author: ironjan
layout: post
guid: http://ironjan.de/?p=275
permalink: /2014/12/30/cleaning-some-data-with-clojure-3/
categories:
  - All
  - Programming
---
The first post in this series was about [the original problem](http://ironjan.de/cleaning-some-data-with-clojure-1/ "Cleaning some data with Clojure 1"): there is a data-set of strings with potential duplicates and many typos. The second was about [computing the similarity of two strings](http://ironjan.de/cleaning-some-data-with-clojure-2/ "Cleaning some data with Clojure 2"). In this post we will focus on the question

> Can we group multiple strings of a set by similarity?

**Matching the names: **The first step is to match the names. I hope, that the following code is documented good enough.

<pre class="wp-code-highlight prettyprint">(defn- singleMap 
  "Produces a function that takes one argument str2 and computes
  [str1 str2 (f str1 str2)]."
  [f str1]
  (fn [str2]
    [str1 str2 (f str1 str2)]))

(defn- split? 
  "Produces a split predicate based on a."
  [str] 
  (fn [x] 
    (pos? (compare str x))))

(defn- getAfterStr 
  "Returns the elements after str of the supplied sequence"
  [str strings]
  (get (split-with (split? str) strings) 1))

(defn- singleMapWAll
  "Produces a producer function that maps the matching function
  with a to all elements after a."
  [f strings] 
  (fn 
    [str1] 
    (map (singleMap f str1) getAfterStr)))

(defn match
  "Uses the given similarity function f and matches all
  strings with each other string once"
  [f strings]
  ; Applys the function produced by singleMapWAll to strings
  ; and concatenates the result
  (mapcat (singleMapWAll f strings) strings)) 
</pre>

The following table provides some more information. a, b, c, d, and e are the strings to be matched. &#8220;f str1&#8221; denotes that a function &#8220;f str1&#8221; is mapped onto the corresponding string in the last row (which will be used as str2 in the matching).

<table>
  <tr>
    <td>
    </td>
    
    <td>
    </td>
    
    <td>
    </td>
    
    <td>
    </td>
    
    <td>
      (f d)
    </td>
  </tr>
  
  <tr>
    <td>
    </td>
    
    <td>
    </td>
    
    <td>
    </td>
    
    <td>
      (f c
    </td>
    
    <td>
      f c)
    </td>
  </tr>
  
  <tr>
    <td>
    </td>
    
    <td>
    </td>
    
    <td>
      (f b
    </td>
    
    <td>
      f b
    </td>
    
    <td>
      f b)
    </td>
  </tr>
  
  <tr>
    <td>
    </td>
    
    <td>
      (f a
    </td>
    
    <td>
      f a
    </td>
    
    <td>
      f a
    </td>
    
    <td>
      f a)
    </td>
  </tr>
  
  <tr>
    <td>
      a
    </td>
    
    <td>
      b
    </td>
    
    <td>
      c
    </td>
    
    <td>
      d
    </td>
    
    <td>
      e
    </td>
  </tr>
</table>

Whereas map would produce a mapping as above, mapcat applys the mapping and concatenates the results as displayed below.

<table>
  <tr>
    <td>
    </td>
    
    <td>
      (f a
    </td>
    
    <td>
      f a
    </td>
    
    <td>
      f a
    </td>
    
    <td>
      f a
    </td>
    
    <td>
      f b
    </td>
    
    <td>
      f b
    </td>
    
    <td>
      f b
    </td>
    
    <td>
      f c
    </td>
    
    <td>
      f c
    </td>
    
    <td>
      f d)
    </td>
  </tr>
  
  <tr>
    <td>
      a
    </td>
    
    <td>
      b
    </td>
    
    <td>
      c
    </td>
    
    <td>
      d
    </td>
    
    <td>
      e
    </td>
    
    <td>
      c
    </td>
    
    <td>
      d
    </td>
    
    <td>
      e
    </td>
    
    <td>
      d
    </td>
    
    <td>
      e
    </td>
    
    <td>
      e
    </td>
  </tr>
</table>

After all matching fs are applied, we get our result tuples in one list:

<table>
  <tr>
    <td>
      ([a b (f a b)]
    </td>
    
    <td>
      [a c (f a c)]
    </td>
    
    <td>
      &#8230;
    </td>
    
    <td>
      [d e (f d e)])
    </td>
  </tr>
</table>

**Filtering the results:** This filtering step is just an intermediate step. We will use the results find good &#8220;grouping&#8221; values. Remember that a result vector has the form `[str1 str2 (similarity str1 str2)`.

<pre class="wp-code-highlight prettyprint">(defn- minSimFilterBuilder 
  [min-sim]
  (fn [x]
    (&gt;= (get x 2) min-sim)))

(defn- unequalName? 
  [x]
  (not (= (get x 0) (get x 1))))

(defn cleanMatches 
  [matches min-sim]
   (filter (minSimFilterBuilder min-sim) 
    (filter unequalName? matches)))
</pre>

`minSimFilterBuilder` is used to construct filter functions based on a minimum similarity value. The function `unequalName?` simply checks, if the names of the result tuple are different. The result of `cleanMatches` will then contain only matches with distinct strings that are &#8220;similar enough&#8221; for us.

**Constructing clusters:** sadg