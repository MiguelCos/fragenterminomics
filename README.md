# Fragenterminomics

Pipeline for extracting and exploring nterminomics data from FragPipe and TMT-Integrator.

Currently under development.

Starting from a semi-specific TMT search result from Fragpipe you can use the different functions in this repo to:

1. Annotate the semi-specific peptides (refer to function `R/annotate_peptides` and/or script in the repo [mapping_peptides_to_proteins_from_fasta_file](https://github.com/MiguelCos/mapping_peptides_to_proteins_from_fasta_file))
2. Label peptides as 'N-terminally acetylated', TMT-labelled or free N-term (refer to function `R/annotate_nterm.R`).
3. Annotate N-terminal peptides as canonical or not. This is currently based on the Uniprot processing annotation (currently uses a modification of functions from the [drawProteins](https://github.com/brennanpincardiff/drawProteins) package to get the Uniprot features per interesting protein - [get_features_drawProteins_modif](https://github.com/MiguelCos/fragenterminomics/blob/main/R/get_features_drawProteins_modif.R)).
5. Visualize counts of peptides per location within protein sequence and annotated processing information ([count_location_nterm](https://github.com/MiguelCos/fragenterminomics/blob/main/R/count_location_nterm.R); [summarize_counts](https://github.com/MiguelCos/fragenterminomics/blob/main/R/summarize_counts.R)).

To be included:

General functions to:

1. Prepare peptide features for their reproducible visualization within the protein sequence (under development - currently in this repo: [draw_signal](https://github.com/MiguelCos/fragenterminomics/blob/main/R/draw_signal.R), [draw_draw_initmet](https://github.com/MiguelCos/fragenterminomics/blob/main/R/draw_initmet.R), [draw_propep](https://github.com/MiguelCos/fragenterminomics/blob/main/R/draw_propep.R) - all these inspired by the [drawProteins](https://github.com/brennanpincardiff/drawProteins) package sintax and can be though as complementary of functions of that package).
2. Prepare alligned list of cleavage areas of N-terminal peptides for dagLogo.
3. Execute and visualize `dagLogo`

Also:

General script for the generation of a report with this information directly from the Fragpipe output.


