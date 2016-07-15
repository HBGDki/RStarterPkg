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

## Documentation

# Documentation

The R package ``roxygen2`` will be used to automatically generate the LaTeX man folder R documentation.  ``roxygen2`` is great for keeping your documentation directly next to your function.  All ``roxygen2`` elements start their line with a comment immediately followed by an apostrophe `#'`.


A good example of documentation can be seen in the [`hbgd` package WHO stadards](https://github.com/HBGDki/hbgd/blob/master/R/standard_who.R#L1).  The documentation has the following structure
* The first line is the title.
* The third line is the general description. (This may be many lines long)
* Each parameters state the parameter, then the description of the parameter
* The examples contains valid R code until the next tag or end of the ``roxygen2`` comments
* If the function is to be exported (visible to users of your package), the `@export` tag is used
* If multiple functions are to use the same documentation, use the `@rdname` tag
* A full explanation about the ``roxygen2`` package [can be found here](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html).
```
#' Convert WHO z-scores/centiles to anthro measurements (generic)
#'
#' Get values of a specified measurement for a given WHO centile/z-score and growth standard pair (e.g. length vs. age) and sex over a specified grid
#'
#' @param x vector specifying the values of x over which to provide the centiles for y
#' @param p centile or vector of centiles at which to compute values (a number between 0 and 100 - 50 is median)
#' @param y_var y variable name (typically "htcm" or "wtkg") that specifies which variable of values should be returned for the specified value of q - see details
#' @param x_var x variable name (typically "agedays") - see details
#' @param sex "Male" or "Female"
#' @param data optional data frame that supplies any of the other variables provided to the function
#' @details for all supported pairings of \code{x_var} and \code{y_var}, type \code{names(who)}
#' @seealso \code{\link{who_value2centile}}, \code{\link{who_value2zscore}}
#' @examples
#' # median height vs. age for females
#' x <- seq(0, 365, by = 7)
#' med <- who_centile2value(x)
#' plot(x, med, xlab = "age in days", ylab = "median female height (cm)")
#'
#' # 99th percentile of weight vs. age for males from age 0 to 1461 days
#' dat <- data.frame(x = rep(seq(0, 1461, length = 100), 2),
#'   sex = rep(c("Male", "Female"), each = 100))
#' dat$p99 <- who_centile2value(x, p = 99, y_var = "wtkg", sex = sex, data = dat)
#' lattice::xyplot(kg2lb(p99) ~ days2years(x), groups = sex, data = dat,
#'   ylab = "99th percentile weight (pounds) for males",
#'   xlab = "age (years)", auto.key = TRUE)
#' @export
#' @rdname who_centile2value
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


## Vignettes

Once a package is passing CRAN checks and is ready for deployment, we need some documentation to tell a real world story or example that the package solves.  
@HBGDki has created an R package called `packagedocs`.  All @HBGDki R packages will use `packagedocs` to produce two vignettes: `index.Rmd` and `rd.Rmd`.  Both vignettes can be initialized `packagedocs` with:

```{r}
packagedocs::init_vignettes()
```

`index.Rmd` is to tell your story.  It may contain any content or R code that you would like.  

`rd.Rmd` is a shell wrapper for your R documentation.  A third file will be generated called `rd_index.Rmd`.  This file will contain the basic structure for `rd.Rmd`.  

With these generated files, your package will now have two vignettes!  Please visit [HBGDki/packagedocs](https://github.com/HBGDki/packagedocs) for more information.
