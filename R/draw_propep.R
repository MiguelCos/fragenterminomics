## function to draw propeptides location 

## same format as is in the drawProteins package 

draw_propep <- function (p, data = data, label_domains = TRUE, label_size = 4, 
                         show.legend = TRUE, type = "PROPEP") 
{
                    begin = end = description = NULL
                    p <- p + ggplot2::geom_rect(data = data[data$type == type, 
                    ], mapping = ggplot2::aes(xmin = begin, xmax = end, ymin = order - 
                                                                  0.25, ymax = order + 0.25, fill = "Propeptide"), show.legend = show.legend)
                    if (label_domains == TRUE) {
                                        p <- p + ggplot2::geom_label(data = data[data$type == 
                                                                                                     type, ], ggplot2::aes(x = begin + (end - begin)/2, 
                                                                                                                           y = order, label = description), size = label_size)
                    }
                    return(p)
}