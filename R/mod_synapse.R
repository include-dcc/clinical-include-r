#' synapse UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_synapse_ui <- function(id){
  ns <- NS(id)
  tagList(
    DT::DTOutput(ns("tbl"))
  )
}
    
#' synapse Server Function
#'
#' @import reticulate
#' @import DT
#'
#' @noRd 
mod_synapse_server <- function(input, output, session){
  ns <- session$ns
  reticulate::use_condaenv("synapse", required = T)
  synapseclient <- reticulate::import('synapseclient')
  syn <- synapseclient$Synapse()
  syn$login()
  table = syn$tableQuery("select * from syn26136890")
  output$tbl <- DT::renderDT(table$asDataFrame())

}
    
## To be copied in the UI
# mod_synapse_ui("synapse_ui_1")
    
## To be copied in the server
# callModule(mod_synapse_server, "synapse_ui_1")
 
