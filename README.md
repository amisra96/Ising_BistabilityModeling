# 2D Ising Model – Hysteresis and Inflammatory Memory

This repository contains a **MATLAB script** that uses a **2D Ising model** to simulate **hysteresis as a function of temperature**, serving as a **conceptual proxy for inflammatory memory** in biological systems.

---

## 🔬 Overview

The 2D Ising model is a classic system in statistical physics used to study **phase transitions** and **collective behavior**.  
In this implementation, we explore how **temperature-dependent hysteresis loops** can represent **memory-like phenomena** — analogous to how immune cells retain "memory" of past inflammatory states.

---

## ⚙️ How It Works

- The system consists of a **2D lattice** of spins (+1 or -1), each representing a local state (e.g., active vs. inactive).  
- Spins interact with their nearest neighbors and are influenced by an **external field** and **temperature**.  
- The model is evolved using **Metropolis–Hastings Monte Carlo updates**.  
- **Temperature is cycled** up and down to visualize **hysteresis** — how the system’s state depends on its history.

---

## 📈 Outputs

- Magnetization vs. Temperature plots showing **hysteresis loops**.  
- Interpretation: The persistence of magnetization under cooling and heating cycles reflects **“inflammatory memory”** — the system’s history-dependent response to stimuli.

---
