#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import reticulate
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  # shiny::moduleServer("hello_world_1", mod_hello_world_server)
  reticulate::use_condaenv("synapse", required = T)
  synapseclient <- reticulate::import('synapseclient')
  syn <- synapseclient$Synapse()
  syn$login()
  # shiny::callModule(
  #   synapse_server,
  #   "synapse",
  #   syn = syn
  #   
  # )
  mod_main_server("main", syn = syn)
  # shiny::moduleServer("synapse_1", mod_synapse_server)
}
