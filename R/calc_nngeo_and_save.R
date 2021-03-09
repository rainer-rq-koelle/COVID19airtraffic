#' Nearest neighbour and temp save for purrr iteration
#' 
#' Wrapper function to have the (i) nearest neighbour and (ii) save while 
#' iterating over large dataset. This is to reduce the risk of loosing the
#' work, if things fail or are switched off :)
#' The OSN data set for 2019 is about 7 mio flights without id for lat/lon.
#' That runs for days ... 
#'
#' @param .sf_pts sf dataframe of lat/lon
#' @param .poly world polygons
#' @param .prefix any code for the tmp folder
#' @param .pth path to store temp files
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#'  calc_nngeo_and_save(sf_pts, world, "DEP)
#'  }
calc_nngeo_and_save<-function(.sf_pts, .poly, .prefix, .pth = pth, ...){
  # my variables
  sf_pts <- .sf_pts
  poly   <- .poly
  # kicking off nngeo
  df <- check_nngeo(sf_pts, poly)
  # saving out results
  save_tmp(df, .prefix = .prefix, .pth = .pth)
}