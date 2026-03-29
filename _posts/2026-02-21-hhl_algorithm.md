---
layout: post
title: "HHL Algorithm"
date: 2026-02-21
categories: [quantum]
tags: [jupyter-notebook, quantum-algorithms]
description: "A walkthrough of the Harrow-Hassidim-Lloyd (HHL) algorithm, a quantum algorithm for linear systems of equations with exponential speedup over classical counterparts subject to additional constraints. The tutorial defines the problem statement that the algorithm addresses, examines the input assumptions and requirements of the algorithm, presents the algorithm itself, and unpacks the intricacies of the algorithm, such as what outputs it produces and how they compare with classical approaches. Finally, it implements a simplified version of the algorithm in Qiskit."

giscus_comments: true
related_posts: false
---

## Notebook

{::nomarkdown}
{% assign jupyter_path = 'assets/jupyter/HHL_Algorithm.ipynb' | relative_url %}
{% capture notebook_exists %}{% file_exists assets/jupyter/HHL_Algorithm.ipynb %}{% endcapture %}
{% if notebook_exists == 'true' %}
{% jupyter_notebook jupyter_path %}
{% else %}

  <p>Sorry, the notebook you are looking for does not exist.</p>
{% endif %}
{:/nomarkdown}
