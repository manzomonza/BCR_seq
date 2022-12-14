filepath_to_html_name <- function(filename){
  filename <- gsub(".clone_summary.csv",'', filename)
  sampleID = filename
  sampleID = rev(unlist(stringr::str_split(sampleID, pattern = '/', simplify = FALSE)))[1]
  date_string = gsub("-",'',Sys.Date())
}


