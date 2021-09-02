## draw_inimet function
## function to write initiator methionine on top of a drawProteins plot

draw_initmet <- function (p, data = data, label_domains = TRUE, label_size = 4, 
                          show.legend = TRUE, type = "INIT_MET") 
{
                    begin = end = description = NULL
                    p <- p + ggplot2::geom_rect(data = data[data$type == type, 
                    ], mapping = ggplot2::aes(xmin = begin, xmax = end, ymin = order - 
                                                                  0.25, ymax = order + 0.25, fill = "Initiator Methionine"), show.legend = show.legend)
                    if (label_domains == TRUE) {
                                        p <- p + ggplot2::geom_label(data = data[data$type == 
                                                                                                     type, ], ggplot2::aes(x = begin + (end - begin)/2, 
                                                                                                                           y = order, label = description), size = label_size)
                    }
                    return(p)
}