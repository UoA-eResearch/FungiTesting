library(plyr)
library(plotly)

##################################################################
########### Set up functionality for the shiny app here
##################################################################

data_combined <- read.csv("fungi_combined.csv")
dataSharaIndiv <- read.csv("fungi_individual_shara.csv")

customServer <- function(input, output, session) {
  source('Reactive.R', local = TRUE)
  
  
  observeEvent(input$toggleData, {
    researcher <- sort(unique(data_combined$Researcher))
    updateSelectizeInput(session, 'Researcher', choices = researcher, selected = NULL, server = TRUE)
  })
  
  
  observeEvent(input$Researcher, {
    
    selData <- data_filtered()#filter(data_combined, Researcher == input$Researcher)
    
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
    
  }, ignoreInit = TRUE, ignoreNULL = TRUE)
  
  output$message <- renderText({
    HTML(
      '<h2 style="text-align: center;"><span style="color: #993366;"><strong><img src="./info.svg" alt="" width="101" height="102"/></strong></span></h2>
        <h3 style="text-align: center;"><span style="color: #008080;"><strong>No data chosen!</strong></span></h3>
        <h3 style="text-align: center;"><span style="color: #008080;"><strong>Please select from the list of researchers on the left.</strong></span></h3>'
    )
  })
  
  ####################################################################################################
  ############### Plot 1
  ####################################################################################################
  
  ### output$"ElementName" is the UI element that you want the plot to be rendered/drawn to
  output$plot1 <- renderPlotly({
    tryCatch({
    
    dataChosen <- input$toggleData
    
    if(dataChosen == "Zone of Inhibition"){
      current <- as.data.frame(reactiveDataSummary())
      
      titlex <- 'ICMP'
      titley <- 'Zone of Inhibition Size (mm)'
    }
    else if(dataChosen == "Bioluminescence"){
      current <- as.data.frame(reactiveDataAlex())
      
      titlex <- 'ICMP'
      titley <- 'Log Inhibition'
    }
    
    pl <- plot_ly(autosize = F, width = 1000, height = 900)
    
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
        if(length(group$LogInhibition) == 0){
          next
        }
        
        html("icmpPlot", "ICMP and Luminescence")
        pl <- add_boxplot(pl, x = NULL, y = group$LogInhibition, name = entry, type = "box", colors = "Set1")
        #pl <- layout(pl, yaxis = list(type = "log"))
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
      ))
 
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  ####################################################################################################
  ############### Plot 2
  ####################################################################################################
  
  #colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)', 'rgb(51, 102, 0)')
  
  output$plot2 <- renderPlotly({
    
  tryCatch({
    
    dataChosen <- input$toggleData
    
    if(dataChosen == "Zone of Inhibition"){
      current <- as.data.frame(reactiveDataSummary())
      titley <- 'Zone of Inhibition Size (mm)'
    }
    else if(dataChosen == "Bioluminescence"){
      current <- as.data.frame(reactiveDataAlex())
      titley <- 'Log Inhibition'
    }
    
    pl <- plot_ly()
    
    uniqueVal <- as.array(sort(unique(current$Media)))
    uniqueVal <- as.list(uniqueVal[uniqueVal != ""])
    
    #registerDoParallel(n_cores)
    
    for(entry in uniqueVal){#%dopar%{
      
      group <- data.frame(current[(current$Media == entry), ])
      
      if(dataChosen == "Zone of Inhibition"){
        if(length(group$ZOISize) == 0){
          next
        }
        
        html("mediaPlot", "Media Affect on Zone of Inhibition Size")
        pl <- add_boxplot(pl, x = NULL, y = group$ZOISize, name = entry, type = "box", colors = "Set1")
      }
      else if(dataChosen == "Bioluminescence"){
        if(length(group$LogInhibition) == 0){
          next
        }
        
        html("mediaPlot", "Media Affect on Luminescence")
        pl <- add_boxplot(pl, x = NULL, y = group$LogInhibition, name = entry, type = "box", colors = "Set1")
        #pl <- layout(pl, yaxis = list(type = "log"))
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
    
  },error = function(e) {
    
  }, finally = {
    
  })
  })
  
  
  ####################################################################################################
  ############### Plot 3
  ####################################################################################################
  
  output$plot3 <- renderPlotly({
    
    tryCatch({
    
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
    
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  
  
  ####################################################################################################
  ############### Plot 4
  ####################################################################################################
  
  output$plot4 <- renderPlotly({
    
    tryCatch({
    
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
    
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  
  
  ####################################################################################################
  ############### Plot Additional - Tested Against
  ####################################################################################################
  
  output$plotAdditional <- renderPlotly({
    
    tryCatch({
    
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
        if(length(group$LogInhibition) == 0){
          next
        }
        
        pl <- add_boxplot(pl, x = NULL, y = group$LogInhibition, name = entry, type = "box", colors = "Set1")
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
    
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  
  
  ####################################################################################################
  ############### Plot 5
  ####################################################################################################
  
  output$plot5 <- renderPlotly({
    
    tryCatch({
    
    current <- as.data.frame(reactiveDataSummaryOther())
    
    pl <- plot_ly()
    
    if(length(current$ZOISize) > 0){
      
      ZOISize <- current$ZOISize
      Age <- current$Age
      
      a <- data.frame(ZOISize, Age)
      #print(a)
      
      densityZOI <- density(na.exclude(a$ZOISize))
      print(densityZOI)
      
      pl <- plot_ly(x = ~densityZOI$x, y = ~densityZOI$y, type = 'scatter', mode = 'lines', fill = 'tozeroy', colors = "Set1")
      #pl <- plot_ly(x = ~current$Age, type = 'histogram', colors = "Set1")
    }
    
    }, error = function(e) {
      
    }, finally = {
      
    })
  
  })
  
  
  
  ####################################################################################################
  ############### plot individual growth rate
  ####################################################################################################
  
  output$plotGrowthRate <- renderPlotly({
    
    tryCatch({
    
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
    
    }, error = function(e) {
      
    }, finally = {
      
    })
    
  })
  
  ####################################################################################################
  ############### plot individual percent growth
  ####################################################################################################
  
  output$plotPercentGrowth <- renderPlotly({
    
    tryCatch({
    
    current <- reactiveDataIndividualPercentGrowth()
    
    pl <- plot_ly()
    
    
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
    
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  ####################################################################################################
  ############### plot individual media
  ####################################################################################################
  
  output$plotMedia <- renderPlotly({
    
    tryCatch({
    
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
    
    },  error = function(e) {
      
    }, finally = {
      
    })
  })
  
  ####################################################################################################
  ############### plot indvidual light
  ####################################################################################################
  
  output$plotLight <- renderPlotly({
    
    tryCatch({
    
    data <- reactiveDataIndividualLight()
    
    p <- plot_ly()
    
    p <- add_boxplot(p, x = NULL, y = data$ZOISize, name = data$Condition, color = data$Condition, colors = "Spectral", type = "box")
    
    p %>%
      layout(
        xaxis = list(
          type = 'category',
          title = 'Condition'
        ),
        yaxis = list(
          title = 'Zone of Inhibition Size (mm)'
        ))
    
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  ####################################################################################################
  ############### plot individual age
  ####################################################################################################
  
  output$plotAge <- renderPlotly({
    
    tryCatch({
    
    data <- reactiveDataIndividualAge()
    
    ### Create empty chart as variable pl because we want to add several data sets to it in a loop
    pl <-plot_ly()
    numCol <- length(unique(data$ZOISize))
    
    pl <- plot_ly(x = ~data$Age, y = ~data$ZOISize, name = data$Media, color = ~data$Media, type = 'scatter', colors = rev(green2red(numCol)))
    
    
    pl %>%
      layout(
        xaxis = list(title = 'Age'),
        yaxis = list(title = 'Size (mm diameter)'))
    
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  
  ####################################################################################################
  ############### Output table of data that is currently selected
  ####################################################################################################
  
  ### Summary
  #############################################################
  
  output$tableTesting <- renderTable({
    tryCatch({
    
      if(input$toggleData == "Zone of Inhibition"){
        show <- reactiveDataSummary()
      }
      else if(input$toggleData == "Bioluminescence"){
        show <- reactiveDataAlex()
      }
      show <- show[1:10,]
    
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  output$tableMeasure <- renderTable({
    #reactiveDataIndividual()
  })
  
  ### Individual
  ##############################################################
  
  output$tableIndivGrowth <- renderTable({
    tryCatch({
      show <- reactiveDataIndividualGrowth()
      show <- show[1:10,]
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  output$tableIndivPercentGrowth <- renderTable({
    tryCatch({
      show <- reactiveDataIndividualPercentGrowth()
      show <- show[1:10,]
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  output$tableIndivMedia <- renderTable({
    tryCatch({
      show <- reactiveDataIndividualMedia()
      show <- show[1:10,]
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  output$tableIndivLight <- renderTable({
    tryCatch({
      show <- reactiveDataIndividualLight()
      show <- show[1:10,]
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
  output$tableIndivAge <- renderTable({
    tryCatch({
      show <- reactiveDataIndividualAge()
      show <- show[1:10,]
    }, error = function(e) {
      
    }, finally = {
      
    })
  })
  
}