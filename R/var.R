#' Internal data for platemapr
#'
#' @description Internal variables used across various functions in platemapr.
#' well is a list of different microtitre well plate types with their
#' corresponding specifications.
#' order is a vector with three objects to order templates row-wise, column-wise
#' or at random
#' @keywords internal

well <- list(
  well6 = list(r = 2, b = 3, n = 6),
  well24 = list(r = 4, b = 6, n = 24),
  well48 = list(r = 6, b = 8, n = 48),
  well96 = list(r = 8, b = 12, n = 96),
  well384 = list(r = 16, b = 24, n = 384)
)

order <- c("row_wise", "col_wise", "random")
