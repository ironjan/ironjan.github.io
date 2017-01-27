---
layout: page
title: Projekte
date: 2016-12-11T16:39:00+00:00
---

Hier gibt es Infos zu verschiedenen Projekten von mir. Das am längsten erhaltene Projekt ist vermutlich die Android-app [Mensa UPB](https://play.google.com/store/apps/details?id=de.ironjan.mensaupb). Weitere Infos zu dieser gibt es in der [Kategorie MensaUPB](/mensaupb).


{% for post in site.posts %}
  {% if    post.categories contains "Mensa UPB"
        or post.categories contains "Data"
        or post.categories contains "Programming"
  %}
    {% include post-excerpt.html %}
  {% else %}
  {% endif %}
{% endfor %}
