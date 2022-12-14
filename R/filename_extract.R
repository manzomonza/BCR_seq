#' Extract common string from filenames
#'
#' @param filevector 
#'
#' @return substring present in both filestrings
#' @export
#'
#' @examples banana AND ananas -> anana
#' will fail with more than two strings
filename_extract <- function(filestr1, filestr2){
  filestr1 = gsub(".clone_summary.csv",'',filestr1)
  filestr2 = gsub(".clone_summary.csv",'',filestr2)
  filestr1 = basename(filestr1)
  filestr2 = basename(filestr2)
  i = nchar(filestr2)-10
  while(i <=(nchar(filestr2))){
    testme = substr(filestr2, start = 1,stop =i)
    test_substring = stringr::str_detect(filestr1, testme)
    #print(testme)
    if(test_substring){
      i = i+1
    }else{
      return(substr(testme, start = 1, stop = i-1))
    }
  }
  return(testme)
}
