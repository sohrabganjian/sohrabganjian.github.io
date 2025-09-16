---
layout: post
title: "Quantum Fourier Transform"
date: 2025-09-15
categories: [quantum]
tags: [jupyter-notebook, quantum-algorithms]
description: "An exploration of the quantum Fourier transform (QFT), its circuit, basis change, and role in revealing periodicity, including visualizations, and its implementation in PennyLane."
giscus_comments: true
related_posts: false
---

## Notebook

{::nomarkdown}
{% assign jupyter_path = 'assets/jupyter/QuantumFourierTransform.ipynb' | relative_url %}
{% capture notebook_exists %}{% file_exists assets/jupyter/QuantumFourierTransform.ipynb %}{% endcapture %}
{% if notebook_exists == 'true' %}
  {% jupyter_notebook jupyter_path %}
{% else %}
  <p>Sorry, the notebook you are looking for does not exist.</p>
{% endif %}
{:/nomarkdown}
