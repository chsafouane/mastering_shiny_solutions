library(shiny)
library(HistData)

ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = ls("package:HistData")),
  verbatimTextOutput("summary"),
  
  # 1st mistake: plotOutput instead of tableOutput
  plotOutput("plot")
)

server <- function(input, output, session){
  dataset <- reactive({
    get(input$dataset, "package:HistData")
  })
  
  output$summary <- renderPrint({
    # 2nd mistake: summary instead of summmry
    summary(dataset())
  })
  
  output$plot <- renderPlot({
    # 3rd mistake: dataset() instead of dataset
    plot(dataset())
  })
}

shinyApp(ui, server)