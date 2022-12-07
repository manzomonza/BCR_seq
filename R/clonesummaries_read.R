# Create function to read clone summaries

#' Read  clone summary file
#'
#' @param filepath 
#'
#' @return
#' @export
#'
#' @examples
clonesum_read <- function(inputpath){
  if(length(list.files(inputpath) == 0)){
    stop(paste0("Empty string"))
  }else{
  clonesum = data.table::fread(inputpath)
  clonesum = janitor::clean_names(clonesum)
  return(clonesum)
  }
}

