# Create function to read clone summaries

#' Read  clone summary file
#'
#' @param filepath
#'
#' @return Read in clone summary with filepath as additional column
#' @export
#'
#' @examples
clonesum_read <- function(inputpath){
  clonesum = data.table::fread(inputpath)
  clonesum = janitor::clean_names(clonesum)
  clonesum$filepath = inputpath
  return(clonesum)
  }
}
