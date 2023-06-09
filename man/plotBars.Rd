% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/figures.R
\name{plotBars}
\alias{plotBars}
\title{Plot a barplot using ggplot2}
\usage{
plotBars(
  data,
  label_x = "Samples",
  label_y = "Abundances",
  label_fill = "Features",
  color = NULL,
  base_size = 11,
  max_scale_value = NULL,
  metadata_groups = NULL
)
}
\arguments{
\item{data}{Numeric matrix or data frame.}

\item{label_x}{character Label for the x axis (default \code{"Samples"}).}

\item{label_y}{character Label for the y axis (default \code{"Abundances"}).}

\item{label_fill}{character Label for color categories (default \code{"Features"}).}

\item{color}{Vector with custom colors for the different features. If empty, the default ggplot2 palette will be used (default \code{NULL}).}

\item{base_size}{numeric. Base font size (default \code{11}).}

\item{max_scale_value}{numeric. Maximum value to include in the y axis. By default it is handled automatically by ggplot2 (default \code{NULL}).}

\item{metadata_groups}{list. Split the plot into groups defined by the user: list('G1' = c('sample1', sample2'), 'G2' = c('sample3', 'sample4')) default \code{NULL}).}
}
\value{
a ggplot2 plot object.
}
\description{
Plot a ggplot2 barplot from a matrix or data frame. The data should be in tabular format (e.g. features in rows and samples in columns).
}
\examples{
data(Hadza)
sk = Hadza$taxa$superkingdom$abund
plotBars(sk, label_y = "Raw reads", label_fill = "Superkingdom")
}
\seealso{
\code{\link{plotTaxonomy}} for plotting the most abundant taxa of a SQM object; \code{\link{plotHeatmap}} for plotting a heatmap with arbitrary data; \code{\link{mostAbundant}} for selecting the most abundant rows in a dataframe or matrix.
}
