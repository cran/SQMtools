% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bin_methods.R
\name{create_bin}
\alias{create_bin}
\title{Create a bin from a vector of contigs}
\usage{
create_bin(SQM, bin, contigs, delete_overlapping_bins = FALSE)
}
\arguments{
\item{SQM}{A SQM object.}

\item{bin}{character. Name of the bin to be created.}

\item{contigs}{character. Vector with the names of the contigs that will be included in the new bin.}

\item{delete_overlapping_bins}{logical. If \code{TRUE}, bins that originally contained any of the provided contigs will be removed from the object. Default \code{FALSE}.}
}
\value{
SQM object with the new binning information, including recalculated bin statistics if possible.
}
\description{
Create a bin from a vector of contigs
}
\seealso{
\code{\link{find_redundant_contigs}}, \code{\link{remove_contigs_from_bin}}
}
