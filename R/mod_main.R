#' main UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_main_ui <- function(id){
  ns <- NS(id)
  dashboardPage(
    dashboardHeader(title = "Metadata Validation"),
    dashboardSidebar(),
    dashboardBody(
      #  mod_hello_world_ui("hello_world_1")
      golem_add_external_resources(),
      
      mod_synapse_ui(id=ns("synapse"))
    )
  )
}
    
#' main Server Function
#'
#' @noRd 
mod_main_server <- function(id, syn){
  moduleServer(
    id,
    function(input, output, session) {
      # reticulate::use_condaenv("synapse", required = T)
      # synapseclient <- reticulate::import('synapseclient')
      # syn <- synapseclient$Synapse()
      # syn$login()
      callModule(
        mod_synapse_server,
        "synapse",
        syn = syn
      )
    }
  )
 
}
    
## To be copied in the UI
# mod_main_ui("main_ui_1")
    
## To be copied in the server
# callModule(mod_main_server, "main_ui_1")
 
