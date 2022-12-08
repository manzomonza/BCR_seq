# Check clone summary input and assign index

#' Check amplicon panel used in
#'
#' @param clonesummary 
#'
#' @return
#' @export
#'
#' @examples
check_seq_panel <- function(file = clonesummary){
  decision = NA
  if(is.null(file$variable)){
    stop(paste0("Wrong clonesummary file"))
  }
  if(all(grepl("TRG", head(file$variable)))){
    decision = "TCR_gamma"
  }else if(all(grepl("TRB",head(file$variable)))){
    decision = "TCR_beta"
  }else if(all(grepl("IGH",head(file$variable)))){
    decision = "BCR_H"
  }else if(any(grepl("IGK",file$variable) | any(grepl("IGL",file$variable)))){
    decision = "BCR_K_L"
  }else{
    stop(paste0("Wrong clonesummary file"))
  }
  return(decision)
}



#' Indexing function to assign order for input files
#'
#' @param check_seq_panel_output 
#'
#' @return
#' @export
#'
#' @examples
clonesummary_panel <- function(charstring = check_seq_panel_output){
  if(charstring == "TCR_gamma"){
    panel = "TCR"
  }else if(charstring == "TCR_beta"){
    panel = "TCR"
  }
  else if(charstring == "BCR_H"){
    panel = "BCR"
  }
  else if(charstring == "BCR_K_L"){
    panel = "BCR"
  }
  return(panel)
}

#' Title
#'
#' @param charstring 
#'
#' @return
#' @export
#'
#' @examples
clonesummary_index <- function(charstring = check_seq_panel_output){
  if(charstring == "TCR_gamma"){
    index = 1
  }else if(charstring == "TCR_beta"){
    index = 2
  }
  else if(charstring == "BCR_H"){
    index = 1
  }
  else if(charstring == "BCR_K_L"){
    index = 2
  }
  return(index)
}


