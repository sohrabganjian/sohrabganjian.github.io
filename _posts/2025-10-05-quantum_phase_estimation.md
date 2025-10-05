---
layout: post
title: "Quantum Phase Estimation"
date: 2025-10-05
categories: [quantum]
tags: [jupyter-notebook, quantum-algorithms]
description: "A comprehensive walkthrough of the quantum phase estimation (QPE) algorithm, including its problem formulation, circuit design, output interpretation, and error analysis, supported by analytical derivations and a PennyLane implementation."
giscus_comments: true
related_posts: false
---

## Notebook

{::nomarkdown}
{% assign jupyter_path = 'assets/jupyter/QuantumPhaseEstimation.ipynb' | relative_url %}
{% capture notebook_exists %}{% file_exists assets/jupyter/QuantumPhaseEstimation.ipynb %}{% endcapture %}
{% if notebook_exists == 'true' %}
  {% jupyter_notebook jupyter_path %}
{% else %}
  <p>Sorry, the notebook you are looking for does not exist.</p>
{% endif %}
{:/nomarkdown}
