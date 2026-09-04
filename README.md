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
| `dependencies.R` | List of required R packages 
| `sessionInfo.txt` | Package versions used for the analyses

The notebooks are located at the repository root. Input data files should be placed in the `data/` directory.

## Data availability

The analysis-ready input data are stored separately from the public code repository.

During peer review, the data are available to editors and reviewers through a private Zenodo link provided in the Data Availability section of the manuscript. The Zenodo record and permanent DOI will be made public upon publication and added here.

## Software requirements

The analyses were developed and tested using R 4.4.2 on macOS.
Required R packages are listed in `dependencies.R`.
Package versions used for the analyses are recorded in `sessionInfo.txt`.
No non-standard hardware is required.

P-TEAM (Drost et al., 2024) was used for sequence-based prediction of TCR–APL recognition. P-TEAM is third-party software and is not included in this repository. The P-TEAM predictions used for the downstream analyses in this manuscript are provided in the accompanying Zenodo dataset as `pteam_predictions.csv`. P-TEAM source code is publicly available at the authors' repository: `https://github.com/SchubertLab/TcrPrediction_MutatedAPLs`.

### Installation

Clone or download this repository. In R, install the required packages with:

```r
source("dependencies.R")
missing_packages <- setdiff(required_packages, rownames(installed.packages()))
install.packages(missing_packages)
```

Installation of the required R packages typically takes several minutes on a standard desktop or laptop computer, depending on the system and whether some dependencies are already installed.

### Running the analyses

Download the analysis-ready data from the Zenodo link provided in the manuscript
and extract all files into the `data/` directory.

The four R Markdown notebooks can then be run independently, for example:

```r
rmarkdown::render("01_bulk_tcr_repertoires_dby_smcy_uty.Rmd")
```

Each notebook generates an HTML document containing the corresponding analyses,
statistics and manuscript figure panels.

The four notebooks together typically run within a few minutes on a standard desktop or laptop computer.