# Use
R package skeleton.

Milestones for package development: [https://github.com/HBGDki/hbgdStatSummary/blob/master/Milestones.md](Milestones.md)

# Documentation

The R package ``roxygen2`` will be used to automatically generate LaTeX documentation.  A full explanation about the ``roxygen2`` package [can be found here](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html).

# R Package Checking

Check your package by running the following commands

```{r}
# generate code documentation
devtools::document()

# check code formatting
devtools::lint()

# run unit tests
devtools::test()

# check everything (R CMD check)
devtools::check()
```

## Travis-CI, Codecov, and Coding Style

[Travis-CI](travis-ci.org) is an passive testing service that downloads your R package dependencies and runs "R CMD check" on your github package.  It will also run all tests and upload code coverage statistics to [Codecov](https://codecov.io/gh).  This service will execute when github.com receives a code push.

Both Travis-CI and Codecov must be activated to work.  Activate your R package for Travis-CI at [https://travis-ci.org/profile] and your Codecov account at [https://codecov.io/gh].

We will check for coding style using the ``lintr`` package.  This test is already provided in ``tests/thestthat/test-lintr.R``. Please visit [jimhester/lintr](https://github.com/jimhester/lintr#project-configuration) for more information. "Most of the default linters are based on [Hadley Wickham's R Style Guide](http://r-pkgs.had.co.nz/style.html)."



# Installation

```r
options(repos = c(
  CRAN = "http://cran.rstudio.com/",
  tessera = "http://packages.tessera.io"))
install.packages("hbgd")
devtools::install_github("HBGDki/R_starter_pkg")

library(RStarterPkg)
```


# [GitHub Guides](https://guides.github.com/)

Short guides to help you get started using GitHub.

* [Understanding the GitHub Flow](https://guides.github.com/introduction/flow/)
   * 5 min read
   * Explains how and why you should use GitHub
* [Hello World Example](https://guides.github.com/activities/hello-world/)
  * 10 min read
  * Walk-through:
    * Create and use a repository
    * Start and manage a new branch
    * Make changes to a file and push them to GitHub as commits
    * Open and merge a pull request
* [GitHub Desktop](https://guides.github.com/introduction/getting-your-project-on-github/)
  * 5 min read
  * Point & click version of git
  * "GitHub Desktop is the easiest way to get code on GitHub.com. You won’t need to learn any command-line instructions, SSH keys, or complicated Git terminology. All you’ll need is your Mac or Windows computer and a GitHub.com account."
* [Forking a Project](https://guides.github.com/activities/forking/)
  * 4 min read
  * Walks through the steps to fork a project
* [Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
  * 3 min read
  * What you will learn:
    * How the Markdown format makes styled collaborative editing easy
    * How Markdown differs from traditional formatting approaches
    * How to use Markdown to format text
    * How to leverage GitHub’s automatic Markdown rendering
    * How to apply GitHub’s unique Markdown extensions

# Code of Conduct
Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
