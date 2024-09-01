#' Title
#'
#' @param type_well
#' @param rep
#'
#' @return
#' @export
#'
#' @examples
create_treatment <- function(type_well, rep) {

  plate_trt <- paste("trt", rep(seq(1:(well[[type_well]][['n']]/rep)), rep), sep = "_")
  extra <- well[[type_well]][['n']] - length(plate_trt)
  plate_trt <- c(plate_trt, rep("empty", times = extra))

  return(plate_trt)
}
