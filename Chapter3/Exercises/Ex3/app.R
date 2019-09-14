library(shiny)

some_countries <- list(Africa=c("Morocco", "Algeria","Tunisia"),
                      Europe = c("France","Germany","Spain"),
                      Asia = c("China", "Japan", "Qatar"))


ui <- fluidPage(
  selectInput("countries","Choose a country:", choices = some_countries)
)

server <- function(input, output, session){}

shinyApp(ui, server)