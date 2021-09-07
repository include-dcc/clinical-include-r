#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import reticulate
#' @noRd
app_server <- function( input, output, session ) {
  # Log into Synapse
  reticulate::use_condaenv("synapse", required = T)
  synapseclient <- reticulate::import('synapseclient')
  syn <- synapseclient$Synapse()
  syn$login()
  # Call main server
  mod_main_server("main", syn = syn)
}
