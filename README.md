# CD4+ T cell–T cell interactions preserve clonal diversity to recognize antigen variants

This repository contains the analysis code accompanying the manuscript by Roux, Karnaukhov et al., “CD4+ T cell–T cell interactions preserve clonal diversity to recognize antigen variants.”

## Repository contents

| File | Analysis | Main manuscript outputs |
|---|---|---|
| `01_bulk_tcr_repertoires_dby_smcy_uty.Rmd` | Bulk TCRα and TCRβ repertoire analyses of Dby-, Smcy-, and Uty-specific T cells | Fig. 1e,f; Supplementary Fig. 1b,c |
| `02_mathematical_model.Rmd` | Mathematical model, parameter scan, response dynamics, clonal diversity, and avidity–rank relationships | Fig. 3c–e; Fig. 4a–c; Supplementary Fig. 3 and related panels |
| `03_sc_tcr_repertoires_dby_wt_socs1ko.Rmd` | Single-cell TCR repertoire comparisons between WT, WT-in-SOCS1, and SOCS1-KO cells | Fig. 3k,l; Supplementary Fig. 5 and related panels |
| `04_apl_analysis.Rmd` | TCR–APL screen, repertoire coverage, in silico repertoire sampling, and APL recall analyses | Fig. 5 and related supplementary panels |
| `plotting_functions.R` | Shared plotting themes, scales, labels, and helper layers | Used across multiple notebooks |
| `dependencies.R` | List and validation of required R packages | Software setup |

The notebooks are located at the repository root. Input data files should be placed in the `data/` directory.

## Data availability

The analysis-ready input data are stored separately from the public code repository.

During peer review, the data are available to editors and reviewers through a private Zenodo link provided in the Data Availability section of the manuscript. The Zenodo record and permanent DOI will be made public upon publication and added here.

## Software requirements

The analyses were developed using R 4.4.2.

Required packages are listed in `dependencies.R`. To check whether all required packages are installed, run:

```r
source("dependencies.R")
check_dependencies()
```
To install missing packages, run:

```r
source("dependencies.R")
install_dependencies()
```