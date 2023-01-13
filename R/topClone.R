# clone analysis

#' Top Clone
#'
#' @param clonesum
#'
#' @return Return Frequency and sequence of top clone
#' @export
#'
#' @examples
topClone = function(clonesum){
  freq = clonesum[which(clonesum$rank == 1),]$frequency
  freq = as.numeric(freq)
  freq = round(freq*100, 1)
  return(freq)
}

#' Retrieve the division result of i and jth clone frequencies
#'
#' @param clonesum
#'
#' @return Return Frequency and sequence of top clone
#' @export
#'
#' @examples
topClone_analysis_clonesum = function(clonesum, i, j){
  freq_nom = as.numeric(clonesum[i,]$frequency)
  freq_denom = as.numeric(clonesum[j,]$frequency)
  ratio = freq_nom/freq_denom
  ratio = round(ratio, digits = 2)
  return(data.frame(nom = freq_nom,
              denom = freq_denom,
              ratio = ratio))
}


#' Retrieve the division result of i and jth clone
#'
#' @param clonesum
#'
#' @return Return Frequency and sequence of top clone
#' @export
#'
#' @examples
topClone_analysis_lineage = function(lineage, i, j){
  freq_nom = as.numeric(lineage[i,]$lineage_frequency)
  freq_denom = as.numeric(lineage[j,]$lineage_frequency)
  ratio = freq_nom/freq_denom
  ratio = round(ratio, digits = 2)
  return(data.frame(nom = freq_nom,
              denom = freq_denom,
              ratio = ratio))
}

#' Return top25 clones of lineage summaries formatted for presentation in Data Table
#'
#' @param lineage_file
#'
#' @return
#' @export
#'
#' @examples
top25_lineage_selection <- function(lineage_file){
  selection = head(lineage_file, n = 25) %>%
    dplyr::select(lineage_id, variable,top_cdr3aa,lineage_frequency,number_of_clones)
  selection$lineage_frequency = round(selection$lineage_frequency, digits = 3)
  colnames(selection) = gsub("_", " ",stringr::str_to_title(colnames(selection)))
  return(selection)
}

' Return top25 clones of lineage summaries formatted for presentation in Data Table
#'
#' @param lineage_file
#'
#' @return
#' @export
#'
#' @examples
top25_lineage_selection_tcr <- function(lineage_file){
  selection = head(lineage_file, n = 25) %>%
    dplyr::select(variable, joining, cdr3_aa, frequency, total_counts)
  selection$frequency = round(selection$frequency, digits = 3)
  colnames(selection) = gsub("_", " ",stringr::str_to_title(colnames(selection)))
  return(selection)
}



#' Return top25 clones of clone summaries formatted for presentation in Data Table
#'
#' @param clonesum
#'
#' @return
#' @export
#'
#' @examples
top25_clonesum_selection_bcr <- function(clonesum){
  selection = head(clonesum, n = 25) %>%
    dplyr::select(lineage_id, variable,joining,cdr3_aa,cdr3_nt,frequency, total_counts)
  selection$frequency = round(selection$frequency, digits = 3)
  colnames(selection) = gsub("_", " ",stringr::str_to_title(colnames(selection)))
  return(selection)
}
