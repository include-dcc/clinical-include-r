
<!-- README.md is generated from README.Rmd. Please edit that file -->

# INCLUDE Shiny Template

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

Welcome to INCLUDE. This repository will serve as a guide for developing
shiny applications and contains the most basic golem shiny application
structure.

## Installation

You can install the released version of includeshinytemplate from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("includeshinytemplate")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("include-dcc/include-shiny-template")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(includeshinytemplate)
#> Error in get(genname, envir = envir) : object 'testthat_print' not found
## basic example code
```

## Developmental Guide

In this shiny application template we try to follow the guidelines
described by Engineering Production-Grade Shiny Apps:
<https://engineering-shiny.org/index.html>. In particular we utilize
tools such as `golem` and `renv` to build our shiny application. The
steps described below can all be found in more detail in the shiny
engineering link above.

1.  Create Golem Shiny App: `golem::create_golem()` as documented
    [here](https://engineering-shiny.org/setting-up-for-success.html#create-a-golem)

2.  Utilize
    [renv](https://engineering-shiny.org/build-yourself-safety-net.html#renv)
    to set up your R environment

3.  Update readme by modifying README.Rmd (not README.md):
    
        devtools::build_readme()

4.  Add golem modules. You will most likely want to remove
    `mod_hello_world.R` and add your own golem module. Be sure to add to
    `app_ui.R` and `app_ui.R` to use your module. More information
    [here](https://engineering-shiny.org/build-app-golem.html#submodules-and-utility-functions)
    
        golem::add_module( name = "hello_world" )

5.  Add tests. More information
    [here](https://engineering-shiny.org/build-app-golem.html#add-tests)
    
        usethis::use_test( "app" )

6.  Need to use Python? Use
    [reticulate](https://rstudio.github.io/reticulate/) Be sure to use
    either `conda` or `pipenv` to manage your Python dependencies.

7.  The CI/CD for this repository is done through github actions and
    consists of 3 major steps. The file is located at
    .github/workflows/ci.yaml
    
      - test: Testing of the shiny package
      - docker: This section is commented out ci.yaml but you can choose
        to un-comment it out if you want to use this.
      - deploy: Upload this to CAVATICA project so it can be used in
        data cruncher.
