#' Determine if largest clone frequency is above background
#'
#' @param clonsum 
#'
#' @return
#' @export
#'
#' @examples
overbackground_tcr <- function(clonesum){
  freq = as.numeric(clonesum[which(clonesum$rank == 1),]$frequency)
  bkgrnd = clonesum[which(clonesum$rank == 5),]$frequency
  return(freq/bkgrnd)
}

#' Determine if largest clone frequency is above background
#'
#' @param clonesum 
#'
#' @return
#' @export
#'
#' @examples
overbackground_bcr <- function(clonesum){
  freq = as.numeric(clonesum[which(clonesum$rank == 1),]$frequency)
  bkgrnd = clonesum[which(clonesum$rank == 3),]$frequency
  return(freq/bkgrnd)
}



fast = lapply(testfiles, clonesum_read)
sapply(fast, overbackground_bcr)

