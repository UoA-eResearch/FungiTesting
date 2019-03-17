library(plyr)
library(plotly)

##################################################################
########### Set up functionality for the shiny app here
##################################################################


customServer <- function(input, output, session) {
  source('Reactive.R', local = TRUE)
  
  ICMPData <- sort(unique(data$ICMP))
  
  TestedAgainstData <- sort(unique(data$TestedAgainst))
  
  updateSelectizeInput(session, 'ICMP', choices = ICMPData, server = TRUE)
  updateSelectizeInput(session, 'ICMPAlex', choices = sort(unique(data$ICMP)), server = TRUE)
  updateSelectizeInput(session, 'ICMPOther', choices = ICMPData, server = TRUE)
  updateSelectizeInput(session, 'ICMP1', choices = sort(unique(dataSharaIndiv$ICMP)), server = TRUE)
  updateSelectizeInput(session, 'ICMP2', choices = ICMPData, server = TRUE)
  updateSelectizeInput(session, 'ICMP3', choices = ICMPData, server = TRUE)
  updateSelectizeInput(session, 'ICMP4', choices = ICMPData, server = TRUE)
  updateSelectizeInput(session, 'ICMP5', choices = ICMPData, server = TRUE)
  
  researcher <- sort(unique(data$Researcher))
  updateSelectizeInput(session, 'Researcher', choices = researcher, selected = researcher[[2]], server = TRUE)
  
  phylum <- sort(unique(data$Phylum))
  updateSelectizeInput(session, 'Phylum', choices = phylum, server = TRUE)
  
  timePoints <- sort(unique(data$TimePoint))
  updateSelectizeInput(session, 'TimePoint', choices = timePoints, selected = 3, server = TRUE)
  
  updateSelectizeInput(session, 'TestedAgainst', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
  updateSelectizeInput(session, 'TestedAgainstAlex', choices = TestedAgainstData, server = TRUE)
  updateSelectizeInput(session, 'TestedAgainstOther', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
  updateSelectizeInput(session, 'TestedAgainst2', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
  updateSelectizeInput(session, 'TestedAgainst3', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
  updateSelectizeInput(session, 'TestedAgainst4', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
  updateSelectizeInput(session, 'TestedAgainst5', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
  
  updateSelectizeInput(session, 'StrainShara', choices = unique(data$Strain), selected = unique(data$Strain), server = TRUE)
  updateSelectizeInput(session, 'StrainAlex', choices = unique(data$Strain), selected = unique(data$Strain), server = TRUE)
  
  
  ####################################################################################################
  ############### Plot 1
  ####################################################################################################
  
  ### output$"ElementName" is the UI element that you want the plot to be rendered/drawn to
  output$plot1 <- renderPlotly({
    
    dataChosen <- input$toggleData
    
    if(dataChosen == "Zone of Inhibition"){
      current <- as.data.frame(reactiveDataSummary())
      
      titlex <- 'ICMP'
      titley <- 'Zone of Inhibition Size (mm)'
    }
    else if(dataChosen == "Bioluminescence"){
      current <- as.data.frame(reactiveDataAlex())
      
      titlex <- 'ICMP'
      titley <- 'Luminescence'
    }
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$ICMP)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    ### Do something for each entry in the data set sorted by ICMP
    for(entry in uniqueVal){
      
      ### Get all data with the same ICMP, but exclude missing values
      group <- data.frame(current[(current$ICMP == entry), ])
      
      if(dataChosen == "Zone of Inhibition"){
        if(length(group$ZOISize) == 0){
          next
        }
        
        html("icmpPlot", "ICMP and Zone of Inhibition Size")
        pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box", colors = "Set1")
      }
      else if(dataChosen == "Bioluminescence"){
        if(length(group$Lux) == 0){
          next
        }
        
        html("icmpPlot", "ICMP and Luminescence")
        pl <- add_boxplot(pl, x = NULL, y = group$Lux, name = entry, type = "box", colors = "Set1")
      }
      
    }
    
    pl %>%
      layout(
        xaxis = list(
          type = 'category',
          title = titlex
        ),
        yaxis = list(
          title = titley
        ))
  })
  
  
  
  ####################################################################################################
  ############### Plot 2
  ####################################################################################################
  
  #colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)', 'rgb(51, 102, 0)')
  
  output$plot2 <- renderPlotly({
    
    dataChosen <- input$toggleData
    
    if(dataChosen == "Zone of Inhibition"){
      current <- as.data.frame(reactiveDataSummary())
      titley <- 'Zone of Inhibition Size (mm)'
    }
    else if(dataChosen == "Bioluminescence"){
      current <- as.data.frame(reactiveDataAlex())
      titley <- 'Luminescence'
    }
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$Media)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    for(entry in uniqueVal){
      
      group <- data.frame(current[(current$Media == entry), ])
      
      if(dataChosen == "Zone of Inhibition"){
        if(length(group$ZOISize) == 0){
          next
        }
        
        html("mediaPlot", "Media Affect on Zone of Inhibition Size")
        pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box", colors = "Set1")
      }
      else if(dataChosen == "Bioluminescence"){
        if(length(group$Lux) == 0){
          next
        }
        
        html("mediaPlot", "Media Affect on Luminescence")
        pl <- add_boxplot(pl, x = NULL, y = group$Lux, name = entry, type = "box", colors = "Set1")
      }
    }
    
    pl %>%
      layout(
        xaxis = list(
          type = 'category',
          title = 'Media'
        ),
        yaxis = list(
          title = titley
        ))
  })
  
  
  ####################################################################################################
  ############### Plot 3
  ####################################################################################################
  
  output$plot3 <- renderPlotly({
    
    current <- as.data.frame(reactiveDataSummaryOther())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$SizePercent)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    
    for(entry in uniqueVal){
      
      ### Get all data with the same Size, but exclude missing values
      group <- data.frame(current[(current$SizePercent == entry), ])
      
      if(length(group$ZOISize) == 0){
        next
      }
      pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box", colors = "Set1") 
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
    
    current <- as.data.frame(reactiveDataSummaryOther())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$Condition)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    
    for(entry in uniqueVal){
      
      ### Get all data with the same Condition, but exclude missing values
      group <- data.frame(current[(current$Condition == entry), ])
      
      if(length(group$ZOISize) == 0){
        next
      }
      
      pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box", colors = "Set1")
      
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
    
    current <- as.data.frame(reactiveDataSummaryOther())
    pl <- plot_ly()
    
    if(length(current$Age) > 0){
      
      densityAge <- density(na.exclude(current$Age))
      
      pl <- plot_ly(x = ~densityAge$x, y = ~densityAge$y, type = 'scatter', mode = 'lines', fill = 'tozeroy', colors = "Set1")
    }
    
    pl %>%
      layout(
        xaxis = list(title = 'Days Old'),
        yaxis = list(title = 'Density'))
    
  })
  
  
  
  ####################################################################################################
  ############### plot individual growth rate
  ####################################################################################################
  
  output$plotGrowthRate <- renderPlotly({
    
    data <- reactiveDataIndividualGrowth()

    ### Create empty chart as variable pl because we want to add several data sets to it in a loop
    pl <-plot_ly()

    if(input$colourBy == "Condition"){
      pl <- plot_ly(x = ~data$Age, y = ~data$SizeMM, type = 'scatter', color = ~data$Condition)
    }
    else{
      pl <- plot_ly(x = ~data$Age, y = ~data$SizeMM, type = 'scatter', color = ~data$Media, colors = "Paired")
    }
    

    pl %>%
      #add_trace(y = ~growthRate, name = 'Growth Rate', line = list(color = 'rgb(205, 12, 24)', width = 4, dash = 'dot')) %>%
      layout(
        xaxis = list(title = 'Age'),
        yaxis = list(title = 'Size (mm diameter)'))


    
  })
  
  ####################################################################################################
  ############### plot individual percent growth
  ####################################################################################################
  
  output$plotPercentGrowth <- renderPlotly({
    
    data <- reactiveDataIndividualPercentGrowth()
    data <- data[order(data$SizePercent),]
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(data$SizePercent)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    pl <- plot_ly(x = data$SizePercent, y = data$ZOISize, name = "Data", type = "scatter", colors = "Set1")
    pl <- add_trace(pl, y = ~median(data$ZOISize, na.rm = TRUE), name = "Median", type = "scatter", colors = "Set1", mode = 'lines')
    
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
  ############### plot individual media
  ####################################################################################################
  
  output$plotMedia <- renderPlotly({
    
    data <- reactiveDataIndividualMedia()
    
    p <- plot_ly()
    
    light <- filter(data, Condition == "L")
    dark <- filter(data, Condition == "D")
    
    if(input$L3){
      p <- add_boxplot(p, x = NULL, y = light$ZOISize, name = paste(light$Media, "Light", sep = " / "), color = light$Condition, colors = "Spectral", type = "box")
    }
    if(input$D3){
      p <- add_boxplot(p, x = NULL, y = dark$ZOISize, name = paste(dark$Media, "Dark", sep = " / "), color = dark$Condition, colors = "Spectral", type = "box")
    }
    
    p
    p %>%
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
  ############### plot indvidual light
  ####################################################################################################
  
  output$plotLight <- renderPlotly({
    
    data <- reactiveDataIndividualLight()
    
    p <- plot_ly()
    
    p <- add_boxplot(p, x = NULL, y = data$ZOISize, name = data$Condition, color = data$Condition, colors = "Spectral", type = "box")
    
    
    p
    p %>%
      layout(
        xaxis = list(
          type = 'category',
          title = 'Condition'
        ),
        yaxis = list(
          title = 'Zone of Inhibition Size (mm)'
        ))
    
  })
  
  ####################################################################################################
  ############### plot individual age
  ####################################################################################################
  
  output$plotAge <- renderPlotly({
    
    data <- reactiveDataIndividualAge()
    
    ### Create empty chart as variable pl because we want to add several data sets to it in a loop
    pl <-plot_ly()
    numCol <- length(unique(data$ZOISize))
    
    pl <- plot_ly(x = ~data$Age, y = ~data$ZOISize, name = "ZOI Size", color = ~data$ZOISize, type = 'scatter', colors = rev(green2red(numCol)))
    
    
    pl %>%
      layout(
        xaxis = list(title = 'Age'),
        yaxis = list(title = 'Size (mm diameter)')) %>%
      colorbar(title = "ZOI Size")
    
  })
  
  
  ####################################################################################################
  ############### Output table of data that is currently selected
  ####################################################################################################

  ### Summary
  #############################################################
  
  output$tableTesting <- renderTable({
    if(input$toggleData == "Zone of Inhibition"){
      show <- reactiveDataSummary()
    }
    else if(input$toggleData == "Bioluminescence"){
      show <- reactiveDataAlex()
    }
    
    show
    
  })
  
  output$tableMeasure <- renderTable({
    #reactiveDataIndividual()
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