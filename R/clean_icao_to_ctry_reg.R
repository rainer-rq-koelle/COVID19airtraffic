icao_to_ctry_reg <- function(.ds, .origin = origin, .destination = destination){
  df <- .ds %>%
  mutate( ADEP_CTRY = stringr::str_sub({{.origin}}, 1,2)
          ,ADEP_REG  = stringr::str_sub({{.origin}}, 1,1)
          ,ADES_CTRY = stringr::str_sub({{.destination}}, 1, 2)
          ,ADES_REG  = stringr::str_sub({{.destination}}, 1, 1)
  )
  return(df)
}

clean_icao_ctry <- function(
  .ds
  ,.icao_singles = c("C","K","Y","Z")  # single letter countries
  ,.icao_non_russia = c("UA","UB","UC","UD","UG","UK","UM","UT") # non Russia
){
  df <- .ds %>%
    mutate( 
      ADEP_CTRY = case_when(  #------------ ADEP correction ---------------
                              ADEP_REG %in% .icao_singles ~ str_sub(origin, 1,1)
                              ,ADEP_REG == "U" & !(ADEP_CTRY %in% .icao_non_russia) ~ "U" 
                              , TRUE ~ ADEP_CTRY
      ) 
      
      ,ADES_CTRY = case_when( #------------ ADES correction ---------------
                              ADES_REG %in% .icao_singles ~ str_sub(origin, 1,1)
                              ,ADES_REG == "U" & !(ADES_CTRY %in% .icao_non_russia) ~ "U" 
                              , TRUE ~ ADES_CTRY
      )
    ) # end mutate -------------
  return(df)
}