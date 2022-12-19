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
  freq = clonesum[which(clonesum$rank == 1)]$frequency
  freq = as.numeric(freq)
  freq = round(freq*100, 1)
  return(freq)
}


