# TCR/BCR report decision

# Aggregate file info

# Filepath to dataframe

path_to_info <- function(filepath){
  clonsum = clonesum_read(filepath)
  dfoi = data.frame(filepath = filepath)
  dfoi$panel_char = check_seq_panel(clonsum)
  dfoi$panel = clonesummary_panel(dfoi$panel_char)
  dfoi$index = clonesummary_index(dfoi$panel_char)
  return(dfoi)
}

#' Extract info from clone summary and convert to dataframe
#'
#' @param filevector 
#'
#' @return
#' @export
#'
#' @examples
panel_dataframe <- function(filevector){
  panel_df = lapply(filevector, path_to_info)
  panel_df = dplyr::bind_rows(panel_df)
  return(panel_df)
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
    # potentially error prone as for combo of 2 BCR and TCR whole function call would stop
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

#' Returns string for panel based on panel dataframe.
#' Will be used to trigger correct reporting in LymphoyteSeq_report render script.
#'
#' @param panel_df 
#'
#' @return string
#' @export
#'
#' @examples
panel_decision <- function(panel_df){
  panel = unique(panel_df$panel)
  if(panel == "TCR"){
    return("TCR")
  }else if(panel == "BCR"){
    return("BCR")
  }else{
    stop("panel without reporting yet")
  }
}

