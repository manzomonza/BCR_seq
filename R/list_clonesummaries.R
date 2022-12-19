#' List only clonesummaries in directory
#'
#' @param filedir 
#'
#' @return Return filevector of clone summaries actively excluding 'downsample' clonesummaries
#' @export
#'
#' @examples
only_clonesummaries = function(filedir){
  filevector = list.files(path = filedir, pattern = ".*clone_summary.csv",
                          recursive = TRUE, full.names = TRUE)
  filevector = grep("downsampl", filevector, invert = TRUE, value = TRUE)
  
  return(filevector)
}



