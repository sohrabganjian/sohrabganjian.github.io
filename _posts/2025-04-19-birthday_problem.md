---
layout: post
title: "Birthday Paradox"
date: 2025-04-19
categories: [probability]
tags: [jupyter-notebook, collision-probability]
description: "A study of the Birthday Paradox and its implications for collision probabilities"
giscus_comments: true
related_posts: false
---

## Notebook

{::nomarkdown}
{% assign jupyter_path = 'assets/jupyter/Birthday_Paradox.ipynb' | relative_url %}
{% capture notebook_exists %}{% file_exists assets/jupyter/Birthday_Paradox.ipynb %}{% endcapture %}
{% if notebook_exists == 'true' %}
  {% jupyter_notebook jupyter_path %}
{% else %}
  <p>Sorry, the notebook you are looking for does not exist.</p>
{% endif %}
{:/nomarkdown}
