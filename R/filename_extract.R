#' Extract common string from filenames
#'
#' @param filevector 
#'
#' @return
#' @export
#'
#' @examples banana AND ananas -> anana
filename_extract <- function(file1, file2){
  i = 10
  #print(file1)
  while(i <=(nchar(file2))){
    testme = substr(file1, start = 1,stop =i)
    test_substring = stringr::str_detect(file2, testme)
    #print(test_substring)
    if(test_substring){
      i = i+1
    }else{
      return(testme)
    }
  }
}

