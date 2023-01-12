# PLOT


clone_frequencies <- function(){}
clone_frequencies_vs_rank <- function(){}
strandbias <- function(){}

plot_prep <- function(summaryfile){
  sumfile =  summaryfile |>
    dplyr::mutate(top = if_else(rank == 1, TRUE, FALSE)) %>%
    dplyr::mutate(log2_strand = log2(plus_counts/ minus_counts))
  return(sumfile)
}

total_read_counts <- function(plot_prepped){
    gplot = ggplot(plot_prepped , aes(x=functionality, y=total_counts, color=top)) +
      geom_jitter(width=0.25, alpha=0.7, size=2.5)  +
      ggtitle("Total Read Counts") + theme(plot.title = element_text(size=12, face="bold"),
                                           axis.title.x = element_blank(),
                                           axis.title.y = element_text(),
                                           legend.position = "none")
    return(gplot)
}

