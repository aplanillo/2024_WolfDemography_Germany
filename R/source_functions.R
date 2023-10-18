## Get tables of model comparisons for univariate cox survival models

## function to extract values from models based on continuous or two level variables
get.model.output.cont <- function(x){ 
  AICc <- AICc(x)
  
  x <- summary(x)
  p.value <- signif(x$wald["pvalue"], digits=2)
  wald.test <- signif(x$wald["test"], digits=2)
  beta <- signif(x$coef[1], digits=2);#coeficient beta
  HR <-signif(x$coef[2], digits=2);#exp(beta)
  HR.confint.lower <- signif(x$conf.int[,"lower .95"], 2)
  HR.confint.upper <- signif(x$conf.int[,"upper .95"],2)
  HR <- paste0(HR, " (", 
               HR.confint.lower, "-", HR.confint.upper, ")")
  
  res <- c(beta, HR, wald.test, p.value, AICc)
  names(res)<-c("beta", "HR (95% CI for HR)", "wald.test", 
                  "p.value", "AICc")
  return(res)
}

get.univ.table.cont <- function(x){
  tmp <- t(as.data.frame(x, check.names = FALSE))
  res_1 <- as.data.frame(tmp)
  return(res_1)
}



## function to extract values from models based on multilevel variables
get.model.output.multi <- function(x){ 
  AICc <- AICc(x)
  x <- summary(x)
  p.value <- signif(x$wald["pvalue"], digits=2)
  wald.test <- signif(x$wald["test"], digits=2)
  beta <- signif(x$coef[,1], digits=2);#coeficient beta
  HR <- signif(x$coef[,2], digits=2);#exp(beta)
  HR.confint.lower <- signif(x$conf.int[,"lower .95"], 2)
  HR.confint.upper <- signif(x$conf.int[,"upper .95"],2)
  HR <- paste0(HR, " (", 
               HR.confint.lower, "-", HR.confint.upper, ")")
  res <- c(beta, HR, wald.test, p.value, AICc)
  rownames_tmp <- rownames(x$coef)
  names_tmp <- c(paste0(rownames_tmp), 
                 paste0("HR (95% CI for HR)_", rownames_tmp),
                 "wald.test", "p.value", "AICc")
  names(res) <- names_tmp
  return(res)
}


## function ot format results as table
get.univ.table.multi <- function(x){
  tmp <- t(as.data.frame(x, check.names = FALSE))
  res_tmp <- as.data.frame(tmp)
  res_beta <- res_tmp %>% 
    dplyr::select(starts_with("region_origin")) %>%
    t() %>% 
    as.data.frame() %>% 
    mutate(beta = as.numeric(region_origin)) %>% 
    dplyr::select(-"region_origin")
  
  res_HR <- res_tmp %>% 
    dplyr::select(contains("HR")) %>%
    t() %>% 
    as.data.frame() %>% 
    mutate("HR (95% CI for HR)" = region_origin)
  
  res_2 <- res_beta %>% 
    mutate("HR (95% CI for HR)" = res_HR$region_origin, 
           wald.test = as.numeric(res_tmp$wald.test),
           p.value = as.numeric(res_tmp$p.value), 
           AICc = as.numeric(res_tmp$AICc))
  
  return(res_2)
}


## function to save the plot of results from Cox models
save_predggplot <- function(plot, group, variable, saving_directory){
  ggsave(plot = plot, 
         filename = paste0(saving_directory, group, "_annual_cox_best_", 
                           variable, "_knownbirth_20220601_", 
                format(Sys.Date(), "%Y%m%d"), ".png"), 
         dpi = 600, width = 6, height = 5)
}

  
  