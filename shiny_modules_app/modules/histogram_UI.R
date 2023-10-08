histogram_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    plotOutput(ns("plot"))
  )
}

histogram_Server <- function(id, data, slider_input_bins, action_button) {
  
  moduleServer(id, function(input, output, session) {
    
    bins <- eventReactive(action_button(), {
      bins <- seq(min(data()), max(data()), length.out = slider_input_bins() + 1)
    })
    
    output$plot <- renderPlot(
      hist(data(), breaks = bins(), col = "darkgray", border = "white")
    )
  })
}