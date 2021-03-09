#' save temp to store temporary results
#' 
#' This utility function saves temporary data prep results as fst into 
#' a given subfolder of path, i.e. tmp!
#' The function also coerces the sf object to a normal data frame by 
#' recovering the lat/lon and dropping the geometry. This allows the tibble
#' to be saved as fst (binary format).
#'
#' @param .ds processed tibble requiring an (additional) id colum
#' @param .prefix a tag to recall what data subset is processed, e.g. departure side (DEP)
#' @param .pth path to store the temp files while iterating
#'
#' @return no return as file will be written out to pth folder
#'    the function is chatty (ui_info)
#' @export
#'
#' @examples
#' \dontrun{} save_tmp(rq, .prefix = "DEP")
save_tmp <- function(.ds, .prefix, .pth = pth){
  max_id <- max(.ds$id)
  my_pth <- paste0(.pth, "tmp/", .prefix,"_", max_id)
  
  ds <- .ds %>%
    # extract lat lon; fst does not support sf (list colums)
    dplyr::mutate(lat = sf::st_coordinates(.)[,2],
                  lon = sf::st_coordinates(.)[,1]) %>%
    sf::st_set_geometry(NULL)
  
  fst::write_fst(ds, path = my_pth)
  usethis::ui_info(paste0("written to ", my_pth))
}

