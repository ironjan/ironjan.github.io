---
layout: category
title: Programming
---

{% for post in site.posts %}
  {% if post.categories contains 'Data' %}
    {% include post-excerpt.html %}
  {% endif %}
{% endfor %}
