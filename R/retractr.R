#'@importFrom httr GET user_agent stop_for_status content
check_single <- function(url){

	response <- httr::GET(url, httr::user_agent("retractr - https://www.github.com/Ironholds/retractr"))

	if(response$status_code == 404){
		return(data.frame(retracted = FALSE,
											title = NA,
											url = NA,
											journal = NA,
											update = NA,
											stringsAsFactors = FALSE))
	} else {
		httr::stop_for_status(response)
	}
	return(data.frame(httr::content(response), stringsAsFactors = FALSE))
}

#'@title Check Retraction Status
#'
#'@description \code{check_retraction} tests whether a paper (or set of papers)
#'have been retracted, accepting a set of DOIs and returning the retraction
#'status (as a boolean) and paper metadata in the case it has been retracted.
#'
#'@param doi a vector of DOIs.
#'
#'@return a data.frame of 6 columns; \code{retracted}, \code{title}, \code{url},
#'\code{journal}, \code{update} and \code{doi}. In the event that the paper has not
#'been retracted, all the metadata will be \code{NA}, while \code{retracted} will
#'be FALSE.
#'
#'@examples
#'
#'\dontrun{
#'# check for retractions
#'check_retraction(doi = "10.7860/JCDR/2013/4833.2724")
#'}
#'@export
check_retraction <- function(doi = c()){

	urls <- paste0("http://openretractions.com/api/doi/", doi, "/data.json")

	output <- do.call("rbind", lapply(urls, check_single))
	output$doi <- doi

	return(output)
}
