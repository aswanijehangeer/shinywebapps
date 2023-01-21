# aswanijehangeer
# https://github.com/aswanijehangeer
# https://linktr.ee/aswanijeh

# Load R packages

library(shiny)
library(shinythemes)


# UI
# fluidPage

ui <- fluidPage(theme = shinytheme("yeti"),
                # navbarPage
    navbarPage(
      "My first app",
      
      tabPanel("Navbar 1",
               # sidebarPanel
               sidebarPanel(
                 tags$h3("Input:"),
                 textInput("text1", "First Name:", ""),
                 textInput("text2", "Last Name:", ""),
                 
               ), 
               # mainPanel
               mainPanel(
                            h1("Header 1"),
                            
                            h4("Output 1"),
                            verbatimTextOutput("textout"),

               ) 
               
      ), # Navbar 2, tabPanel
      tabPanel("Navbar 2", "This panel is intentionally left blank"),
      # Navbar 3, tabPanel
      tabPanel("Navbar 3", "This panel is intentionally left blank")
  
    ) 
  ) 
  
  # Define server function
# server
  server <- function(input, output) {
    
    output$textout <- renderText({
      paste( input$text1, input$text2, sep = " " )
    })
  } 
  

  # Shiny object
  shinyApp(ui = ui, server = server)
