---
title: Reproducible Research
author: Mark Agerton
date: 2019 September 23
bibliography: ReproducibleResearch.bib
csl: chicago-author-date.csl
colorlinks: true
link-citations: true
---

# New AER Reproducibility Guidelines

- AER's [Data and Code Availability Policy](https://www.aeaweb.org/journals/policies/data-code)

    For econometric, simulation, and experimental papers, the replication materials shall include 

    a) the data set(s), 
    b) the programs used to create any final and analysis data sets from raw data, 
    c programs used to run the final models, and 
    d) description sufficient to allow all programs to be run.

- Social Science Data Editors [Verification guidance](https://social-science-data-editors.github.io/guidance/Verification_guidance.html) and [Replication Template](https://github.com/AEADataEditor/replication-template/blob/master/REPLICATION.md)

- "Top 10 list of papers on reproducible research" [@barba2017barbagroup]

# Ten Simple Rules for Reproducible Computational Research

1. For Every Result, Keep Track of How It Was Produced
2. Avoid Manual Data Manipulation Steps
3. Archive the Exact Versions of All External Programs Used
4. Version Control All Custom Scripts
5. Record All Intermediate Results, When Possible in Standardized Formats
6. For Analyses That Include Randomness, Note Underlying Random Seeds
7. Always Store Raw Data behind Plots
8. Generate Hierarchical Analysis Output, Allowing Layers of Increasing Detail to Be Inspected
9. Connect Textual Statements to Underlying Results
10. Provide Public Access to Scripts, Runs, and Results

[@sandve2013ten]

::: notes

1. For Every Result, Keep Track of How It Was Produced
    + Notion of "workflow"... from raw data to final table
2. Avoid Manual Data Manipulation Steps
    + Excel is evil
3. Archive the Exact Versions of All External Programs Used
    + Python virtualenv, R's packrat, Julia Pkg all help here
    + Also hardware
4. Version Control All Custom Scripts
    + Git!!!
5. Record All Intermediate Results, When Possible in Standardized Formats
    + Show my example from SLURM
6. For Analyses That Include Randomness, Note Underlying Random Seeds
    + duh
7. Always Store Raw Data behind Plots
    + Plots & tables should be generated from files
8. Generate Hierarchical Analysis Output, Allowing Layers of Increasing Detail to Be Inspected
    + ??
9. Connect Textual Statements to Underlying Results
    + For each statement, where did it come from? Cite the source or note your data
10. Provide Public Access to Scripts, Runs, and Results
    + Github?
    + AER data site

:::

# Workflow / project management

- Folder  structure (see RK)
- Workflow
- Readmes
- Projects - R and Sublime Text

# Git

https://hackernoon.com/a-gentle-introduction-to-git-and-github-the-eli5-way-43f0aa64f2e4
https://www.slideshare.net/HubSpot/git-101-git-and-github-for-beginners

- Resources: https://lectures.quantecon.org/jl/more_julia/version_control.html and 
- Why version control?
- Version control is "undo"
- Everything is text!!
- Github vs git
- Education discounts
- Private vs public
- Issues
- Stage / commit / push
- Pull vs pull request
- Merge / Pull Request
- Commit vs repo
- Browsing w/ a GUI: Git Kraken, Github Desktop, Sublime Merge
- Clone vs Fork
- Help!
- Versus Dropbox
- Merge conflicts
- Gitignore, License

- Workflow
    + Fork this repo on Github
    + Clone it to your local machine
    + Create a new branch
    + make changes
    + stage
    + commit
    + checkout master
    + make changes, stage, commit
    + merge / pull request


# Data management

https://v4.software-carpentry.org/data/index.html
https://mariadb.com/kb/en/library/database-normalization-overview/



# References

