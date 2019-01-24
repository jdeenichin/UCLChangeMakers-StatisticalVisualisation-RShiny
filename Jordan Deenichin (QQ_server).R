library(shiny)

server <- shinyServer(function(input, output) {
  
  
  output$plots <- renderPlot({
    input$update
    n <- 1000
    x <- if (input$type == "Light-tailed"){
      runif(n)library(shiny)

server <- shinyServer(function(input, output) {
  
  
  output$plots <- renderPlot({
    input$update
    n <- 1000
    x <- if (input$type == "Light-tailed"){
      runif(n)
    } else if(input$type == "Heavy-tailed"){
      rt(n, 2)
    } else if(input$type == "Normal"){
      rnorm(n)
    } else if(input$type == "Negatively skewed"){
      rbeta(n, 15, 2)
    } else if(input$type == "Positively skewed"){
      rgamma(n, 2)
    }
    
    par(mfrow = c(2, 2), mar = c(2, 2, 2, 2), oma = c(0, 0, 5, 0))
    
    qqnorm(x)
    qqline(x, col = "red")
    ### Parameters of corresponding normal distribution
    mu <- mean(x)
    sigma <- sd(x)
    ### Create vectors m quantiles of normal and chosen distributions
    normal_quantiles <- qnorm(c(.001, seq(.05, .99, .05), .999), mu, sigma)
    names(normal_quantiles) <- paste0(seq(0, 100, 5), "%")
    sample_quantiles <- quantile(x, seq(0, 1, .05))

    if (input$type == "Light-tailed"){
      density_quantiles <- dunif(sample_quantiles)
    } else if(input$type == "Heavy-tailed"){
      density_quantiles <- dt(sample_quantiles, 2)
    } else if(input$type == "Normal"){
      density_quantiles <- dnorm(sample_quantiles, mu, sigma)
    } else if(input$type == "Negatively skewed"){
      density_quantiles <- dbeta(sample_quantiles, 15, 2)
    } else if(input$type == "Positively skewed"){
      density_quantiles <- dgamma(sample_quantiles, 2)
    }
    ### Plot both distributions and quantiles
    plot(normal_quantiles, dnorm(normal_quantiles, mu, sigma), type = "b",
         xlim = range(normal_quantiles, sample_quantiles), 
         ylim = range(dnorm(normal_quantiles, mu, sigma), density_quantiles),
         col = "red", pch = 0,
         main = "Densities (lines) and quantiles (symbols)")
    lines(sample_quantiles, density_quantiles, type = "b")
    
    barplot(height = rbind(sample_quantiles, normal_quantiles), beside = TRUE,
            col = c("black", "red"),
            main = "Sample quantiles vs Normal quantiles")
    boxplot(x, rnorm(length(x), mu, sigma), border = c("black", "red"),
            names = c("Sample", "Corresponding Normal"), 
            main = "Sample quantiles vs Normal quantiles")
    title(main = if (input$type == "Light-tailed"){
        "Sample quantiles drawn from Uniform(0,1) (black) against corresponding normal quantiles (red)"
      } else if(input$type == "Heavy-tailed"){
        expression(bold(paste("Sample quantiles drawn from t"[2], " (black) against corresponding normal quantiles (red)")))
      } else if(input$type == "Normal"){
        paste0("Sample quantiles drawn from Normal(", round(mu, 1), ",", round(sigma^2, 1), ") (black) against corresponding normal quantiles (red)")
      } else if(input$type == "Negatively skewed"){
        "Sample quantiles drawn from Beta(15,2) (black) against corresponding normal quantiles (red)"
      } else if(input$type == "Positively skewed"){
        "Sample quantiles drawn from Gamma(2) (black) against corresponding normal quantiles (red)"
      }, outer = TRUE, cex.main = 1.5)
  })
  
})


shinyApp(ui, server)
    } else if(input$type == "Heavy-tailed"){
      rt(n, 2)
    } else if(input$type == "Normal"){
      rnorm(n)
    } else if(input$type == "Negatively skewed"){
      rbeta(n, 15, 2)
    } else if(input$type == "Positively skewed"){
      rgamma(n, 2)
    }
    
    par(mfrow = c(2, 2), mar = c(2, 2, 2, 2), oma = c(0, 0, 5, 0))
    
    qqnorm(x)
    qqline(x, col = "red")
    ### Parameters of corresponding normal distribution
    mu <- mean(x)
    sigma <- sd(x)
    ### Create vectors m quantiles of normal and chosen distributions
    normal_quantiles <- qnorm(c(.001, seq(.05, .99, .05), .999), mu, sigma)
    names(normal_quantiles) <- paste0(seq(0, 100, 5), "%")
    sample_quantiles <- quantile(x, seq(0, 1, .05))

    if (input$type == "Light-tailed"){
      density_quantiles <- dunif(sample_quantiles)
    } else if(input$type == "Heavy-tailed"){
      density_quantiles <- dt(sample_quantiles, 2)
    } else if(input$type == "Normal"){
      density_quantiles <- dnorm(sample_quantiles, mu, sigma)
    } else if(input$type == "Negatively skewed"){
      density_quantiles <- dbeta(sample_quantiles, 15, 2)
    } else if(input$type == "Positively skewed"){
      density_quantiles <- dgamma(sample_quantiles, 2)
    }
    ### Plot both distributions and quantiles
    plot(normal_quantiles, dnorm(normal_quantiles, mu, sigma), type = "b",
         xlim = range(normal_quantiles, sample_quantiles), 
         ylim = range(dnorm(normal_quantiles, mu, sigma), density_quantiles),
         col = "red", pch = 0,
         main = "Densities (lines) and quantiles (symbols)")
    lines(sample_quantiles, density_quantiles, type = "b")
    
    barplot(height = rbind(sample_quantiles, normal_quantiles), beside = TRUE,
            col = c("black", "red"),
            main = "Sample quantiles vs Normal quantiles")
    boxplot(x, rnorm(length(x), mu, sigma), border = c("black", "red"),
            names = c("Sample", "Corresponding Normal"), 
            main = "Sample quantiles vs Normal quantiles")
    title(main = "Sample quantiles (black) against corresponding normal quantiles (red)",
          outer = TRUE, cex.main = 1.5)
  })
  
})


shinyApp(ui, server)
