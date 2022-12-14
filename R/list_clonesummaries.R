#' List only clonesummaries in directory
#'
#' @param filedir 
#'
#' @return
#' @export
#'
#' @examples
only_clonesummaries = function(filedir){
  filevector = list.files(path = filedir, pattern = ".*clone_summary.csv")
  return(filevector)
}


