library(plyr)
library(plotly)

##################################################################
########### Set up functionality for the shiny app here
##################################################################


customServer <- function(input, output, session) {
  source('Reactive.R', local = TRUE)
  
  observe({
    updateSelectizeInput(session, 'ICMP', choices = sort(reactiveDataChosenMeas()$ICMP), server = TRUE)
  })
  
  
  
  ####################################################################################################
  ############### Plot 1
  ####################################################################################################
  
  ### output$"ElementName" is the UI element that you want the plot to be rendered/drawn to
  output$plot1 <- renderPlotly({
    
    current <- as.data.frame(reactiveDataChosen())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$ICMP)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    ### Do something for each entry in the data set sorted by ICMP
    for(entry in uniqueVal){
      
      ### Get all data with the same ICMP, but exclude missing values
      group <- data.frame(na.exclude(current[(current$ICMP == entry), ]))
      
      if(length(group$ZOISize) == 0){
        next
      }
      
      pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box")
      
    }
    
    pl %>%
      layout(
        xaxis = list(
          type = 'category',
          title = 'ICMP'
        ),
        yaxis = list(
          title = 'Zone of Inhibition Size (mm)'
        ))
  })
  
  
  
  ####################################################################################################
  ############### Plot 2
  ####################################################################################################
  
  #colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)', 'rgb(51, 102, 0)')
  
  output$plot2 <- renderPlotly({
    
    current <- as.data.frame(reactiveDataChosen())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$Media)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    
    for(entry in uniqueVal){
      
      ### Get all data with the same Media, but exclude missing values
      group <- data.frame(na.exclude(current[(current$Media == entry), ]))
      
      if(length(group$ZOISize) == 0){
        next
      }
      
      pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box")
      
    }
    
    pl %>%
      layout(
        xaxis = list(
          type = 'category',
          title = 'Media'
        ),
        yaxis = list(
          title = 'Zone of Inhibition Size (mm)'
        ))
  })
  
  
  ####################################################################################################
  ############### Plot 3
  ####################################################################################################
  
  output$plot3 <- renderPlotly({
    
    current <- as.data.frame(reactiveDataChosen())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$Size)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    
    for(entry in uniqueVal){
      
      ### Get all data with the same Size, but exclude missing values
      group <- data.frame(na.exclude(current[(current$Size == entry), ]))
      
      if(length(group$ZOISize) == 0){
        next
      }
      pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box") 
    }
    
    pl %>%
      layout(
        xaxis = list(
          type = 'category',
          title = 'Size (Percent)'
        ),
        yaxis = list(
          title = 'Zone of Inhibition Size (mm)'
        ))
  })
  
  
  
  ####################################################################################################
  ############### Plot 4
  ####################################################################################################
  
  output$plot4 <- renderPlotly({
    
    current <- as.data.frame(reactiveDataChosen())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$Condition)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    
    for(entry in uniqueVal){
      
      ### Get all data with the same Condition, but exclude missing values
      group <- data.frame(na.exclude(current[(current$Condition == entry), ]))
      
      if(length(group$ZOISize) == 0){
        next
      }
      
      pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box")
      
    }
    
    pl %>%
      layout(
        xaxis = list(
          type = 'category',
          title = 'Light Condition'
        ),
        yaxis = list(
          title = 'Zone of Inhibition Size (mm)'
        ))
  })
  
  
  
  ####################################################################################################
  ############### Plot 5
  ####################################################################################################
  
  output$plot5 <- renderPlotly({
    
    current <- as.data.frame(na.exclude(reactiveDataChosen()))
    #current <- na.exclude(current[(current$ICMP == 15652), ])
    
    
    densityAge <- density(current$DaysOld)
    
    pl <- plot_ly(x = ~densityAge$x, y = ~densityAge$y, type = 'scatter', mode = 'lines', fill = 'tozeroy') %>%
            layout(
              xaxis = list(title = 'Days Old'),
              yaxis = list(title = 'Zone of Inhibition Size'))
          
  })
  
  
  ####################################################################################################
  ############### Output table of data that is currently selected
  ####################################################################################################

  output$tableTesting <- renderTable({
    reactiveDataChosen()
  })
  
  output$tableMeasure <- renderTable({
    reactiveDataChosenMeas()
  })
  
  ####################################################################################################
  ############### Calculate growth rates
  ####################################################################################################
  
  calculateGrowth <- function(past, present){
    ((present - past) / past) * 100
  }

}