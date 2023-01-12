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



#' Retrieve the division result of i and jth clone
#'
#' @param clonesum
#'
#' @return Return Frequency and sequence of top clone
#' @export
#'
#' @examples
topClone_analysis_lineage = function(clonesum, i, j){
  freq_nom = as.numeric(clonesum[i,]$lineage_frequency)
  freq_denom = as.numeric(clonesum[j,]$lineage_frequency)
  freq = freq_nom/freq_denom
  freq = round(freq, digits = 2)
  return(freq)
}


