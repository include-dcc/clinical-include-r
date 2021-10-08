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
synapse_dt_server <- function(input, output, session, syn, entity_id){
  ns <- session$ns
  entity = syn$get(entity_id)
  if (entity$properties$concreteType %in% c("org.sagebionetworks.repo.model.table.SubmissionView",
                                            "org.sagebionetworks.repo.model.table.TableEntity",
                                            "org.sagebionetworks.repo.model.table.EntityView")) {
    table = syn$tableQuery(glue::glue("select * from {entity_id}"))
    table_df = table$asDataFrame()
  } else if (entity$properties$concreteType == "org.sagebionetworks.repo.model.FileEntity") {
    if (endsWith(entity$path, ".csv")) {
      table_df = read.csv(entity$path, comment.char = "#")
    } else if (endsWith(entity$path, ".tsv")) {
      table_df = read.table(entity$path, comment.char = "#")
    } else {
      stop("Unsupported file type")
    }
  } else {
    stop("Unsupported entity type")
  }
  output$tbl <- DT::renderDT({
    DT::datatable(
      table_df,
      extensions = 'Buttons', options = list(dom = 'Bfrtip', buttons = I('colvis'))
    )
  })

}

## To be copied in the UI
# mod_synapse_ui("synapse_ui_1")
    
## To be copied in the server
# callModule(mod_synapse_server, "synapse_ui_1")
 
