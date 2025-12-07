📘 Evolutionary Computing & Fuzzy Logic – MATLAB Implementation
By Sahil Dastagir Mujawar

This repository contains my complete implementation of Differential Evolution, Genetic Algorithms, and Fuzzy Logic systems in MATLAB.
The project demonstrates optimization techniques, multi-run analysis, visualization, and rule-based fuzzy inference — developed as part of my MSc Artificial Intelligence coursework at De Montfort University.

🚀 Project Overview

This repository includes:

🔹 1. Differential Evolution (DE)

A population-based optimization algorithm implemented with:

Mutation operation

Recombination

Fitness calculation

Sphere & Rosenbrock benchmark functions

🔹 2. Real-Coded Genetic Algorithm (GA)

Includes complete GA pipeline:

Tournament Selection

Rank Selection

Roulette Wheel Selection

Uniform Crossover

Mutation operators

Sorting & evaluation

Pipeline to run multiple simulations (RunMultipleTimes.m)

Automated comparison plots

🔹 3. Fuzzy Logic System

A custom fuzzy logic inference system featuring:

Membership functions

Fuzzification

If-Then rule evaluation

Defuzzification

MATLAB-based visualization

📁 Repository Structure
Evolutionary-Computing-and-Fuzzy-Logic-Sahil/
│
├── Differential_Evolution/
│   ├── de.m
│   ├── Sphere.m
│   ├── Rosenbrock.m
│
├── Genetic_Algorithm/
│   ├── RunGA.m
│   ├── RunMultipleTimes.m
│   ├── SelectionFunction.m
│   ├── TournamentSelection.m
│   ├── RankSelection.m
│   ├── RouletteWheelSelection.m
│   ├── Crossover.m
│   ├── Mutation.m
│   ├── SortPopulation.m
│   ├── RosenbrockFunction.m
│   ├── FullPipeline.m
│   ├── ComputeFinalStatistics.m
│   └── FinalStatistics.m
│
├── Fuzzy_Logic/
│   └── fuzzy_logic.m
│
└── Results/
    ├── Run1_SideBySide.png
    ├── Run2_SideBySide.png
    ├── ...
    ├── Run20_SideBySide.png
    ├── results_A.txt
    ├── results_B.txt
    └── results_C.txt

📊 Results & Visualization

The Results folder contains:

20+ side-by-side iteration comparison plots

Final fitness values

Multi-run statistical evaluation

Comparative optimization behaviors

These plots highlight variation in:

Convergence speed

Stability of solutions

Algorithm robustness

🛠️ Technologies & Tools

MATLAB R2023b

Optimization Algorithms: DE, GA

Fuzzy Logic Toolbox (custom implementation)

Data visualization and statistical analysis

🎯 Key Learnings

Through this project, I gained experience in:

Implementing evolutionary optimization from scratch

Designing selection, mutation, and crossover strategies

Performing multi-run simulations and statistical analysis

Visualizing algorithm performance

Building a fuzzy logic decision system

Writing clean, modular MATLAB code

📬 Contact

Sahil Dastagir Mujawar
📍 Leicester, UK
🔗 LinkedIn: Add your profile link
🔗 GitHub: Your GitHub profile

Feel free to explore the code and connect with me for collaboration or opportunities!
