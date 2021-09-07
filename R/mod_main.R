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
    dashboardHeader(title = "INCLUDE Clinical Shiny App"),
    dashboardSidebar(
      menuItem("DT", tabName = "syn_dt", icon = icon("dashboard")),
      menuItem("Reactable", tabName = "syn_reactable", icon = icon("dashboard"))
    ),
    dashboardBody(
      #  mod_hello_world_ui("hello_world_1")
      # golem_add_external_resources(),

      shinyjs::useShinyjs(),

      tags$div(
        list(
          tabItems(
            tabItem(tabName = "syn_dt",
                    h2("Synapse and DT")
                    #synapse_dt_ui(id=ns("synapse_dt"))
            ),
            tabItem(tabName = "syn_reactable",
                    h2("Synapse and reactable")
            )
          )
        ),
        class = "tab-content"
      )
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
      # callModule(
      #   synapse_dt_server,
      #   "synapse_dt",
      #   syn = syn
      # )
    }
  )
 
}
    
## To be copied in the UI
# mod_main_ui("main_ui_1")
    
## To be copied in the server
# callModule(mod_main_server, "main_ui_1")
 
