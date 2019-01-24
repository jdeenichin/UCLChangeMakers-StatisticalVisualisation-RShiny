library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Append regression app"),
  dashboardSidebar(
    ### n = number of coefficients to estimate (in place of 5 in 'choices')
    sliderInput("covariate",
                "Covariate:",
                1,
                5,
                1,
                1)
  ),
  dashboardBody(
    fluidRow(
      box(plotOutput("t_test_plot"), width = 7),
      box("SUMMARY", width = 5)
    ),
    
    "The p-value represents the probability that at least as extreme 
      observation is made given that the null hypothesis is true. Hence, a low 
      p-value implies that it is highly unlikely that the condition (the null 
      being true) holds => can reject the null in favour of the alternative
      hypothesis.",
    p("When regression coefficients are being tested, the null hypothesis is that
    the coefficient equals 0 (i.e. is not necessarily needed) and the alternative
    is that the coefficient differs from 0. Therefore, a high p-value indicates
    that there is no enough evidence to reject the claim that the coefficient is 
    superfluous. Equivalently, a low p-value indicates that the coefficient is 
    non-zero.")
  )
)
