#' Determine majority (mode) of categorical variables in data frame
#' 
#' credits to https://stackoverflow.com/questions/55758611/how-to-find-the-most-frequent-value-from-multiple-columns-in-a-dataframe
#'
#' @param x vector of values
#'
#' @return
#' @export
#'
calculate_mode <- function(x) {
  uniqx <- unique(na.omit(x))
  uniqx[which.max(tabulate(match(x, uniqx)))]
}