# change 0 to NAs ----
# helper function  

zero2na <- function(x){
            y <- ifelse(x == 0,
                        yes = NA,
                        no = x)
            
            return(y)
}
