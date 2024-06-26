% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{generatePlotWithBands}
\alias{generatePlotWithBands}
\title{Generate Plot with Bands}
\usage{
generatePlotWithBands(
  timePoints,
  measurementPoints,
  bloodValue,
  title,
  yAxisLabel,
  bandsData
)
}
\arguments{
\item{timePoints}{Time points.}

\item{measurementPoints}{Measurement points.}

\item{bloodValue}{Blood value for normalization.}

\item{title}{Plot title.}

\item{yAxisLabel}{Y-axis label.}

\item{bandsData}{Data for the bands.}
}
\value{
ggplot object.
}
\description{
This function generates a plot with bands for given time points and measurements.
}
