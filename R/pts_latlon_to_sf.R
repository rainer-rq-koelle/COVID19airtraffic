#' Coerce lat/lon points to sf
#'
#' @param .ds tibble of lat/lon pointsc, must have id column!
#' @param .lat_var latitude variable
#' @param .lon_var longitude variable
#'
#' @return sf object with points coerced to geometry
#' @export
#'
#' @examples
#' \donotrun{
#' pts_latlon_to_sf(my_pts_tibble, lat, lon)
#' }
pts_latlon_to_sf <- function(.ds, .lat_var, .lon_var, .remove = TRUE){
  df <- .ds %>% 
    dplyr::select(id, icao24, {{.lat_var}},{{.lon_var}})
  
  lat_name <- deparse(substitute(.lat_var))
  lon_name <- deparse(substitute(.lon_var))
  df <- df %>% sf::st_as_sf(coords = c(lon_name, lat_name), crs=4326, remove = .remove)
  return(df)
}