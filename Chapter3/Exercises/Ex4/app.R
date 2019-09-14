library(shiny)

ui <- fluidPage(
  sliderInput("number","Select a value", min = 0, max = 100, value= 25, step = 5, animate = T)
)

server <- function(input, output, session){}

shinyApp(ui, server)