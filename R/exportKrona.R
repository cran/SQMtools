#' Export the taxonomy of a SQM object into a Krona Chart
#'
#' Generate a krona chart containing the full taxonomy from a SQM object.
#'
#' Original code was kindly provided by Giuseppe D'Auria (dauria_giu@gva.es).
#'
#' @param SQM A SQM, SQMbunch or SQMlite object.
#' @param output_name character. Name of the output file containing the Krona charts in html format (default \code{"<project_name>.krona.html")}.
#' @return No return value, but a krona chart is produced in the current working directory.
#' @seealso \code{\link{plotTaxonomy}} for plotting the most abundant taxa of a SQM object.
#' @examples
#' \donttest{
#' data(Hadza)
#' # Check that kronatools is present.
#' ecode = system('ktImportText', ignore.stdout = TRUE, ignore.stderr = TRUE)
#' # If so, run.
#' if(ecode==0) { exportKrona(Hadza, output_name = file.path(tempdir(), "krona.html")) }
#' }
#' @importFrom utils write.table
#' @export
#'
exportKrona = function(SQM, output_name = NA)
    {

    # Check params.
    if(!inherits(SQM, c('SQM', 'SQMbunch', 'SQMlite'))) { stop('The first argument must be a SQM or a SQMlite object') }


    # Check that kronatools is present.
    ecode = system('ktImportText', ignore.stdout = TRUE, ignore.stderr = TRUE)
    if(ecode!=0) { stop('ktImportText (from KronaTools) is not present in your PATH. KronaTools can be downloaded from https://github.com/marbl/Krona') }

    # Should we use the default output name?
    if(is.na(output_name))
        {
        output_name = sprintf('%s.krona.html', SQM$misc$project_name)
	tempDir = 'kronaTemp'
	}
    tempDir = sprintf('%s/SQMtools.krona.temp', tempdir())
    system(sprintf('rm -r %s', tempDir)   , ignore.stdout = TRUE, ignore.stderr = TRUE)
    system(sprintf('mkdir %s', tempDir), ignore.stdout = TRUE, ignore.stderr = TRUE)

    # Prepare data.
    ta = SQM$taxa$species$abund
    taxFields = strsplit(SQM$misc$tax_names_long$species[rownames(ta)], split=';', fixed = TRUE )
    taxFields = lapply(taxFields, function(x) sapply(strsplit(x, split='_', fixed=TRUE), function(y) y[2]))
    taxFields = t(data.frame(taxFields))

    for(sample in SQM$misc$samples)
        {
        idx = which(ta[,sample]>0) # Taxa that are present in this sample.
	kronaTemp = cbind(ta[idx,sample], taxFields[idx,])
        write.table(kronaTemp, file = sprintf('%s/%s.tsv', tempDir, sample),
                    sep='\t', quote=FALSE, col.names=FALSE, row.names=FALSE) # Write temp file for this sample
        }

    # Create krona report.
    system(sprintf('ktImportText -o %s %s/*.tsv', output_name, tempDir), ignore.stdout = TRUE, ignore.stderr = TRUE)
    }
