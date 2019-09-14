library(shiny)

ui <- fluidPage(
  headerPanel("Central limit theorem"),
  sidebarLayout(
    mainPanel(
      plotOutput("hist")
    ),
    sidebarPanel(
      numericInput("m", "Number of samples:", 2, min = 1, max = 100)
    )
  )
)

server <- function(input, output, server) {
  output$hist <- renderPlot({
    means <- replicate(1e4, mean(runif(input$m)))
    hist(means, breaks = 20)
  })
}

shinyApp(ui, server)