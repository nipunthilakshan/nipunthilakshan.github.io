---
permalink: /blogs/
title: "Blogs"
layout: default
excerpt: "Blogs by Nipun Thilakshan."
last_modified_at: 2023-10-28T15:46:43-04:00
toc: true
search: true
list-style-type: square
font-size: 12px
---

<section id="recent-medium-articles">
  <h2>Recent Medium Articles</h2>
  <ul>
    {% for post in site.posts %}
      <li>
        <a href="{{ post.url }}" target="_blank" rel="noopener noreferrer">{{ post.title }}</a>
        <p>{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endfor %}
  </ul>
</section>
