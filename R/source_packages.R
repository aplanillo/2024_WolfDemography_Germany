# Source file: packages used in wolf pva project

####--------------------------------------------####
## PACKAGES
####--------------------------------------------####

mylibraries <- c("dplyr", "ggplot2", "lubridate", "sf", "tmap", "terra", "units",
                 "exactextractr", "forcats", "paletteer", "fitdistrplus", "tidyr",
                 "ggcorrplot", "survival", "AICcmodavg", "broom", "survminer", 
                 "patchwork", "cowplot", "scico", "lme4", "ggeffects", 
                 "grid", "gridExtra")

for (i in 1:length(mylibraries)) {
  if(mylibraries[i] %in% rownames(installed.packages()) == FALSE) {install.packages(mylibraries[i])}
}
lapply(mylibraries, require, character.only = TRUE)



