
well <- list(
          well6 = list(r = 2, b = 3, n = 6),
          well24 = list(r = 4, b = 6, n = 24),
          well48 = list(r = 6, b = 8, n = 48),
          well96 = list(r = 8, b = 12, n = 96),
          well384 = list(r = 16, b = 24, n = 384)
          )

order <- c("row_wise", "col_wise", "random")

create_treatment <- function(type_well, rep) {

  plate_trt <- paste("trt", rep(seq(1:(well[[type_well]][['n']]/rep)), rep), sep = "_")
  extra <- well[[type_well]][['n']] - length(plate_trt)
  plate_trt <- c(plate_trt, rep("empty", times = extra))

  return(plate_trt)
}

create_template <- function(type_well, treatments = NULL, rep = 1, order = "row_wise") {

  plate_row <- LETTERS[1 : well[[type_well]][['r']]]
  plate_col <- sprintf("%02d", seq(1:well[[type_well]][['b']]))

  df_temp <- expand.grid(row = plate_row, col = plate_col)
  df_temp$well <- paste(df_temp$row, df_temp$col, sep = "")

  if (is.null(treatments) == TRUE) {
    plate_trt <- create_treatment(type_well, rep)
  } else {
    plate_trt <- rep(treatments, length.out = nrow(df_temp))
  }

  if (isTRUE(order == "row_wise")) {
    plate_trt <- plate_trt[order(plate_trt)]

  } else if (isTRUE(order == "col_wise")) {
    plate_trt <- plate_trt[order(levels(df_temp$row))]

  } else {
    plate_trt <- sample(plate_trt, size = length(plate_trt))

  }

  df_temp$trt <- plate_trt

  return(df_temp)
}
