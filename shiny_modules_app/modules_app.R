library(tidyverse)
library(shiny)
library(shinyjs)

# Importing modules

list.files("modules") %>%
  purrr::map(~ source(paste0("modules/", .)))

ui <- fluidPage(
  
  useShinyjs(),
  
  # Application title
  titlePanel("Modules Tutorial"),
  
  sidebarLayout(
    sidebarPanel(
      
      slider_input_ui("slider_btn"),
      dist_ui("dist")
      
    ),
    
    mainPanel(
      
      histogram_ui("hist")
      
    )
  )
)