# R/functions.R

#' Calculate Body Mass Index (BMI)
#'
#' This function calculates the BMI given weight and height.
#'
#' @param weight Weight in kilograms.
#' @param height Height in centimeters.
#' @return BMI value.
#' @export
calculate_bmi <- function(weight, height) {
  bmi <- weight / (height / 100)^2
  return(bmi)
}

#' Calculate Ultrafiltration (UF) Volume
#'
#' This function calculates the UF volume given drain and infusion volumes.
#'
#' @param drain_volume Drained volume in mL.
#' @param infusion_volume Infused volume in mL.
#' @return UF volume.
#' @export
calculate_uf <- function(drain_volume, infusion_volume) {
  uf <- drain_volume - infusion_volume
  return(uf)
}

#' Calculate Sodium Sieving
#'
#' This function calculates sodium sieving.
#'
#' @param sodium0h Sodium at 0 hours (mEq/L).
#' @param sodium1h Sodium at 1 hour (mEq/L).
#' @return Sodium sieving.
#' @export
calculate_sodium_sieving <- function(sodium0h, sodium1h) {
  sodium_sieving <- sodium0h - sodium1h
  return(sodium_sieving)
}

#' Generate Plot with Bands
#'
#' This function generates a plot with bands for given time points and measurements.
#'
#' @param timePoints Time points.
#' @param measurementPoints Measurement points.
#' @param bloodValue Blood value for normalization.
#' @param title Plot title.
#' @param yAxisLabel Y-axis label.
#' @param bandsData Data for the bands.
#' @return ggplot object.
#' @export
generatePlotWithBands <- function(timePoints, measurementPoints, bloodValue, title, yAxisLabel, bandsData) {
  normalizedValues <- na.omit(measurementPoints / bloodValue)
  data <- data.frame(time = na.omit(timePoints), normalized = normalizedValues)

  ggplot(data, aes(x = time)) +
    geom_ribbon(data = bandsData, aes(ymin = very_low, ymax = low), fill = "pink", alpha = 0.5) +
    geom_ribbon(data = bandsData, aes(ymin = low, ymax = medium_low), fill = "violet", alpha = 0.5) +
    geom_ribbon(data = bandsData, aes(ymin = medium_low, ymax = medium_high), fill = "lightblue", alpha = 0.5) +
    geom_ribbon(data = bandsData, aes(ymin = medium_high, ymax = high), fill = "lightgreen", alpha = 0.5) +
    geom_line(aes(y = normalized), color = "red") +
    geom_point(aes(y = normalized), color = "red", size = 4) +
    labs(title = title, x = "Time (hours)", y = yAxisLabel) +
    theme_minimal() +
    theme(panel.grid.major = element_line(color = "gray", size = 0.5),
          panel.grid.minor = element_line(color = "gray", size = 0.25),
          panel.background = element_rect(fill = "white"),
          legend.position = "none",
          axis.line = element_blank(),
          axis.text.x = element_text(angle = 90, hjust = 1),
          axis.ticks = element_blank())
}

#' Generate Glucose Plot with Bands
#'
#' This function generates a glucose plot with bands.
#'
#' @param data Data frame with time and normalized values.
#' @param title Plot title.
#' @param yAxisLabel Y-axis label.
#' @param bandsData Data for the bands.
#' @return ggplot object.
#' @export
generatePlotWithBands2 <- function(data, title, yAxisLabel, bandsData) {
  ggplot(data, aes(x = time)) +
    geom_ribbon(data = bandsData, aes(ymin = very_low, ymax = low), fill = "pink", alpha = 0.5) +
    geom_ribbon(data = bandsData, aes(ymin = low, ymax = medium_low), fill = "violet", alpha = 0.5) +
    geom_ribbon(data = bandsData, aes(ymin = medium_low, ymax = medium_high), fill = "lightblue", alpha = 0.5) +
    geom_ribbon(data = bandsData, aes(ymin = medium_high, ymax = high), fill = "lightgreen", alpha = 0.5) +
    geom_line(aes(y = normalized), color = "red") +
    geom_point(aes(y = normalized), color = "red", size = 4) +
    labs(title = title, x = "Time (hours)", y = yAxisLabel) +
    theme_minimal() +
    theme(panel.grid.major = element_line(color = "gray", size = 0.5),
          panel.grid.minor = element_line(color = "gray", size = 0.25),
          panel.background = element_rect(fill = "white"),
          legend.position = "none",
          axis.line = element_blank(),
          axis.text.x = element_text(angle = 90, hjust = 1),
          axis.ticks = element_blank())
}

#' Run the Peritoneal Equilibrium Test Shiny App
#'
#' This function launches the Shiny app for the Peritoneal Equilibrium Test.
#' @export
runPeritonealEquilibriumTestApp <- function() {
  appDir <- system.file("shinyapp", package = "PeritonealEquilibrationT")
  if (appDir == "") {
    stop("Could not find Shiny app directory. Try re-installing `PeritonealEquilibrationT`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
