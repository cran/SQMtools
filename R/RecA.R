#' RecA/RadA recombinase
#'
#' The recombination protein RecA/RadA is essential for the repair and
#' maintenance of DNA, and has homologs in every bacteria and archaea.
#' By dividing the coverage of functions by the coverage of RecA, abundances
#' can be transformed into copy numbers, which can be used to compare 
#' functional profiles in samples with different sequencing depths.
#' RecA-derived copy numbers are available in the SQM object
#' (\code{SQM$functions$<annotation_type>$copy_number}).
#'
#' @docType data
#'
#' @usage data(RecA)
#'
#' @format Character vector with the COG identifier for RecA/RadA.
#'
#' @keywords datasets
#'
#' @source \href{http://eggnogdb.embl.de/#/app/results?seqid=P0A7G6&target_nogs=COG0468#COG0468_datamenu}{EggNOG Database}.
#'
#' @examples
#' data(Hadza)
#' data(RecA)
#' ### Let's calculate the average copy number of each function in our samples.
#' # We do it for COG annotations here, but we could also do it for KEGG or PFAMs.
#' COG.coverage = Hadza$functions$COG$cov
#' COG.copynumber = t(t(COG.coverage) / COG.coverage[RecA,]) # Sample-wise division by RecA coverage.
"RecA"
