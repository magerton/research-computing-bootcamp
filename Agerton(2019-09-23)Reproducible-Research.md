---
title: Reproducible Research
author: Mark Agerton
date: 2019 September 23
bibliography: ReproducibleResearch.bib
csl: chicago-author-date.csl
colorlinks: true
link-citations: true
---

# 3 kinds of reproducibility

- **Methods:** *The ability to implement, as exactly as possible, the experimental and computational procedures, with the same data and tools, to obtain the same results.*

- Results: *obtaining the same results from the conduct of an independent study*

- Inferential: do we interpret results from an independent or reanalysis study?

@goodman2016what

# Reproducible research

Make the *entire research process* transparent

Not just regression tables. It includes

- Every step of data-work (including downloading!)
- Your figures
- Sources for any fact you cite

Reproducible research is about **workflow** and **sharing**

# Why bother with reproducible research?

1. We are scientists who (ostensibly) care about the truth, and need others to be able to verify it

2. We can build off one another's work.

2. Journals care about it.

3. It'll make your life easier (in the long run).


# New AER Reproducibility Guidelines (Methods)

- AER's [Data and Code Availability Policy](https://www.aeaweb.org/journals/policies/data-code)

    For econometric, simulation, and experimental papers, the replication materials shall include 

    a. the data set(s), 
    b. the programs used to create any final and analysis data sets from raw data, 
    c. programs used to run the final models, and 
    d. description sufficient to allow all programs to be run.

- Social Science Data Editors [Verification guidance](https://social-science-data-editors.github.io/guidance/Verification_guidance.html) and [Replication Template](https://github.com/AEADataEditor/replication-template/blob/master/REPLICATION.md)

<!-- - "Top 10 list of papers on reproducible research" [@barba2017barbagroup] -->

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

# How to do this?

- Gold Standard? Create entire paper with one command.

- *Literate programming*: Rmarkdown, Jupyter notebooks, Stata's `dyndoc`

- Usually not practical: too many files!

# Mark's strategy

1. Document everything

2. Version control (almost) everything

3. Automate as much as ~~possible~~ practical

# Benefits & costs

- On the plus side

    + Keeps me organized
    + Means others can understand what I'm doing
    + Lowers marginal cost of re-running analysis with new data, assumptions, etc
    + Reduces errors

- But
    + Higher fixed costs
    + Co-authors grumpy about new software

# Starting a new project

- Everything lives in one folder

- Sublime Text and R projects

- Track everything with Git

- And keep only 1 version (no redundancy!)

- Everything is a text file (except data and .pdfs)
    + "Diff"-able (track changes)
    + Future-proofed
    + Searchable from command line, Sublime Text

# Folder structure and filenames

- `README.md` in every folder that might need one
- Save `raw_data` 
    + Ideally download programatically code
    + `README.md` documents acquisition
    + Save md5 hash of data
    + Don't ever modify it!
- `intermediate_data`
    + Processed data
- `writeup`
    + `paper/` has .tex files
    + `yyyy-mm-presentation/`
    + `figures/`
    + `tables/`
    + various notes
- `code`
    + `master.do`, `run_all.sh` or `MAKE` script to run all analysis
    + Name files in order of analysis `00a - download prices.R`, `00b - download shapefiles.R`

# Staying organized with lengthy jobs on a cluster

- Jobs on cluster get a unique job ID

- Keep a `README.md` log with *metadata* (data about data) listing job IDs

- In the log, print 
    + unique "commit hash" to log that identifies current snapshot of the codebase
    + Lots of intermediate output

# Resources on project management / organization

- Software Carpentry [Data Management](https://v4.software-carpentry.org/data/mgmt.html) lesson

- Other economists' workflows
    + [Ryan Kellogg's Lab Wiki](https://github.com/kelloggrk/Kellogg_RA_Manual/wiki)
    + [Hunt Allcott's Lab Wiki](https://github.com/huntallcott/lab/wiki)
    + [Gentzkow and Shapiro *Lab Wiki*](https://github.com/gslab-econ/ra-manual/wiki)
    + [Gentzow and Shapiro *PDF Code and Data for the Social Sciences: A Practitioner's Guide*](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf)
    + [Knittel and Metaxoglou (2016) *Working with Data: Two Empiricists’ Experience*](https://doi.org/10.1515/jem-2016-0001)

# What is Git?

- A program that keeps track of file histories

- Like blockhain lite --- everyone gets the entire project history

- The biggest-baddest "Undo" button ever --- roll back to any *commit*ted file

- Searchable

- Able to merge text file versions

# Git

![*If that doesn't fix it, git.txt contains the phone number of a friend of mine who understands git. Just wait through a few minutes of 'It's really pretty simple, just think of branches as...' and eventually you'll learn the commands that will fix everything.*](https://imgs.xkcd.com/comics/git_2x.png){ height=70% }

# Git vs Github

![](https://d1jnx9ba8s6j9r.cloudfront.net/blog/wp-content/uploads/2017/12/gitHub.png)


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


# Structuring data

https://v4.software-carpentry.org/data/index.html
https://mariadb.com/kb/en/library/database-normalization-overview/



# References

- https://github.com/kelloggrk/Kellogg_RA_Manual
