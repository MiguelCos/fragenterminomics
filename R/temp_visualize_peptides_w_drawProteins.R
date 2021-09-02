# temp 

# Visualize location of acetylated peptides with drawProteins


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

draw_signal <- function (p, data = data, label_domains = TRUE, label_size = 4, 
                         show.legend = TRUE, type = "SIGNAL") 
{
                    begin = end = description = NULL
                    p <- p + ggplot2::geom_rect(data = data[data$type == type, 
                    ], mapping = ggplot2::aes(xmin = begin, xmax = end, ymin = order - 
                                                                  0.25, ymax = order + 0.25, fill = "Signal Peptide"), show.legend = show.legend)
                    if (label_domains == TRUE) {
                                        p <- p + ggplot2::geom_label(data = data[data$type == 
                                                                                                     type, ], ggplot2::aes(x = begin + (end - begin)/2, 
                                                                                                                           y = order, label = description), size = label_size)
                    }
                    return(p)
}
```

```{r}
#
prot_to_see <- "O43847"

# need list of proteins
prot_list <-  dplyr::distinct(count_info_75_acetyl)

# filter the peptides of this one protein
pep1 <- filter(prot_list, protein_id == prot_to_see)

# create the data frame for plotting the peptides
# select columns - need begin, end, length, accession, order
pep1_dP <- select(pep1, start_position, end_position, protein_id)
colnames(pep1_dP) <- c("begin", "end", "accession")
pep1_dP$order <- 1
pep1_dP$type <- "SEQ"

# download information
features <- drawProteins::get_features(prot_to_see) 
prot_data <- drawProteins::feature_to_dataframe(features) 

## ----using_draw_canvas, fig.height=3, fig.wide = TRUE-------------------------
p <- draw_canvas(prot_data) 

## ----using draw_chains, fig.height=3, fig.wide = TRUE-------------------------
p <- draw_chains(p, prot_data)
p <- draw_regions(p, prot_data)
p <- draw_signal(p, prot_data)

# I would like to offset the peptides.

pep1_dP$order <- 1.4

p + ggplot2::geom_rect(data = pep1_dP,
                       mapping=ggplot2::aes(xmin=begin,
                                            xmax=end,
                                            ymin=order-0.05,
                                            ymax=order+0.05),
                       colour = "black") +
                    #scale_fill_gradient(low = "white", high = "black") +
                    annotate("text", x = -50, y = 1.4, label = "Peptides") +
                    labs(title = prot_to_see) + 
                    theme_bw(base_size = 20) + # white background
                    theme(panel.grid.minor=element_blank(),
                          panel.grid.major=element_blank()) +
                    theme(axis.ticks = element_blank(),
                          axis.text.y = element_blank()) +
                    theme(panel.border = element_blank())

```

```{r}
#
prot_to_see <- "O60888"

# need list of proteins
prot_list <-  dplyr::distinct(count_info_75_acetyl)

# filter the peptides of this one protein
pep1 <- filter(prot_list, protein_id == prot_to_see)

# create the data frame for plotting the peptides
# select columns - need begin, end, length, accession, order
pep1_dP <- select(pep1, start_position, end_position, protein_id)
colnames(pep1_dP) <- c("begin", "end", "accession")
pep1_dP$order <- 1
pep1_dP$type <- "SEQ"

# download information
features <- drawProteins::get_features(prot_to_see) 
prot_data <- drawProteins::feature_to_dataframe(features) 

## ----using_draw_canvas, fig.height=3, fig.wide = TRUE-------------------------
p <- draw_canvas(prot_data) 

## ----using draw_chains, fig.height=3, fig.wide = TRUE-------------------------
p <- draw_chains(p, prot_data)
p <- draw_regions(p, prot_data)
p <- draw_signal(p, prot_data)

# I would like to offset the peptides.

pep1_dP$order <- 1.4

p + ggplot2::geom_rect(data = pep1_dP,
                       mapping=ggplot2::aes(xmin=begin,
                                            xmax=end,
                                            ymin=order-0.05,
                                            ymax=order+0.05),
                       colour = "black") +
                    #scale_fill_gradient(low = "white", high = "black") +
                    annotate("text", x = -50, y = 1.4, label = "Peptides") +
                    labs(title = prot_to_see) + 
                    theme_bw(base_size = 20) + # white background
                    theme(panel.grid.minor=element_blank(),
                          panel.grid.major=element_blank()) +
                    theme(axis.ticks = element_blank(),
                          axis.text.y = element_blank()) +
                    theme(panel.border = element_blank())
#P53004
```



```{r}
#
prot_to_see <- "P53004"

# need list of proteins
prot_list <-  dplyr::distinct(count_info_75_acetyl)

# filter the peptides of this one protein
pep1 <- filter(prot_list, protein_id == prot_to_see)

# create the data frame for plotting the peptides
# select columns - need begin, end, length, accession, order
pep1_dP <- select(pep1, start_position, end_position, protein_id)
colnames(pep1_dP) <- c("begin", "end", "accession")
pep1_dP$order <- 1
pep1_dP$type <- "SEQ"

# download information
features <- drawProteins::get_features(prot_to_see) 
prot_data <- drawProteins::feature_to_dataframe(features) 

## ----using_draw_canvas, fig.height=3, fig.wide = TRUE-------------------------
p <- draw_canvas(prot_data) 

## ----using draw_chains, fig.height=3, fig.wide = TRUE-------------------------
p <- draw_chains(p, prot_data)
p <- draw_regions(p, prot_data)
p <- draw_propep(p, prot_data)
p <- draw_domains(p, prot_data)
p <- draw_folding(p, prot_data)


# I would like to offset the peptides.

pep1_dP$order <- 1.4

p + ggplot2::geom_rect(data = pep1_dP,
                       mapping=ggplot2::aes(xmin=begin,
                                            xmax=end,
                                            ymin=order-0.05,
                                            ymax=order+0.05),
                       colour = "black") +
                    #scale_fill_gradient(low = "white", high = "black") +
                    annotate("text", x = -50, y = 1.4, label = "Peptides") +
                    labs(title = prot_to_see) + 
                    theme_bw(base_size = 20) + # white background
                    theme(panel.grid.minor=element_blank(),
                          panel.grid.major=element_blank()) +
                    theme(axis.ticks = element_blank(),
                          axis.text.y = element_blank()) +
                    theme(panel.border = element_blank())

```