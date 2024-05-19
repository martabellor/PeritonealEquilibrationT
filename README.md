# PeritonealEquilibrationT

The `PeritonealEquilibrationT` package is designed to facilitate the analysis and visualization of data from Peritoneal Equilibrium Tests. It provides functions for calculating key indicators such as Body Mass Index (BMI), Ultrafiltration (UF), and Sodium Sieving. Additionally, it generates diagnostic plots for glucose, creatinine, and urea levels based on user input.

## Shiny Application

This package includes a Shiny application that allows users to input their data and visualize the results interactively. You can access the Shiny app at the following link:

[Peritoneal Equilibration Test Shiny App](https://vtj3ex-marta0bello.shinyapps.io/shinyapp/)

## Installation

You can install the latest version of `PeritonealEquilibrationT` directly from GitHub using `devtools`:

### Install `devtools` if you haven't already

```r
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
```

### Install `PeritonealEquilibrationT` from GitHub

```r
devtools::install_github("martabellor/PeritonealEquilibrationT")
```

## Usage

### Running the Shiny App

To run the Shiny app included in this package, use the following command:

```r
library(PeritonealEquilibrationT)
runPeritonealEquilibriumTestApp()
```

## Author

Marta Bellor Rego


