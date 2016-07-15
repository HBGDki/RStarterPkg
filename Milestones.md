# Milestones

The following milestones must be met when collaborating with R in the HBGDki user group.

## Loading Package

The package must be able to be loaded with:

```{r}
devtools::load_all()
```

This is imperative to complete as daily package development depends on this functionality.

## Code Style

This milestone is kept near the top, as it must always be met.  Coding style is a very slippery slope and difficult to recover from with full confidence.  ("... did I fix all my name changes??")

Since caching is enabled when linting, it wont' take long to check for coding style.

```{r}
devtools::lint()
```

## Unit Tests and Package Coverage

### Testing

There are many different ways that unit testing may be approached.  It is of my belief unit tests should cover about 95% of all code (where possible).  
* If this can be done by only testing the top level functions, then great!
* If you do not believe testing the top level functions does not cover the full functionality, there is nothing wrong with adding more tests.

Tests should be labeled as `test-GENERAL-NAME.R` in the `tests/testthat` folder.  They should start with a context (`context("CONTEXT")`) and have tests that pertain to that context.  For more information on [https:://github.com/hadley/testthat](testthat, please visit hadley/testthat).

To help with adding a new test, use:

```{r}
devtools::use_test("GENERAL-NAME")
```

To test your package, run:

```{r}
devtools::test()
```

### Package Coverage

To check for package coverage within R, run the snippet below.  It may take a while, as it runs all of the package tests.
```{r}
cov <- covr::package_coverage(type = "test")
cov
```

To interactively look at your file coverage, run:
```{r}
covr::shine(cov)
```

To see where you have zero coverage, run:
```{r}
covr::zero_coverage(cov)
```

All three of these functions are very useful to reaching the 95% goal of package coverage

## R CMD check

To get a package on CRAN, a package must have
* 0 ERRORs
* 0 WARNINGs
* 0 NOTEs

... unless there is valid reason for something that is happening.  However, it is very difficult to have a valid reason for WARNINGs or NOTEs, especially ERRORs, to occur.  

To check for these marks, run:
```{r}
devtools::check()
```

This will run through CRAN's `R CMD check` as how CRAN checks for packages.  If, when the check is complete and there are no ERRORs, WARNINGs, or NOTEs, your package is ready for CRAN! Congratulations!
