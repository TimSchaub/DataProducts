#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Lottery Odds"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("noBalls",
                   "Number of balls to draw from",
                   min = 10,
                   max = 150,
                   value = 49),
      sliderInput("noNums",
                  "Number of balls drawn",
                  min = 3,
                  max = 40,
                  value = 6
                  ),
      checkboxInput("log",
                    "Scale: log10",
                    TRUE),
      tags$div(
        tags$p("Usage of the tool:"),
        tags$p("Use sliders to control the number of balls in the total ballot and the number of balls to be drawn. "),
        tags$p("Use the log10 option to control the scale of display.")
      )
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1")
       
    )
  )
))
