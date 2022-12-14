# List only panel specific filenames 

only_clonesummaries = function(filedir){
  filevector = list.files(path = filedir, pattern = ".*clone_summary.csv")
  return(filevector)
}

only_clonesummaries(dirname(testfiles[3]))


