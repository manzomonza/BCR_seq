# Top total counts

total_counts <- function(clone_summary, rank){
  require(magrittr)
  total_counts = clone_summary %>% 
    dplyr::filter(rank %in% rank) %>% 
    dplyr::group_by(rank) %>% 
    dplyr::summarise(sum_total_counts = sum(total_counts))
  
  return(rank_counts)
}

total_counts(clonesum_read(testfiles[1]))
