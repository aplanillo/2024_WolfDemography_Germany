# Planillo et al. 2024. Habitat and density effects on the demography of an expanding wolf population in Central Europe. Wildlife Biology.

<blockquote> Publication DOI: 10.1002/wlb3.01246
  
Repository DOI (Dryad): https://doi.org/10.5061/dryad.dncjsxm5m</blockquote>

Demographic anlaysis of German wolf population until 2020

This project contains the code to reproduce the demographic analyses of the wolf population. The project is organized in two folder:

- *R*. Contains the R scripts for the project
- *Proc_data*. This folder stores the data to run the project

The project is organized in such a way that all scripts and relative paths will work if ran from the RStudio project in the main folder (recommended!).
* The <b> scripts 1 and 2 </b> prepare the data for the analyses and run some summaries. 
* The <b> scripts 3 and 4 </b> run the survival analyses for the population and for the different age classes, respectively.
* The <b> script 5 </b> runs the reproduction analyses.
* The <b> script 6 </b> obtains a quick measure of population growth.
* The <b> source scripts </b> contain custom made functions used during the survival analysis as well as all packages required to run the scripts.

**NOTE**
Due to the sensitivity of the species data, the raw data with coordinates and individual identities has been removed from the Github project.
Thus, script 1-prepare-data will not run but we still keep it here to show the code and how data was filtered and prepared.
The rest of the scripts use the tables prepared in script 1 and provided in proc_data folder. Here, we provide the tables that already include the environmental variables for the analyses and set the coordinates to NA and the individual identitites to sequential numbers.
These data should be enough to reproduce the analyses, although it will not allow to extract new variables.

> Original data was provided by Ilka Reinhardt at LUPUS institute (reproduction) and Carsten Nowak at Senckenberg Biodiversity and Climate Research Center (SBiK-F) (survival)
