test_that("Create a 6-well template", {

  rep <- 2
  df <- base::expand.grid(row = LETTERS[1:2], col = sprintf("%02d", seq(1:3)))
  df$well <- paste(df$row, df$col, sep = "")
  df$trt <- c("trt_1", "trt_1", "trt_2", "trt_2", "trt_3", "trt_3")

  expected <- df
  actual <- create_template(type_well = "well6", rep = rep, order = "row_wise")

  expect_equal(expected, actual)

})

test_that("Create a 6-well plate with known treatments", {

  trt <- c("control", "groupA")
  rep <- 2
  df <- base::expand.grid(row = c("A", "B"), col = c("01", "02", "03"))
  df$well <- paste(df$row, df$col, sep = "")
  df$trt <- c("control", "control", "control", "groupA", "groupA", "groupA")

  expected <- df
  actual <- create_template(type_well = "well6", trt, rep = rep, order = "row_wise")
  expect_equal(expected, actual)

})
