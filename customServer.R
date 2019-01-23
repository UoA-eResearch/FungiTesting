library(plyr)
library(plotly)

##################################################################
########### Set up functionality for the shiny app here
##################################################################


customServer <- function(input, output, session) {
  source('Reactive.R', local = TRUE)
  
  updateSelectizeInput(session, 'ICMP', choices = sort(dataTest$ICMP), server = TRUE)
  updateSelectizeInput(session, 'ICMP1', choices = sort(dataTest$ICMP), server = TRUE)
  updateSelectizeInput(session, 'ICMP2', choices = sort(dataTest$ICMP), server = TRUE)
  updateSelectizeInput(session, 'ICMP3', choices = sort(dataTest$ICMP), server = TRUE)
  updateSelectizeInput(session, 'ICMP4', choices = sort(dataTest$ICMP), server = TRUE)
  updateSelectizeInput(session, 'ICMP5', choices = sort(dataTest$ICMP), server = TRUE)
  
  
  ####################################################################################################
  ############### Plot 1
  ####################################################################################################
  
  ### output$"ElementName" is the UI element that you want the plot to be rendered/drawn to
  output$plot1 <- renderPlotly({
    
    current <- as.data.frame(reactiveDataSummary())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$ICMP)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    ### Do something for each entry in the data set sorted by ICMP
    for(entry in uniqueVal){
      
      ### Get all data with the same ICMP, but exclude missing values
      group <- data.frame(current[(current$ICMP == entry), ])
      
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
    
    current <- as.data.frame(reactiveDataSummary())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$Media)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    
    for(entry in uniqueVal){
      
      ### Get all data with the same Media, but exclude missing values
      group <- data.frame(current[(current$Media == entry), ])
      
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
    
    current <- as.data.frame(reactiveDataSummary())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$Size)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    
    for(entry in uniqueVal){
      
      ### Get all data with the same Size, but exclude missing values
      group <- data.frame(current[(current$Size == entry), ])
      
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
    
    current <- as.data.frame(reactiveDataSummary())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$Condition)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    
    for(entry in uniqueVal){
      
      ### Get all data with the same Condition, but exclude missing values
      group <- data.frame(current[(current$Condition == entry), ])
      
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
    
    current <- as.data.frame(reactiveDataSummary())
    pl <- plot_ly()
    
    if(length(current$DaysOld) > 0){
      
      densityAge <- density(na.exclude(current$DaysOld))
      
      pl <- plot_ly(x = ~densityAge$x, y = ~densityAge$y, type = 'scatter', mode = 'lines', fill = 'tozeroy')
    }
    
    pl %>%
      layout(
        xaxis = list(title = 'Days Old'),
        yaxis = list(title = 'Density'))
    
  })
  
  
  
  ####################################################################################################
  ############### 
  ####################################################################################################
  
  output$PlotGrowthRate <- renderPlotly({
    
    ### Create empty chart as variable pl because we want to add several data sets to it in a loop
    pl <-plot_ly()
    current <- reactiveDataIndividual()
    
    ### c() creates a list, in this case media is a list of strings
    media <- c("PDA", "MEA", "WA", "CEA", "REA", "OEA")
    
    ### Do something for each entry in the data set sorted by ICMP
    for(entry in sort(unique(current$ICMP))){
      
      ### Get all data with the same ICMP, but exclude missing values
      group <- na.exclude(current[(current$ICMP == entry), ])
      
      ### Do something for every type of media that was defined in the list of strings above
      for(mediaType in media){
        listDark <- na.exclude(group[(group$Media == mediaType & group$Condition=="D"), ])
        listLight <- na.exclude(group[(group$Media == mediaType & group$Condition=="L"), ])
        
        ############ Add all fungi grown in DARK CONDITIONS to chart #################
        for(rep in sort(unique(listDark$Replicate))){
          timeSeries <- na.exclude(listDark[(listDark$Replicate == rep), ])
          
          size <- timeSeries$Size
          
          ### Get the growth rate of the fungi and save as variable timeSeries
          timeSeries <- timeSeries %>%
            mutate(Change = (size - lag(size, 1))/lag(size, 1), Percent_Change = Change*100)
          
          age <- c(4, 8, 16, 32, 64, 128)
          
          ### Replace all infinite values and missing values with 0
          Percent_Change <- do.call(data.frame,lapply(timeSeries$Percent_Change, function(x) replace(x, is.infinite(x), 0)))
          Percent_Change <- do.call(data.frame,lapply(timeSeries$Percent_Change, function(x) replace(x, is.na(x), 0)))
          
          ### All columns must have the same amount of values when adding them to the chart, so fill up with 0 if there are less than 6 values in the column
          if(ncol(Percent_Change) < 6){
            for(i in ncol(Percent_Change):5){
              Percent_Change[[as.character(i)]] <- 0
            }
          }
          
          ### Add the calculated growth rate values to the chart pl
          pl <- add_lines(pl, x=~age, y=c(Percent_Change[[1]], Percent_Change[[2]], Percent_Change[[3]], Percent_Change[[4]], Percent_Change[[5]], Percent_Change[[6]]),  type="scatter", mode="markers+lines")
        }
        
        ############ Add all fungi grown in LIGHT CONDITIONS to chart (Same Process as above for the fungi grown in dark conditions) #################
        for(rep in sort(unique(listLight$Replicate))){
          timeSeries <- na.exclude(listLight[(listLight$Replicate == rep), ])
          
          size <- timeSeries$Size
          
          timeSeries <- timeSeries %>%
            mutate(Change = (size - lag(size, 1))/lag(size, 1), Percent_Change = Change*100)
          
          age <- c(4, 8, 16, 32, 64, 128)#do.call(data.frame,lapply(timeSeries$Age, function(x) replace(x, is.infinite(x),NA)))
          Percent_Change <- do.call(data.frame,lapply(timeSeries$Percent_Change, function(x) replace(x, is.infinite(x), 0)))
          Percent_Change <- do.call(data.frame,lapply(timeSeries$Percent_Change, function(x) replace(x, is.na(x), 0)))
          
          
          if(ncol(Percent_Change) < 6){
            for(i in ncol(Percent_Change):5){
              Percent_Change[[as.character(i)]] <- 0
            }
          }
          
          
          pl <- add_lines(pl, x=~age, y=c(Percent_Change[[1]], Percent_Change[[2]], Percent_Change[[3]], Percent_Change[[4]], Percent_Change[[5]], Percent_Change[[6]]),  type="scatter", mode="markers+lines")
        }
        
        
      }
    }
    
    pl %>%
      layout(
        yaxis = list(title = "Growth Rate (%)"),
        xaxis = list(title = "Age (Days)")
      )
  })
  
  
  ####################################################################################################
  ############### Output table of data that is currently selected
  ####################################################################################################

  ### Summary
  #############################################################
  
  output$tableTesting <- renderTable({
    reactiveDataSummary()
  })
  
  output$tableMeasure <- renderTable({
    reactiveDataIndividual()
  })
  
  ### Individual
  ##############################################################
  
  output$tableIndivGrowth <- renderTable({
    reactiveDataIndividualGrowth()
  })
  
  output$tableIndivPercentGrowth <- renderTable({
    reactiveDataIndividualPercentGrowth()
  })
  
  output$tableIndivMedia <- renderTable({
    reactiveDataIndividualMedia()
  })
  
  output$tableIndivLight <- renderTable({
    reactiveDataIndividualLight()
  })
  
  output$tableIndivAge <- renderTable({
    reactiveDataIndividualAge()
  })
  
  ####################################################################################################
  ############### Calculate growth rates
  ####################################################################################################
  
  calculateGrowth <- function(past, present){
    ((present - past) / past) * 100
  }

}