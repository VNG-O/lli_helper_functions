#' Compare values for equality
#' 
#' Compare two vectors or factors but want comparisons with NA’s to be reported as TRUE or FALSE (instead of NA).
#' @return Boolean
#' @export
`%==na%` <- function(v1,v2) {
  same <- (v1 == v2) | (is.na(v1) & is.na(v2))
  same[is.na(same)] <- FALSE
  return(same)
}

#' Compare values for inequality
#' 
#' Compare two vectors or factors but want comparisons with NA’s to be reported as TRUE or FALSE (instead of NA).
#' @return Boolean
#' @export
`%!=na%` <- function(v1,v2) {
  same <- (v1 == v2) | (is.na(v1) & is.na(v2))
  same[is.na(same)] <- FALSE
  return(!same)
}