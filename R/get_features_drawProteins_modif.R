## Get features modif  

get_features_mod <- function (proteins_acc) 
{
            proteins_acc_url <- gsub(" ", "%2C", proteins_acc)
            baseurl <- "https://www.ebi.ac.uk/proteins/api/features?offset=0&size=100&accession="
            url <- paste0(baseurl, proteins_acc_url)
            prots_feat <- httr::GET(url, httr::accept_json())
            code <- httr::status_code(prots_feat)
            if (code == 200) {
                        print(paste("Download has worked", proteins_acc))
            }
            else {
                        print(paste("An error has occured. Code:", code))
            }
            prots_feat_red <- httr::content(prots_feat)
            return(prots_feat_red)
}