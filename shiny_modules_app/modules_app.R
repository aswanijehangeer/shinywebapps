library(tidyverse)
library(shiny)
library(shinyjs)

# Importing modules

list.files("modules") %>%
  purrr::map(~ source(paste0("modules/", .)))

ui <- fluidPage(
  
  useShinyjs(),
  
  # Application title
  titlePanel("R Shiny Modules Tutorial"),
  
  sidebarLayout(
    sidebarPanel(
      
      slider_input_UI("slider_btn"),
      distribution_UI("dist")
      
    ),
    
    mainPanel(
      histogram_UI("hist")
      
    )
  )
)

server <- function(input, output, session) {
  
  slider_btn_values <- slider_input_Server("slider_btn")
  distribution_values <- distribution_Server("dist", slider_btn_values$action_btn)
  
  histogram_Server("hist",
                   distribution_values,
                   slider_btn_values$bins,
                   slider_btn_values$action_btn)
  
}


# Run the application 
shinyApp(ui = ui, server = server)