library(plyr)
library(plotly)

##################################################################
########### Set up functionality for the shiny app here
##################################################################


customServer <- function(input, output, session) {
  source('Reactive.R', local = TRUE)
  
  researcher <- sort(unique(data_combined$Researcher))
  updateSelectizeInput(session, 'Researcher', choices = researcher, selected = researcher[[2]], server = TRUE)
  
  observeEvent(input$Researcher, {
    selData <- filter(data_combined, Researcher == input$Researcher)
    
    ICMPData <- sort(unique(selData$ICMP))
    updateSelectizeInput(session, 'ICMP', choices = ICMPData, server = TRUE)
    updateSelectizeInput(session, 'ICMPAlex', choices = ICMPData, server = TRUE)
    updateSelectizeInput(session, 'ICMPOther', choices = ICMPData, server = TRUE)
    updateSelectizeInput(session, 'ICMP1', choices = sort(unique(dataSharaIndiv$ICMP)), server = TRUE)
    updateSelectizeInput(session, 'ICMP2', choices = ICMPData, server = TRUE)
    updateSelectizeInput(session, 'ICMP3', choices = ICMPData, server = TRUE)
    updateSelectizeInput(session, 'ICMP4', choices = ICMPData, server = TRUE)
    updateSelectizeInput(session, 'ICMP5', choices = ICMPData, server = TRUE)
    
    PhylumData <- sort(unique(selData$Phylum))
    updateSelectizeInput(session, 'Phylum', choices = PhylumData, selected = PhylumData, server = TRUE)
    
    TimePointsData <- sort(unique(selData$TimePoint))
    updateSelectizeInput(session, 'TimePoint', choices = TimePointsData, selected = 3, server = TRUE)
    
    TestedAgainstData <- sort(unique(selData$TestedAgainst))
    updateSelectizeInput(session, 'TestedAgainst', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
    updateSelectizeInput(session, 'TestedAgainstAlex', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
    updateSelectizeInput(session, 'TestedAgainstOther', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
    updateSelectizeInput(session, 'TestedAgainst2', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
    updateSelectizeInput(session, 'TestedAgainst3', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
    updateSelectizeInput(session, 'TestedAgainst4', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
    updateSelectizeInput(session, 'TestedAgainst5', choices = TestedAgainstData, selected = TestedAgainstData, server = TRUE)
    
     StrainData <- sort(unique(selData$Strain))
     updateSelectizeInput(session, 'StrainShara', choices = StrainData, selected = StrainData, server = TRUE)
     updateSelectizeInput(session, 'StrainAlex', choices = StrainData, selected = StrainData, server = TRUE)
    
    MediaData <- sort(unique(selData$Media))
    MediaDataIndiv <- sort(unique(dataSharaIndiv$Media))
    updateSelectizeInput(session, 'Media', choices = MediaData, selected = MediaData, server = TRUE)
    updateSelectizeInput(session, 'MediaAlex', choices = MediaData, selected = MediaData, server = TRUE)
    updateSelectizeInput(session, 'MediaOther', choices = MediaData, selected = MediaData, server = TRUE)
    updateSelectizeInput(session, 'Media1', choices = MediaDataIndiv, selected = MediaDataIndiv, server = TRUE)
    updateSelectizeInput(session, 'Media2', choices = MediaData, selected = MediaData, server = TRUE)
    updateSelectizeInput(session, 'Media3', choices = MediaData, selected = MediaData, server = TRUE)
    
  })
  
  # observeEvent(input$TestedAgainst, {
  #   current <- data_combined  #as.data.frame(reactiveDataSummary())
  #   inpT <- input$TestedAgainst
  #   print(inpT)
  #   current <- filter(current, TestedAgainst == inpT)
  #   
  #   output$uiStrain <- renderUI({
  #     if(!is.null(input$TestedAgainst)){
  #       selectizeInput("StrainShara", choices = current$Strain, selected = current$Strain, h5(tags$b("Strain")), multiple = TRUE)
  #     }
  #   })
    
    #b <- filter(current, TestedAgainst %in% as.list(input$TestedAgainst))
    #s <- sort(unique(current$Strain))
    #print(s)
    #updateSelectizeInput(session, 'StrainShara', choices = NULL, selected=NULL, server = TRUE)
    #updateSelectizeInput(session, 'StrainShara', choices = s, selected = s, server = TRUE)
  #})
  # 
  # observeEvent(input$TestedAgainstAlex, {
  #   selData <- filter(data_combined, Researcher == input$Researcher)
  #   StrainData <- sort(unique(selData$Strain))
  #   updateSelectizeInput(session, 'StrainAlex', choices = StrainData, selected = StrainData, server = TRUE)
  # })
  # 
  # observeEvent(input$TestedAgainstOther, {
  #   selData <- filter(data_combined, Researcher == input$Researcher)
  #   StrainData <- sort(unique(selData$Strain))
  #   updateSelectizeInput(session, 'StrainShara', choices = StrainData, selected = StrainData, server = TRUE)
  # })
  # 
  # observeEvent(input$TestedAgainst2, {
  #   selData <- filter(data_combined, Researcher == input$Researcher)
  #   StrainData <- sort(unique(selData$Strain))
  #   updateSelectizeInput(session, 'StrainShara', choices = StrainData, selected = StrainData, server = TRUE)
  # })
  # 
  # observeEvent(input$TestedAgainst3, {
  #   selData <- filter(data_combined, Researcher == input$Researcher)
  #   StrainData <- sort(unique(selData$Strain))
  #   updateSelectizeInput(session, 'StrainShara', choices = StrainData, selected = StrainData, server = TRUE)
  # })
  # 
  # observeEvent(input$TestedAgainst4, {
  #   selData <- filter(data_combined, Researcher == input$Researcher)
  #   StrainData <- sort(unique(selData$Strain))
  #   updateSelectizeInput(session, 'StrainShara', choices = StrainData, selected = StrainData, server = TRUE)
  # })
  # 
  # observeEvent(input$TestedAgainst5, {
  #   selData <- filter(data_combined, Researcher == input$Researcher)
  #   StrainData <- sort(unique(selData$Strain))
  #   updateSelectizeInput(session, 'StrainShara', choices = StrainData, selected = StrainData, server = TRUE)
  # })
  
  
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
        pl <- add_boxplot(pl, x = entry, y = group$ZOISize, name = entry, type = "box", colors = "Set1")
        
      }
      else if(dataChosen == "Bioluminescence"){
        if(length(group$Lux) == 0){
          next
        }
        
        html("icmpPlot", "ICMP and Luminescence")
        pl <- add_boxplot(pl, x = NULL, y = group$Lux, name = entry, type = "box", colors = "Set1")
        pl <- layout(pl, yaxis = list(type = "log"))
      }
      
    }
    #pl %>% geom_abline(intercept = 6)
    
    m <- list(
      l = 100,
      r = 100,
      b = -15,
      t = 10,
      pad = 0
    )
    
    pl %>% layout(
      xaxis = list(
        type = 'category',
        title = titlex
      ),
      yaxis = list(
        title = titley
      ),
      autosize = F, width = 1000, height = 900)
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
        pl <- layout(pl, yaxis = list(type = "log"))
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
    
    
    twenty <- data.frame(current[(current$SizePercent == 20), ])
    fifty <- data.frame(current[(current$SizePercent == 50), ])
    hundred <- data.frame(current[(current$SizePercent == 100), ])
    
    
    if(input$sizePercentOther == 20 || input$sizePercentOther == "All"){
      pl <- add_boxplot(pl, x = NULL, y = twenty$ZOISize, name = "20%", type = "box", colors = "Set1")
    }
    if(input$sizePercentOther == 50 || input$sizePercentOther == "All"){
      pl <- add_boxplot(pl, x = NULL, y = fifty$ZOISize, name = "50%", type = "box", colors = "Set1")
    }
    if(input$sizePercentOther == 100 || input$sizePercentOther == "All"){
      pl <- add_boxplot(pl, x = NULL, y = hundred$ZOISize, name = "100%", type = "box", colors = "Set1")
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
  ############### Plot Additional - Tested Against
  ####################################################################################################
  
  output$plotAdditional <- renderPlotly({
    
    dataChosen <- input$toggleData
    current <- as.data.frame(reactiveDataSummaryOther())
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$TestedAgainst)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    
    for(entry in uniqueVal){
      
      group <- data.frame(current[(current$TestedAgainst == entry), ])
      
      if(dataChosen == "Zone of Inhibition"){
        if(length(group$ZOISize) == 0){
          next
        }
        
        pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box", colors = "Set1")
      }
      else if(dataChosen == "Bioluminescence"){
        if(length(group$Lux) == 0){
          next
        }
          
        pl <- add_boxplot(pl, x = NULL, y = group$Lux, name = entry, type = "box", colors = "Set1")
      }
    }
    
    pl %>%
      layout(
        xaxis = list(
          type = 'category',
          title = 'Tested Against'
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
      pl <- plot_ly(x = data$Age, y = data$SizeMM, mode = 'lines', type = 'scatter', transforms = list(
        list(
          type = 'aggregate',
          groups = data$Age,
          aggregations = list(
            list(
              target = 'y', func = 'median', enabled = T
            )
          )
        )
      ), symbol = data$Media, color = data$Condition)
    }
    else{
      pl <- plot_ly(x = data$Age, y = data$SizeMM, mode = 'lines', type = 'scatter',transforms = list(
        list(
          type = 'aggregate',
          groups = data$Age,
          aggregations = list(
            list(
              target = 'y', func = 'median', enabled = T
            )
          )
        )
      ), symbol = data$Condition, color = data$Media, colors = "Paired")
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
    
    current <- reactiveDataIndividualPercentGrowth()
    
    pl <- plot_ly()
    
    # uniqueVal <- as.array(sort(unique(data$SizePercent)))
    # uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    # 
    # pl <- plot_ly(x = data$SizePercent, y = data$ZOISize, name = "Data", type = "scatter", colors = "Set1")
    # pl <- add_trace(pl, y = ~median(data$ZOISize, na.rm = TRUE), name = "Median", type = "scatter", colors = "Set1", mode = 'lines')
    # 
    # pl %>%
    #   layout(
    #     xaxis = list(
    #       type = 'category',
    #       title = 'Size (Percent)'
    #     ),
    #     yaxis = list(
    #       title = 'Zone of Inhibition Size (mm)'
    #     ))
    # 
    # 
    # pl <- plot_ly()
    
    
    twenty <- data.frame(current[(current$SizePercent == 20), ])
    fifty <- data.frame(current[(current$SizePercent == 50), ])
    hundred <- data.frame(current[(current$SizePercent == 100), ])
    
    if(input$sizePercent2 == 20 || input$sizePercent2 == "All"){
      pl <- add_boxplot(pl, x = NULL, y = twenty$ZOISize, name = "20%", type = "box", colors = "Set1") 
    }
    if(input$sizePercent2 == 50 || input$sizePercent2 == "All"){
      pl <- add_boxplot(pl, x = NULL, y = fifty$ZOISize, name = "50%", type = "box", colors = "Set1")
    }
    if(input$sizePercent2 == 100 || input$sizePercent2 == "All"){
      pl <- add_boxplot(pl, x = NULL, y = hundred$ZOISize, name = "100%", type = "box", colors = "Set1")
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
    
    pl <- plot_ly(x = ~data$Age, y = ~data$ZOISize, name = data$Media, color = ~data$Media, type = 'scatter', colors = rev(green2red(numCol)))
    
    
    pl %>%
      layout(
        xaxis = list(title = 'Age'),
        yaxis = list(title = 'Size (mm diameter)'))
    
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