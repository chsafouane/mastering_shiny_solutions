library(shiny)

ui <- fluidPage(
  sliderInput("slider", "Select Range:",
              min = min(datetime))
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
