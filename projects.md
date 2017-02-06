---
layout: page
title: Projekte
date: 2016-12-11T16:39:00+00:00
---

Hier gibt es Infos zu meinen Projekten von mir. Meine Haupt-Projekte sind die beiden Android-Apps 
[Mensa UPB](https://play.google.com/store/apps/details?id=de.ironjan.mensaupb) und 
[Metal-Only](https://play.google.com/store/apps/details?id=com.codingspezis.android.metalonly.player).

Weitere Infos zu diesen gibt es jeweils in der [Kategorie MensaUPB](/mensaupb) bzw. in der 
[Kategorie Metal-Only](/metal-only); unter Anderem finden sich dort eine Erklärungen, welche Daten 
innerhalb der Apps abgefragt werden und wie diese genutzt werden.

Kurz gefasst können die beiden Erklärungen sehen die beiden Erklärungen wie folgt aus: die Daten 
werden nur abgefragt, 

 * …um die Apps über das von Android empfohlene Framework mit dem Internet zu 
synchronisieren (Speisepläne downloaden, Sendeplan downloaden) und…
 * um das Nutzererlebnis in den Apps 
zu verbessern (Welche Funktionen werden häfig genutzt und brauchen im Moment zu viele Schritte?).


{% for post in site.posts %}
  {% if    post.categories contains "Mensa UPB"
        or post.categories contains "Data"
        or post.categories contains "Programming"
  %}
    {% include post-excerpt.html post=post %}
  {% else %}
  {% endif %}
{% endfor %}
