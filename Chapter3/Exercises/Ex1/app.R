library(shiny)

ui <- fluidPage(
  textInput("name", label = "", placeholder = "Your name")
)

server <- function(input, output, session){}

shinyApp(ui, server)