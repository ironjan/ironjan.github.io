---
id: 269
title: Cleaning some data with Clojure 1
date: 2014-12-25T20:11:19+00:00
author: ironjan
excerpt: Just playing around with some distance measures for strings and some test data.
layout: post
guid: http://ironjan.de/?p=269
permalink: /2014/12/25/cleaning-some-data-with-clojure-1/
categories:
  - Data
  - Programming
---

**Context:** The students&#8217; council mathematics and computer science in Paderborn (FSMI) provides a service called &#8220;Klausurausleihe&#8221;. Students may come to the FSMI and lend exams and protocols to prepare themselves  for exams.

To manage the dataset behind this services, the so-called klausurtool is used. The FSMI an manage the set of exams available and their status. Exams are represented as tuples (examiner, date, content, lendingStatus, lecture) [0].

**The problem:** For every single exam, the examiner (and other data has to be entered). There were no rules on how to enter the examiner. Also, the klausurtool did not use UTF-8.

E.g. &#8220;Blömer&#8221; has been entered as&#8221;Blömer&#8221;, &#8220;Bloemer&#8221;, &#8220;Bl\&#8221;mer&#8221;. The last one is using LaTeX-notation (which has some funny effects on DB queries). Note, that this does not yet include typos like &#8220;Bleomer&#8221; or &#8220;Blmöer&#8221; which are also common.

Because of these problems (and some others not mentioned), a new klausurtool is in development. One of the originally planned features was to enter examiners and exams separately, i.e. when entering an exam, the examiner has to be picked from the existing ones.

Of course, the new klausurtool needs to be &#8220;feeded&#8221; with data. There are multiple possiblities &#8211; sortied ascending by my preference &#8211; to do this:

  1. Start typing everything per hand. Some prefer this solution because &#8220;the old data is unusable&#8221;.
  2. Just put all the old data into the new klausurtool. As mentioned before, there are inconsistencies etc.
  3. Clean all the data and put it into the new klausurtool.
  4. Clean some data and put it into the new klausurtool, e.g. existing examiners.

I am not a computer and therefore should not do tasks that can be automated. Especially when we&#8217;re talking about lots of stuff (there are ~300 uncleaned examiners, excluding the other data). Hence, I dismissed 1.

Possibility 2 is also to be dismissed: There&#8217;s a chance to do things right; why should we repeat the errors done before?

Number 3 sounds great! All the data, all clean and beautiful. Unfortunately this would be too much work: First, extract all uncleaned examiners from the set of exams. Then clean the examiners and create a map _uncleanedExaminer\_i -> cleanedExaminer\_j_. Finally, convert all exams to the new format, while replacing _uncleanedExaminer_i_ on every exam with a relation to _cleanedExaminer_j_.

This may be possible but would get ugly soon enough. In fact, converting stuff into a new schema **without** cleaning is ugly enough (I already did this once).

Therefore, we are left with the final possibility: clean some data and add it to the new klausurtool.

**Evaluating the data:** In this post I will focus on examiners. Nonetheles the things mentioned here are applicable to different data (e.g. lecture names etc).

In this step, I asked the following questions, answered in later blog posts [1]:

  1. [Can we tell, if two strings are similar?](http://ironjan.de/cleaning-some-data-with-clojure-2 "Cleaning some data with Clojure 2")
  2. [Can we do that for many strings and group similar strings? (Create clusters)](http://ironjan.de/cleaning-some-data-with-clojure-3 "Cleaning some data with Clojure 3")
  3. How do we use these clusters to clean the data?

The last step cannot be automated completely, without creating/typing a list of &#8220;correct&#8221; examiners. But it can be semi-automated: a program can present the clusters of Step 2 and the user can select the correct examiner from a cluster:

>   1. Bleomer
>   2. Bloemer
>   3. Blömer
>   4. Bl\&#8221;omer
> 
> Correct one: >> 3

This solution should be faster than the &#8220;take out all exams and type the examiner into the system&#8221;&#8230;

[0] This is simplified.

[1] I&#8217;m lazy, therefore these links will be broken, until the corresponding blog posts are released. Could take some time&#8230;