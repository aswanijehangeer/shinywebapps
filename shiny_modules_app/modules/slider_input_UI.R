slider_input_UI <- function(id) {
  
  ns <- NS(id)
  
  tagList(
    sliderInput(ns("bins"),
                label = "Number of bins:",
                min = 1,
                max = 50,
                value = 30),
    br(),
  
    actionButton(ns("click"),
                 "Click me"),
    br()
  )
}

slider_input_Server <- function(id) {
  
  moduleServer(id, function(input, output, session) {
    
    click(id = "click")
    
    return(
      list(bins = reactive(input$bins),
           action_btn = reactive(input$click))
    )
  })
}