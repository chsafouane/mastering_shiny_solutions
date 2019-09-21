library(shiny)
library(vroom)
library(tidyverse)

injuries <- vroom::vroom("./Chapter5/Data/neiss/injuries.tsv.gz")
injuries

# produce code
# out side
# straghtforward

products <- vroom::vroom("./Chapter5/Data/neiss/products.tsv")
products

population <- vroom::vroom("./Chapter5/Data/neiss/population.tsv")
population

ui <- fluidPage(
  fluidRow(
    column(6,
           selectInput("code", "Product", setNames(products$prod_code, products$title))
           )
  ),
  fluidRow(
    column(4, tableOutput("diag")),
    column(4, tableOutput("body_part")),
    column(4, tableOutput("location"))
  ),
  fluidRow(
    column(12, plotOutput("age_sex"))
  )
)

server <- function(input, output, session){
  selected <- reactive(injuries %>% filter(prod_code == input$code))
  
  output$diag <- renderTable(
    selected() %>% count(diag, wt =weight, sort = T)
  )
  
  output$body_part <- renderTable(
    selected() %>% count(body_part, wt = weight, sort = T)
  )
  
  output$location <- renderTable(
    selected() %>% count(location, wt = weight, sort = T)
  )
  
  summary <- reactive({
    selected() %>% 
      count(age, sex, wt =weight) %>% 
      left_join(population, by = c("age","sex")) %>% 
      mutate(rate = n / population * 1e4)
  })
  
  output$age_sex <- renderPlot({
    summary() %>% 
      ggplot(aes(age, n, colour = sex)) +
      geom_line() +
      labs(y = "Estimated number of injuries") +
      theme_gray(15)
  })
}

shinyApp(ui, server)