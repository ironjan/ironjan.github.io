---
layout: page
title: Projects
date: 2016-12-11T16:39:00+00:00
---

> This category is mostly in German because my most relevant projects [Mensa UPB](/mensaupb) and [Metal-Only](/metal-only) are mostly relevant in Germany.

Hier gibt es Infos zu meinen Projekten von mir. Meine Haupt-Projekte sind die 
beiden Android-Apps [Mensa UPB](/mensaupb) und [Metal-Only](/metal-only). 
Unter Anderem finden sich dort eine Erklärungen, welche Daten innerhalb der 
Apps abgefragt werden und wie diese genutzt werden.

Kurz gefasst können die beiden Erklärungen sehen die beiden Erklärungen wie 
folgt aus: die Daten werden nur abgefragt, 

 * …um die Apps über das von Android empfohlene Framework mit dem Internet zu 
   synchronisieren (Speisepläne downloaden, Sendeplan downloaden) und…
 * um das Nutzererlebnis in den Apps zu verbessern (Welche Funktionen werden 
   häfig genutzt und brauchen im Moment zu viele Schritte?).

{% for post in site.posts %}
  {% if    post.categories contains "Mensa UPB"
        or post.categories contains "Data"
        or post.categories contains "Programming"
        or post.categories contains "Projects"
  %}
    {% include post-excerpt.html post=post %}
  {% else %}
  {% endif %}
{% endfor %}
