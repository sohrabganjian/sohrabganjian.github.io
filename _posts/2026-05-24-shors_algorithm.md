---
layout: post
title: "Shor's Algorithm"
date: 2026-05-24
categories: [quantum]
tags: [jupyter-notebook, quantum-algorithms]
description: "Shor's algorithm is a quantum algorithm for integer factorization, first presented by Peter Shor in 1994. It demonstrates that a quantum computer can theoretically factor integers in polynomial time, giving an exponential speedup over any known classical factoring algorithm for a cryptographically relevant problem with real-world utility. Shor's algorithm is one of the most fundamental quantum algorithms. This tutorial explains Shor's algorithm, gives a heuristic analysis of its probability of success as a probabilistic quantum algorithm, discusses gate complexity, resource estimates, hardware demonstrations of quantum factoring, and implications for classical and quantum complexity theory. It then implements a small example of Shor's algorithm in Qiskit by factoring 15, with background material on number theory and the historical development of the algorithm."


giscus_comments: true
related_posts: false
---

## Notebook

{::nomarkdown}
{% assign jupyter_path = 'assets/jupyter/ShorsAlgorithm.ipynb' | relative_url %}
{% capture notebook_exists %}{% file_exists assets/jupyter/ShorsAlgorithm.ipynb %}{% endcapture %}
{% if notebook_exists == 'true' %}
{% jupyter_notebook jupyter_path %}
{% else %}

  <p>Sorry, the notebook you are looking for does not exist.</p>
{% endif %}
{:/nomarkdown}
