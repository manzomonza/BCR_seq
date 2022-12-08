# Filepath to dataframe

path_to_info <- function(filepath){
  clonsum = clonesum_read(filepath)
  dfoi = data.frame(filepath = filepath)
  dfoi$panel_char = check_seq_panel(clonsum)
  dfoi$panel = clonesummary_panel(dfoi$panel_char)
  dfoi$index = clonesummary_index(dfoi$panel_char)
  return(dfoi)
}

listme = lapply(testfiles, path_to_info)
length(listme)

dplyr::bind_rows(listme)
