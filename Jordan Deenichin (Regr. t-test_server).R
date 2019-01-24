library(shiny)

server <- shinyServer(function(input, output) {
  output$t_test_plot <- renderPlot({
    ### n <- length(model$coefficients)
    n <- 5
    i <- input$covariate
    ### when appending to app, make sure that pval and df are adequate
    pval <- runif(n)
    DF <- sample(1:100, n)
    ### Assume df = 50
    x <- qt(1:999/1000, DF[i])
    y <- dt(x, DF[i])
    plot(x, y, xlab = "", ylab = "Density", type = "l",
         main = bquote(paste(H[0], ": ", beta[.(i)]~"= 0, H"[1], ": ", beta[.(i)] != "0")))
    xpval <- c(qt(pval[i]/2, DF[i]), -qt(pval[i]/2, DF[i]))
    ypval <- dt(xpval, DF[i])
    lines(c(xpval[1], xpval[1]), c(0, ypval[1]), lty = 2, col = "red", lwd = 2)
    lines(c(xpval[2], xpval[2]), c(0, ypval[2]), lty = 2, col = "red", lwd = 2)
    polygon(c(x[x < xpval[1]], xpval[1]), c(y[x < xpval[1]], 0), 
            density = 10, border = NA)
    polygon(c(xpval[2], x[x > xpval[2]]), c(0, y[x > xpval[2]]), 
            density = 10, border = NA)
    legend("topright", 
           legend = c("density of null t-distribution", "+- test statistic",
                      paste("p =", round(pval[i], 3), "= shaded area")), 
           lty = c(1, 2, 0), col = c("black", "red"), bty = "n")
  })
})

shinyApp(ui, server)