#' synapse UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
synapse_dt_ui <- function(id){
  ns <- NS(id)
  tagList(
    DT::DTOutput(ns("tbl"))
  )
}
    
#' synapse Server Function
#'
#' @import reticulate
#' @import DT
#' @noRd 
synapse_dt_server <- function(input, output, session, syn){
  ns <- session$ns
  table = syn$tableQuery("select * from syn26136890")
  output$tbl <- DT::renderDT({
    DT::datatable(
      table$asDataFrame(),
      extensions = 'Buttons', options = list(dom = 'Bfrtip', buttons = I('colvis'))
    )
  })

}

## To be copied in the UI
# mod_synapse_ui("synapse_ui_1")
    
## To be copied in the server
# callModule(mod_synapse_server, "synapse_ui_1")
 
