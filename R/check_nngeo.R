#' check and assign potential geographic country to lat/lon position
#'
#' @param .sf_pts simple feature sf of position points (lat/lon)
#' @param .poly sf polygon(s) to verify whether points are in or next (.maxdist)
#'    from polygon (e.g. aircraft position over country or waters close by)
#' @param .maxdist maximum distance in meters, e.g. 100km = 100000 
#'
#' @return country code derived from .poly added to input sf_pts object
#' @export
#'
#' @examples
#' \dontrun{} check_nngeo(mysf, world)
check_nngeo <- function(.sf_pts, .poly, .maxdist = 100000, ...){
  # chatty function
  usethis::ui_info(paste0("crunching batch ", min(.sf_pts$id), "-", max(.sf_pts$id)))
  
  # perform spatial join for finding nearest (single) neighbour (k=1) with max distance 
  sf_pts <- .sf_pts %>%
    sf::st_join(.poly, join = nngeo::st_nn, k = 1, maxdist = .maxdist)
  return(sf_pts)
}