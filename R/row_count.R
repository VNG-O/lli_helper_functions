row_count <- function(.data) {
  .data %>% tally %>% pull
}