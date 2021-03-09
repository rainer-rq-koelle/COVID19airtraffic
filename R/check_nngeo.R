#' check and assign potential geographic country to lat/lon position
#'
#' @param .sf_pts
#' @param .maxdist maximum distance in meters, e.g. 100km = 100000 
#'
#' @return
#' @export
#'
#' @examples
check_nngeo <- function(.sf_pts, .poly, .maxdist = 100000, ...){
  sf_pts <- .sf_pts %>% 
    sf::st_join(.poly, join = nngeo::st_nn, k = 1, maxdist = .maxdist)
  return(sf_pts)
}