library(shiny)

ui <- fluidPage(
  strong("If x is"),
  sliderInput("slider1", label = NULL, min = 1, max = 50, value = 1),
  strong("and y is"),
  sliderInput("slider2", label = NULL, min = 1, max = 50, value = 1),
  strong("then, x multiplied by y is"),
  # One can wrap a renderFunction with an html element
  # strong(textOutput("result")) to make it look similar
  # to other strings in the example
  textOutput("result")
)

server <- function(input, output, session){
  output$result <- renderText({
    input$slider1 * input$slider2
  })
}

shinyApp(ui, server)