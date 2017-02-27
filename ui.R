

library(shiny)

data(cars)

shinyUI(fluidPage(
  tags$strong("This is a Shiny app. Just select your speed number and click the submit button"),
  titlePanel("Predict distance from speed"),
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderSpeed","What is the speed?",
                   min = 1,
                   max = 25,
                   value = 15
                   ),
       checkboxInput("showModel","Show/Hide Model",value = TRUE),
       submitButton("Submit")
    ),
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted distance from Model"),
       textOutput("pred")
    )
  )
))
