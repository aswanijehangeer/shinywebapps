# aswanijehangeer
# https://github.com/aswanijehangeer
# https://linktr.ee/aswanijeh

# Load packages

library(shiny)
data(airquality)

# Define UI
# Fluid page
ui <- fluidPage(
  
  # App title 
  titlePanel("Ozone Level!"),
  
  # Sidebar layout with input and output
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Input: Slider for the number of bins
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: Histogram 
      plotOutput(outputId = "histogram")
      
    )
  )
)

# Define server logic required to draw a histogram 
server <- function(input, output) {
  

  output$histogram <- renderPlot({
    
    x    <- airquality$Ozone
    x    <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "blue", border = "black",
         xlab = "Ozone level",
         main = "Histogram of Ozone level")
    
  })
  
}

# Create Shiny app
shinyApp(ui = ui, server = server)
