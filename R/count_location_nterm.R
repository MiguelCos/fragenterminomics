## Summarize location information of N-terminally acetylated peptides  

# This function will take the annotated tmt report and generate tabular counts
# related to the location of the N-terminally acetylated peptides.

count_location_nterm <- function(tmt_report_annotated){
                    
require(dplyr)

tmt_reprt_acetyl <- tmt_report_annotated %>%
                    filter(nterm == "acetylated")

count_info_acetyl <- tmt_reprt_acetyl %>% 
                    dplyr::select(index, protein_id, gene,peptide, peptide_length,
                                  specificity, nterm, semi_type, tmt_tag,
                                  start_position, end_position, last_aa, aa_after,
                                  aa_before, following_10_resid, previous_10_resid, length) %>%
                    mutate(start_position_num = as.numeric(start_position)) %>%
                    mutate(normalized_location = round(start_position_num/length*100))


n_counts_comb <- dplyr::count(count_info_acetyl, 
                                aa_before = as.factor(aa_before), 
                                start_position = as.factor(start_position),
                                normalized_location = as.factor(normalized_location)) %>%
                    mutate(aa_before = fct_reorder(aa_before, n, .desc = TRUE),
                           start_position = fct_reorder(start_position, n, .desc = TRUE),
                           normalized_location = fct_reorder(normalized_location, n, .desc = TRUE))

list_location_acetyl <- list(count_info_acetyl = count_info_acetyl,
                             n_counts_comb = n_counts_comb)

return(list_location_acetyl)


}

