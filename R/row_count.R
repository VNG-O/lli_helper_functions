#' Counts the number of rows in a data object
#' 
#' This function can be used with a remote data source.
#' @param .data The data source.
#' 
#' @return Number
#' @export
row_count <- function(.data) {
  .data %>% tally %>% pull
}