# PLOT


#' Plot clone frequencies vs productive/unproductive category
#'
#' @param plot_prepped
#'
#' @return
#' @export
#'
#' @examples
clone_frequencies_clonsum <- function(plot_prepped){
  gplot <- ggplot(plot_prepped, aes(x=functionality, y=frequency, color = top)) +
    geom_jitter(width=0.25, alpha=0.7, size=2.5) + ylim (0,0.50) +
    geom_hline(yintercept=0.1, linetype="dashed", color = "red", size=1) +
    geom_hline(yintercept=0.01, linetype="dashed", color = "blue",size=1) +
    ggtitle("Clone Frequency") + theme(plot.title = element_text(size=12, face="bold"),
                                       axis.title.x = element_blank(),
                                       axis.title.y = element_text(),
                                       legend.position = "none")
  return(gplot)
}

#' Plot lineage frequencies vs productive/unproductive category
#'
#' @param plot_prepped
#'
#' @return
#' @export
#'
#' @examples
clone_frequencies_lineage <- function(plot_prepped){
  gplot <- ggplot(plot_prepped, aes(x=functionality, y=lineage_frequency, color = top)) +
    geom_jitter(width=0.25, alpha=0.7, size=2.5) + ylim (0,0.50) +
    geom_hline(yintercept=0.1, linetype="dashed", color = "red", size=1) +
    geom_hline(yintercept=0.01, linetype="dashed", color = "blue",size=1) +
    ggtitle("Clone Frequency") + theme(plot.title = element_text(size=12, face="bold"),
                                       axis.title.x = element_blank(),
                                       axis.title.y = element_text(),
                                       legend.position = "none")
  return(gplot)
}


#' Prepare summary file for plotting
#'
#' @param summaryfile
#'
#' @return
#' @export
#'
#' @examples
plot_prep <- function(summaryfile){
  sumfile = summaryfile |>
    dplyr::mutate(top = ifelse(rank == 1, TRUE, FALSE)) %>%
    dplyr::mutate(log2_strand = log2(plus_counts/ minus_counts))
  return(sumfile)
}

#' Plot total read counts with productive/unproductive separation
#'
#' @param plot_prepped
#'
#' @return
#' @export
#'
#' @examples
total_read_counts <- function(plot_prepped){
    gplot = ggplot(plot_prepped , aes(x=functionality, y=total_counts, color=top)) +
      geom_jitter(width=0.25, alpha=0.7, size=2.5)  +
      ggtitle("Total Read Counts") + theme(plot.title = element_text(size=12, face="bold"),
                                           axis.title.x = element_blank(),
                                           axis.title.y = element_text(),
                                           legend.position = "none")
    return(gplot)
}

#' Plot clone frequencies vs rank -- clone summary file
#'
#' @param plot_prepped
#'
#' @return
#' @export
#'
#' @examples
clone_frequencies_vs_rank_clonesum <- function(plot_prepped){
  gplot<-ggplot(plot_prepped, aes(x=rank, y=frequency, color = top)) +
    geom_point() +
    scale_x_log10() +
  geom_hline(yintercept=0.01, linetype="dashed", size=1, color = "blue") +
  ggtitle("Clone Frequency versus Rank") + theme(plot.title = element_text(size=12, face="bold"),
                                                 legend.position = "none") +
  labs(x = "Rank", y="Frequency")
  return(gplot)
}

#' Plot clone frequencies vs rank -- lineage summary file
#'
#' @param plot_prepped
#'
#' @return
#' @export
#'
#' @examples
clone_frequencies_vs_rank_lineage <- function(plot_prepped){
  gplot<-ggplot(plot_prepped, aes(x=rank, y=lineage_frequency, color = top)) +
    geom_point() +
    scale_x_log10() +
    geom_hline(yintercept=0.01, linetype="dashed", size=1, color = "blue") +
    ggtitle("Clone Frequency versus Rank") + theme(plot.title = element_text(size=12, face="bold"),
                                                   legend.position = "none") +
    labs(x = "Rank", y="Frequency")
  return(gplot)
}



#' Plot Strand bias versus rank
#'
#' @param plot_prepped
#'
#' @return
#' @export
#'
#' @examples
strandbias_plot <- function(plot_prepped){
  gplot = plot_prepped %>%
  ggplot(aes(rank, log2_strand)) +
  geom_point(aes(col = top)) +
  scale_x_log10() +
  ggtitle("Strand bias") + theme(plot.title = element_text(size=12, face="bold"),
                                legend.position = "none")
  return(gplot)
}


