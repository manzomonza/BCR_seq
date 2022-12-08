# TCR/BCR report decision

# Aggregate file info

#' Extract info from clone summary and convert to dataframe
#'
#' @param listoffiles 
#'
#' @return
#' @export
#'
#' @examples
panel_dataframe <- function(listoffiles){
  filecheck = lapply(listoffiles, path_to_info)
  filecheck = dplyr::bind_rows(filecheck)
  return(filecheck)
}


#' Check number of entries in panel dataframe, concordance in panel and discordance in indeces
#'
#' @param panel_df 
#'
#' @return
#' @export
#'
#' @examples
check_panel_dataframe <- function(panel_df){
  if(nrow(panel_df) == 2){
    panel_match = panel_df$panel[1] == panel_df$panel[2]
  }else if(nrow(panel_df) < 2){
    stop("insufficient clone summaries")
  }else{
    panel_group = dplyr::group_by(panel_df, panel)
    panel_group = dplyr::group_split(panel_group)
    return(list(lapply(panel_group, check_panel_dataframe)))
    }
  if(panel_match){
    index_mismatch = panel_df$index[1] != panel_df$index[2]
  }else{
    stop("Discordant lymphocyte sequencing panels")
  }
  if(index_mismatch){
    return(panel_df)
  }
}



