# Introduction

In this document we will go through the steps to reproduce an analysis recorded
in the document "demo.Rmd" as a demonstration of reproducibility using:

- docker: to fix the computing environment.
- rmarkdown: to format the code and text into a document to (re)produce the analysis.
- knitr: to weave (or knit) the rmarkdown document into a report for clients.

See [TBD](TBD) for more details.

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

Go to this [webpage](https://docs.docker.com/v17.12/install) and click
on the link to get docker for your operating system. The link takes you to a
page that contains links to software download as well as operating system
specific instructions for installation. 

## Step 2: Install git

Similarly go to this [webpage](https://git-scm.com/downloads) to get
instructions on how to download and install git for your environment.

## Step 3: Clone the git repository

For example, you can clone this repo using the command:

```sh
   git clone git@github.com:ssinari/reproduce-analysis.git
```

or by downloading the ZIP file from
[here](https://github.com/ssinari/reproduce-analysis/archive/master.zip).
Similarly you may clone other project repos.

## Step 4: Go to the cloned directory

```sh
cd reproduce-analysis
```

## Step 5: Compile demo.Rmd in a scripting style


```sh
./compile_rmd -p $(pwd)
```

This will compile the analysis in rmarkdown to a new report named
`date`_demo.pdf, where date is in the format _YYYYMMDD_. This report is
identical to the original one given by "demo-original-output.pdf" except the
date in the header will be the date of compilation. Look at

```sh
./compile_rmd -h
```

for more information on how to use it to compile another Rmd into a report
located under this project.

## Step 6: Using the docker environment interactively

The report can also be generated more interactively using either terminal based
R or an RStudio session. The steps below show you how to do this.

- To initiate the docker container with terminal interface to R, run the command:

```sh

run_docker -s ``bash''

```

from inside the cloned directory. The command will compile the right docker
environment and provide a bash terminal. To compile "demo.Rmd" and place the
resulting report in the "results" folder underneath the project do:

```sh

R -e ``rmarkdown::render(``/home/rstudio/project/scripts/demo.Rmd'' \
                         , output_file = ``YYYYMMDD_demo.pdf'' \
                         , output_dir = ``/home/rstudio/project/results'')''

```

For more flexibity in using this command type:

```sh
run_docker -h
```

- Rstudio interface is also available. Just invoke the following command in the terminal:

```sh
run_docker
```

then point your browser to the URL http://localhost:8787. Type the username
`rstudio` and password `123456`. This will land you in an RStudio interface with
_project_ directory visible under the _Files_. Navigate to `project > scripts`
and click to open the document "demo.Rmd". Click `knit` to knit the document
and then move the resulting report "demo.pdf" to the "results" folder and
rename it to "`date`_demo.pdf". 

# Best practices

Name the resulting report in the format "`Date`_`ReportName`.pdf". Here `Date`
is in the format _YYYYMMDD_ and `ReportName` is any alphanumeric identifier. The
advantages of naming this way is that sorting reports is easy and ability to
quickly identify the report by the date it was generated.
