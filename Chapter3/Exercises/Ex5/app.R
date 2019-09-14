library(shiny)

ui <- fluidPage(
  numericInput("number", "Select a value", value = 100, min  = 0, max = 1000),
  # If one uses the arrows to increase/decrease the value in the input,
  # the value steps by increment of 50 instead of the default value of 1
  numericInput("number", "Select a value", value = 100, min  = 0, max = 1000, step = 50)
)

server <- function(input, output, session){}

shinyApp(ui, server)