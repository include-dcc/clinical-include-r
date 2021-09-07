#' synapse_reactable UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' 
#' @noRd 
#'
#' @importFrom shiny NS tagList 
synapse_reactable_ui <- function(id){
  ns <- NS(id)
  tagList(
    reactable::reactableOutput(ns("tbl"))
  )
}
    
#' synapse_reactable Server Function
#'
#' @noRd 
synapse_reactable_server <- function(input, output, session, syn){
  ns <- session$ns
  table = syn$tableQuery("select * from syn26136890")
  output$tbl <- reactable::renderReactable({
    reactable::reactable(table$asDataFrame())
  })
  
}
    
## To be copied in the UI
# mod_synapse_reactable_ui("synapse_reactable_ui_1")
    
## To be copied in the server
# callModule(mod_synapse_reactable_server, "synapse_reactable_ui_1")
 
