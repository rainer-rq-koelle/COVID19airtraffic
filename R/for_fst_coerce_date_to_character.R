#' Coerce timestamps to write out to fst
#' 
#' Utility function to ensure character string for fst (binary file format).
#'
#' @param .ds Opensky-Network flight table with day, firstseen, and lastseen
#'
#' @return tibble with coerced timestamps
#' @export
#'
for_fst_coerce_date_to_character <- function(.ds){
  # check and coerce day
  if(class(ds$day) != "character"){
    .ds <- .ds %>% mutate(day = as.character(day)) 
  }
  # check and coerce lastseen
  if(class(ds$lastseen) != "character") {
    .ds <- .ds %>% mutate(lastseen = as.character(lastseen)) 
  }
  # check and coerce firstseen
  if(class(ds$firstseen) != "character") {
    .ds <- .ds %>% mutate(firstseen = as.character(firstseen)) 
  }
  return(.ds)
}