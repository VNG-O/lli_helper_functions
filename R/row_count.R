#' Counts the number of rows in a remote table
#' 
#' @export
row_count <- function(.data) {
  .data %>% tally %>% pull
}