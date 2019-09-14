library(shiny)

ui <- fluidPage(
  sliderInput("delivery","When should we deliver?", 
              min = as.Date("2019-08-09"), max = as.Date("2019-08-16"), 
              value = as.Date("2019-08-10"))
)

server <- function(input, output, session){}

shinyApp(ui, server)