test_that("Create list of treatments without names", {

  rep <- 3
  trt <- rep(seq(1:(6/rep)), rep)
  expected <- paste("trt", trt, sep = "_")

  actual <- create_treatment("well6", 3)

  expect_equal(expected, actual)

})
