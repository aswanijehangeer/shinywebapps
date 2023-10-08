distribution_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    
    br(),
    radioButtons(ns("dist"),
                 "Choose Distrbribution",
                 choices = c("Normal", "Exponential"))
  )
}

distribution_Server <- function (id, action_button) {
  
  moduleServer(id, function(input, output, session) {
    
    distributon <- eventReactive(action_button(), {
      if(input$dist == "Normal") {
        dist <- rnorm(10000, 0, 1)
      }
      else {
        dist <- rexp(10000, 0.2)
      }
      return(dist)
    })
    return(distributon)
  })
}