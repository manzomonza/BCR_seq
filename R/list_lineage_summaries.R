# LIST LINEAGE SUMMARIES

#' List only lineage summaries in directory
#'
#' @param filedir
#'
#' @return Return filevector of lineage summaries actively excluding 'downsample' files
#' @export
#'
#' @examples
list_lineage_summaries = function(filedir){
  filevector = list.files(path = filedir, pattern = ".*lineage_summary.csv",
                          recursive = TRUE, full.names = TRUE)
  filevector = grep("downsampl", filevector, invert = TRUE, value = TRUE)
  return(filevector)
}


