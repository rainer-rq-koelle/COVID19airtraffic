#' Replacing column values with leftjoin
#'
#' @param df 
#' @param df_subset 
#' @param id_col_names 
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#'  my_df %>% left_join_replace(replace_values, "my_id_variable")
#'  }
left_join_replace <- function(df, df_subset, id_col_names = c()) {
  
  # work out which of the columns contain "new" data
  new_data_col_names <- colnames(df_subset)[which(!colnames(df_subset) %in% id_col_names)]
  
  # complete the df_subset with the extra columns from df
  df_sub_to_join <- df_subset %>%
    left_join(select(df, -new_data_col_names), by = c(id_col_names))
  
  # join and bind rows
  df_out <- df %>%
    anti_join(df_sub_to_join, by = c(id_col_names)) %>%
    bind_rows(df_sub_to_join)
  
  return(df_out)
  
}