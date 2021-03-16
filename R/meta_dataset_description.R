#' OSN dataset meta description
#'
#' @param .ds OSN dataset 
#' @param .yr year of observation
#'
#' @return
#' @export
#'
meta_dataset_description <- function(.ds, .yr){
  flts <- nrow(.ds)
  adep_ades <- .ds %>% filter(!is.na(origin) & !is.na(destination)) %>% nrow()
  adep_na   <- .ds %>% filter(is.na(origin))      %>% nrow()
  ades_na   <- .ds %>% filter(is.na(destination)) %>% nrow()
  min_day   <- min(.ds$day)
  max_day   <- max(.ds$day)
  
  return(data.frame(
      YEAR = .yr
    , MIN_DAY   = min_day 
    , MAX_DAY   = max_day
    , FLTS = flts
    , ADEP_ADES = adep_ades
    , NA_ADEP   = adep_na
    , NA_ADES   = ades_na
    )
    )
}