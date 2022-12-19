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
  clonesum = clonesum[which(clonesum$rank == 1)]
  return(clonesum)
}
