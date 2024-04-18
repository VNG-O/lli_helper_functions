#' Formatting a string
#' 
#' Formatting a string with built in format parameters to streamline having to perform multiple operations.
#' @param string The input string to be formatted.
#' @param upper A boolean which indicates if you want the output to be upper-case.
#' @param only_alpha_numeric A boolean which indicates if you want the output to only contain alpha-numeric characters.
#' @param strip_ws A boolean which indicates if you want to strip white space from the output.
#'
#' @return String
#' @export
format_string <- function(string,
                          upper = TRUE,
                          only_alpha_numeric = TRUE,
                          strip_ws = TRUE) {
  
  if (upper) {
    string <- toupper(string)
  }
  
  if (only_alpha_numeric) {
    string <- str_replace_all(string, "[^0-9A-Za-z]", "")
  }
  
  if (strip_ws) {
    string <- gsub(" ", "", string, fixed = TRUE)
  }
  
  return(string)
}