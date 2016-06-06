

# Keep this test to passively check for coding style
if (requireNamespace("lintr", quietly = TRUE)) {
  context("lints")
  test_that("Package Style", {
    lintr::expect_lint_free(cache = TRUE)
  })
}
