#' Coalesce columns of dataframe
#' 
#' Coalesce any number of columns of a dataframe. The columns are determined using regex.
#' @param .data The data source.
#' @param .name_to The name of the new column.
#' @param .cols <tidy-select> Columns to transform.
#' @param .keep Control which columns from .data are retained in the output. Grouping columns and columns created by ... are always kept.
#'
#' * "all" retains all columns from .data. This is the default.
#'
#' * "used" retains only the columns used in ... to create new columns. This is useful for checking your work, as it displays inputs and outputs side-by-side.
#'
#' * "unused" retains only the columns not used in ... to create new columns. This is useful if you generate new columns, but no longer need the columns used to generate them.
#'
#' * "none" doesn't retain any extra columns from .data. Only the grouping variables and columns created by ... are kept.
#' 
#' @return A mutated data frame.
#' @export
coalesce_across <- function(.data, .name_to, .cols, .keep = "unused") {
  expr <- rlang::enquo(.cols)
  pos <- tidyselect::eval_select(expr, data = .data)
  
  .data %>% 
    dplyr::mutate("{.name_to}" := do.call(dplyr::coalesce, dplyr::across(pos)),
           .keep = .keep)
}