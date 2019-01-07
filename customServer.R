library(dplyr)
library(plotly)

##################################################################
########### Set up functionality for the shiny app here
##################################################################


customServer <- function(input, output, session) {
  source('Reactive.R', local = TRUE)
  
  ####################################################################################################
  ############### Populate UI dorpdowns with data from files
  ####################################################################################################
  
  #updateSelectizeInput(session, 'ICMP', choices = sort(datTest$ICMP), server = TRUE)
  #updateSelectizeInput(session, 'Media', choices = c("All", as.character(datTest$Media)), selected = "All", server = TRUE)
  
  observe({
    updateSelectizeInput(session, 'ICMP', choices = sort(reactiveDataChosen()$ICMP), server = TRUE)
  })
  
  
  
  ####################################################################################################
  ############### Plot 1
  ####################################################################################################
  
  ### output$"ElementName" is the UI element that you want the plot to be rendered/drawn to
  output$plot1 <- renderPlotly({
    
    dataCurrent <- reactiveDataChosen()
    age <- dataCurrent$DaysOld
    size <- dataCurrent$Size
    zoisize <- dataCurrent$ZOISize
    
    
    ### Create the actual scatter plot as variable p
    p <- plot_ly()
  })
  
  
  ####################################################################################################
  ############### Output table of data that is currently selected
  ####################################################################################################
  output$tab <- renderTable({
      reactiveDataChosen()
  })
  
  
  ####################################################################################################
  ############### Plot 2
  ####################################################################################################
  
  colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)', 'rgb(51, 102, 0)')
  
  output$plot2 <- renderPlotly({
    
    ### Save data to variables according to the Media
    PDA <- datMeas[(datMeas$Media == "PDA"), ]
    MEA <- datMeas[(datMeas$Media == "MEA"), ]
    WA <- datMeas[(datMeas$Media == "WA"), ]
    CEA <- datMeas[(datMeas$Media == "CEA"), ]
    REA <- datMeas[(datMeas$Media == "REA"), ]
    OEA <- datMeas[(datMeas$Media == "OEA"), ]
    
    ### mean(PDA$Size, na.rm=TRUE) calculates the mean for each of the rows in the variable PDA
    ### na.rm=TRUE removes all values that are Not Applicable (missing) because the calculation of the mean value would otherwise fail
    ### meansData is of type dataframe and contains all the other columns of the data set (Condition, Size...)
    ### meansList is of type list and only contains the mean values which we need for the pie chart
    
    meansData <- data.frame(PDA = mean(PDA$Size, na.rm=TRUE), MEA= mean(MEA$Size, na.rm=TRUE), WA = mean(WA$Size, na.rm=TRUE), CEA = mean(CEA$Size, na.rm=TRUE), REA = mean(REA$Size, na.rm=TRUE), OEA = mean(OEA$Size, na.rm=TRUE))
    meansList <- c(meansData$PDA, meansData$MEA, meansData$WA, meansData$CEA, meansData$REA, meansData$OEA)
    
    
    ### Create the actual pie chart as variable p
    p <- plot_ly()
  })
  
  
  ####################################################################################################
  ############### Plot 3 Line Chart - Growth rate of the fungi depending on media and condition selected
  ####################################################################################################
  
  output$plot3 <- renderPlotly({
    
    ### Create empty chart as variable pl because we want to add several data sets to it in a loop
    pl <-plot_ly()
    current <- reactiveDataChosenMeas()
    
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
           }
        
        
      }
    }
  })
  
  
  ####################################################################################################
  ############### Calculate growth rates
  ####################################################################################################
  
  calculateGrowth <- function(past, present){
    ((present - past) / past) * 100
  }

}