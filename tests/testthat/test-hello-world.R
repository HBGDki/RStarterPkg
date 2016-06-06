

# all files that start with "test-" will be executed.


library(hbgd)
context("hello world")

test_that("hello", {
  expect_equal(world(), "world")

  expect_equal(hello(), "world!")
  expect_equal(hello("example"), "example!")
  expect_equal(hello(""), "!")

})



# when testing, this context will be displayed
context("testing context")

# when errors occur, this sub context will help you determine which bug is broken
test_that("sub context", {

  # when a valid expect_* is exectued, a green dot will appear while testing
  expect_true(TRUE)
})

test_that("bad example", {

  # when a test fails, user will be notified
  expect_true(TRUE)
  expect_true(TRUE)
  expect_true(TRUE)
  expect_true(TRUE)
  expect_true(TRUE)
  expect_true(FALSE) # <--- FAILS!
})
