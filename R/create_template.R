#' Title
#'
#' @param type_well
#' @param treatments
#' @param rep
#' @param order
#'
#' @return
#' @export
#'
#' @examples
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
