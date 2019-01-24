library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "QQ plots"),
  dashboardSidebar(
    selectInput("type",
                "What distribution would you like?",
                choices = c("Light-tailed", 
                            "Heavy-tailed", 
                            "Normal", 
                            "Negatively skewed", 
                            "Positively skewed")),
    actionButton("update",
                 "Produce new sample!", 
                 width = "87.5%"),
    p("This applet aims to make QQ plots more intuitive by comparing 
    sample quantiles against the corresponding normal quantiles in various ways.",
      align = "center")
  ),
  dashboardBody(
      plotOutput("plots")
  )
)

