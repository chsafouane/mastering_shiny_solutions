library(shiny)

ui <- fluidPage(
  # Using an html element instead of "If x is" as a label for
  # the sliderInput is a better solution - see Ex3
  sliderInput("slider", "If x is", min= 1, max = 50, value = 5),
  # Using strong to look the same as 'if x is'
  strong("then, x multiplied by 5"),
  textOutput("result")
)

server <- function(input, output, session){
  output$result <- renderText({
    # Writing 5 * x will reproduce the error
    # x is not defined and so is not found
    5 * input$slider
  })
}

shinyApp(ui, server)