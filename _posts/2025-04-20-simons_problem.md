---
layout: post
title: "Simon's Problem"
date: 2025-04-20
categories: [quantum]
tags: [jupyter-notebook, quantum-algorithms]
description: "An exploration of Simon's problem and the probabilistic hybrid quantum-classical algorithm that solves the problem, demonstrating exponential speedup over classical approaches."
giscus_comments: true
related_posts: false
---

## Notebook

{::nomarkdown}
{% assign jupyter_path = 'assets/jupyter/Simons_Problem.ipynb' | relative_url %}
{% capture notebook_exists %}{% file_exists assets/jupyter/Simons_Problem.ipynb %}{% endcapture %}
{% if notebook_exists == 'true' %}
  {% jupyter_notebook jupyter_path %}
{% else %}
  <p>Sorry, the notebook you are looking for does not exist.</p>
{% endif %}
{:/nomarkdown}
