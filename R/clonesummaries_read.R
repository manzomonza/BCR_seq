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
  if(length(list.files(inputpath) == 0)){
    stop(paste0("Empty string"))
  }else{
  clonesum = data.table::fread(inputpath)
  clonesum = janitor::clean_names(clonesum)
  clonesum$filepath = inputpath
  return(clonesum)
  }
}
