#' Output total read counts
#'
#' @param clonesum
#'
#' @return
#' @export
#'
#' @examples
clone_i_freq = function(clonesum,i){
  freq = clonesum[i,]$frequency
  freq = round(freq, digits = 4)
  freq = freq * 100
  freq = paste0(freq,"%")
  return(freq)
}

#' Calculate Top clone enrichment of jth clone
#'
#' @param clonesum
#' @param j
#'
#' @return
#' @export
#'
#' @examples
top_ratio_to_x = function(clonesum, j){
  i = 1
  i_f = clonesum[i,]$frequency
  j_f = clonesum[j,]$frequency
  ratio = i_f/j_f
  ratio = round(i_f/j_f, digits = 2)
  return(ratio)
}


