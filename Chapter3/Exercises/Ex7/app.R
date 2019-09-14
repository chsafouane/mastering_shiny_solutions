library(shiny)

ui <- fluidPage(
  dataTableOutput("table")
)

server <- function(input, output, server){
  # https://datatables.net/reference/option/dom
  output$table <- renderDataTable({mtcars}, options = list(dom = 't', pageLength = 5))
}

shinyApp(ui, server)