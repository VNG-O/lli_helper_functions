format_string <- function(string, upper = TRUE, strip_punc = TRUE, strip_ws = TRUE, strip_comma = TRUE) {
  
  if (upper) {
    string = toupper(string)
  }
  
  if (strip_punc) {
    string = str_replace_all(string, "[[:punct:]]", "")
  }
  
  if (strip_comma) {
    string = str_replace_all(string, ",", "")
  }
  
  if (strip_ws) {
    string = gsub(" ", "", string, fixed = TRUE)
  }
  
  return(string)
}