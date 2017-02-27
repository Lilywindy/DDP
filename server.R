#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
data(cars)
shinyServer(function(input, output) {
  model = lm(dist ~ speed, data = cars)
  modelpre <- reactive({
    speedInput <- input$sliderSpeed
    predict(model, newdata = data.frame(speed = speedInput))
  })
  output$plot1 <- renderPlot({
    speedInput <- input$sliderSpeed
    plot(cars$speed,cars$dist, xlab = "Speed (MPH)",
         ylab = "Distance")
    if(input$showModel) {
      abline(model, col = "red",lwd = 2)
    }
    points(speedInput,modelpre(),col = "yellow",pch = 16,cex = 3)
  })
  output$pred <- renderText({
    modelpre()
  })
})
