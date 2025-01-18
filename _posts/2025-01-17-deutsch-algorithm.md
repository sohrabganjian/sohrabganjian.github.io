---
layout: post
title: "Deutsch Algorithm"
date: 2025-01-17
categories: [quantum]
tags: [jupyter-notebook, quantum-algorithms]
description: "A detailed exploration of the Deutsch Algorithm using Jupyter Notebook."
giscus_comments: true
related_posts: false
---

## Notebook

{::nomarkdown}
{% assign jupyter_path = 'assets/jupyter/deutsch_algorithm.ipynb' | relative_url %}
{% capture notebook_exists %}{% file_exists assets/jupyter/deutsch_algorithm.ipynb %}{% endcapture %}
{% if notebook_exists == 'true' %}
  {% jupyter_notebook jupyter_path %}
{% else %}
  <p>Sorry, the notebook you are looking for does not exist.</p>
{% endif %}
{:/nomarkdown}
