---
layout: post
title: "Variational Quantum Eigensolver"
date: 2025-12-25
categories: [quantum]
tags: [jupyter-notebook, quantum-algorithms]
description: "A detailed introduction to the Variational Quantum Eigensolver (VQE), a hybrid quantum-classical algorithm for approximating ground-state energies of quantum systems. We build a rigorous theoretical foundation by examining the Hamiltonian, the Born-Oppenheimer approximation, and the truncation of the electronic Hamiltonian through the choice of basis orbitals. The workflow explores the transition from first- to second-quantization and the subsequent fermionic-to-qubit mapping required for quantum hardware. To demonstrate the algorithm's feasibility, we apply VQE to the helium hydride cation using PennyLane, evaluating various design choices in the ansatz and optimizer. Finally, we explore the limitations, resource complexity, and real-world applications of calculating ground-state energies in chemistry and materials science."

giscus_comments: true
related_posts: false
---

## Notebook

{::nomarkdown}
{% assign jupyter_path = 'assets/jupyter/VariationalQuantumEigensolver.ipynb' | relative_url %}
{% capture notebook_exists %}{% file_exists assets/jupyter/VariationalQuantumEigensolver.ipynb %}{% endcapture %}
{% if notebook_exists == 'true' %}
  {% jupyter_notebook jupyter_path %}
{% else %}
  <p>Sorry, the notebook you are looking for does not exist.</p>
{% endif %}
{:/nomarkdown}
