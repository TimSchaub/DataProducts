#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  
  lotteryOdds <- reactive({
    i <- c(3:input$noNums)
    j <- (choose(input$noNums, i) * choose(input$noBalls-input$noNums, input$noNums-i))/choose(input$noBalls, input$noNums)
    
    
    if (input$log==TRUE)
      log10(1/j)
    else 
      1/j
  })   
  

  output$plot1 <- renderPlot({
    anYlab <- ifelse(input$log == TRUE, "Win Odds 1:n (log)", "Win Odds 1:n")
    barplot(lotteryOdds(), 
         xlab="Number of hits", 
         ylab=anYlab,
         names.arg=c(3:input$noNums)
         )
    
  })
  
    
})
  

