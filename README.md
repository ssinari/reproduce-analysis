# Introduction

In this document we will go through the steps to reproduce an analysis in a
project using:

- docker: to fix the computing environment.
- rmarkdown: to format the code and text into a document to (re)produce the analysis.
- knitr: to weave (or knit) the rmarkdown document into a report for clients.

# Project layout

We build the following core layout for this simple project where we will use a
custom [library](https://github.com/ssinari/smisc) hosted on github to produce a
simple report.

The following are the sub-directories and their content in this layout scheme:

- docker: contains build and run scripts for the docker environment. The docker
  file giving the specifications of the image. The container of this image will
  be used as the computing environment for this project.
- data: contains the data used in the project. Ideally this will be a link to
  the directory containing the original data on the user's computer.
- scripts: contains the ramrkdown document and other auxillary scripts that may
  be necessary for reproducing the analysis.
- results: contains the report and or results of the analysis intended to be
  reproduced.

# Assumptions

Here we assume that the underlying platform of use for docker is desktop
computer running some version of Unix operating system such as MacOS or a
distribution of Linux.

# Steps to reproduce the analysis.

## Step 1: Install docker

Go to this [webpage](https://docs.docker.com/v17.12/install/#server) and click
on the link to get docker for your operating system. The link takes you to a
page that contains links to software download as well as operating system
specific instructions for installation. 

## Step 2: Install git

Similarly go to this [webpage](https://git-scm.com/downloads) to get
instructions on how to download and install git for your environment.

## Step 3: Clone the git repository

For example, you can clone this repo using the command:

   git clone <path to repo>

## Step 4: Initiate the docker environment

To initiate the docker container use the run script `run.sh`. The script pulls
the appropraite docker image and initiates the container. When using images with
RStudio, one more step is required. Open a browser such as Chrome and type
`localhost:8787`. The number 8787 is the port number at which the RStudio is
rendered. The username and password for login are `rstudio` and `rstudio`
respectively.

## Step 5: Reproduce the analysis

You can now initiate the analysis for reproducing the report of your interest.
When using R in the terminal, i.e using docker container for terminal based R
and

- starting in bash shell:


change to the results folder:

    cd project/results

Initiate R:

    R

use the command:

    rmarkdown::render(file = "path to the rmarkdown document",
                      output_file = "name of the output report",
                      output_dir = ".")


- starting in R session:

    setwd("project/results")
    rmarkdown::render(file = "path to the rmarkdown document",
                          output_file = "name of the output report",
                          output_dir = ".")

- starting in RStudio:

Use the GUI to navigate to the rmarkdown file and `knit` it. Then move the file
to the results folder and rename it if needed.

# Best practices
