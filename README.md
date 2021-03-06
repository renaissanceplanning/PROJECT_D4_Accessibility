# D4_accessibility

D4 Accessibility Project

## Getting Started

1 - Clone this repo.

2 - Create an environment with the requirements.
- open conda cmd prompt
    
```
        > cd /path/to/project_folder
        > make env
```

3 - What else?
## Project Organization
```
    ├── LICENSE
    ├── Makefile            <- Makefile with commands like `make data`
    ├── make.bat            <- Windows batch file with commands like `make data`
    ├── setup.py            <- Setup script for the library (D4_accessibility)
    ├── .env                <- Any environment variables here - created as part of project creation, 
    │                         but NOT syncronized with git repo for project.                
    ├── README.md           <- The top-level README for developers using this project.
    ├── data
    │   ├── external        <- Data from third party sources.
    │   ├── interim         <- Intermediate data that has been transformed.
    │   ├── processed       <- The final, canonical data sets for modeling.
    │   └── raw             <- The original, immutable data dump.
    ├── docs                <- A default Sphinx project; see sphinx-doc.org for details
    ├── notebooks           <- Jupyter notebooks. Naming convention is a 2 digits (for ordering),
    │   │                     descriptive name. e.g.: 01_exploratory_analysis.ipynb
    │   └── notebook_template.ipynb
    ├── references          <- Data dictionaries, manuals, and all other explanatory materials.
    ├── reports             <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures         <- Generated graphics and figures to be used in reporting
    ├── environment.yml     <- Requirements file for reproducing the analysis execution environment.
    │                         This includes far fewer dependencies and does not include arcpy.
    ├── environment_dev.yml <- Requirements file for reproducing the analysis deveopment environment.
    │                         This includes arcpy and everything needed to generate Sphinx docs.
    └── src                   <- Source code for use in this project - all scripts, modules and code.
        └── D4_accessibility  <- Library containing the bulk of code used in this 
                                                  project. 
```
