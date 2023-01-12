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


