library(dplyr)
library(plotly)

server <- function(input, output) {
  
  ####################################################################################################
  ############### Load data from files 
  ####################################################################################################
  datTest <- read.csv("FungiTesting.csv")
  datMeas <- read.csv("FungiMeasurements.csv")
  data <- datTest[order(datTest$DaysOld),]
  
  
  ####################################################################################################
  ############### Subset the data depending on what the user selects (Reactive data)
  ####################################################################################################
  reactiveL <- reactive({
    if(input$L){ ret <- "L" }
    else{ret <- ""}
  })
  
  reactiveD <- reactive({
    if(input$D){ ret <- "D" }
    else{ret <- ""}
  })
  
  reactiveKP <- reactive({
    if(input$KP){ ret <- "KP" }
    else{ ret <- ""}
  })
  
  reactiveEC <- reactive({
    if(input$EC){ ret <- "EC" }
    else{ ret <- ""}
  })
  
  ####################################################################################################
  ############### Reactive data from FungiTesting.csv
  ####################################################################################################
  reactiveDataChosen <- reactive({
    dataL <- data[(data$Condition == as.character(reactiveL())), ]
    dataD <- data[(data$Condition == as.character(reactiveD())), ]
    dataKP <- data[(data$TestedAgainst == as.character(reactiveKP())), ]
    dataEC <- data[(data$TestedAgainst == as.character(reactiveEC())), ]
    
    if(!input$Media == "All"){
      dataMedia <- data[(data$Media == as.character(input$Media)), ]
    }
    else{dataMedia <- data}
    
    dat <- intersect(union(dataL, dataD), union(dataKP, dataEC))
    dat <- intersect(dat, dataMedia)
    
    })
  
  ####################################################################################################
  ############### Reactive data from FungiMeasurements.csv
  ####################################################################################################
  reactiveDataChosenMeas <- reactive({
    dataL <- datMeas[(datMeas$Condition == as.character(reactiveL())), ]
    dataD <- datMeas[(datMeas$Condition == as.character(reactiveD())), ]
    
    if(!input$Media == "All"){
      dataM <- datMeas[(datMeas$Media == as.character(input$Media)), ]
    }
    else{dataM <- datMeas}
    
    datMeasure <- union(dataL, dataD)
    
    datMeasure <- intersect(datMeasure, dataM)
    
  })
  
  ####################################################################################################
  ############### Plot 1 Scatter Chart - Correlation of Fungi Size and Age
  ####################################################################################################
  output$plot1 <- renderPlotly({
    dataCurrent <- reactiveDataChosen()
    age <- dataCurrent$DaysOld
    size <- dataCurrent$Size
    zoisize <- dataCurrent$ZOISize
    
    
    p <- plot_ly(
      type = 'scatter',
      x = ~age,
      y = ~size,
      color = ~dataCurrent$Condition,
      size = ~ size,
      symbol = ~dataCurrent$TestedAgainst,
      symbols = c('circle','x','o'),
      mode = 'markers'
      ) %>%
      layout(
        xaxis = list(title = "Age (Days)"),
        yaxis = list(title = "Size (%)")
      )
  })
  
  
  ####################################################################################################
  ############### Output table of data that is currently selected
  ####################################################################################################
  output$tab <- renderTable({
      reactiveDataChosen()
    
  })
  
  
  ####################################################################################################
  ############### Plot 2 Pie Chart - What media produces the largest zones on average
  ####################################################################################################
  
  colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)', 'rgb(51, 102, 0)')
  
  output$plot2 <- renderPlotly({
    
    PDA <- datMeas[(datMeas$Media == "PDA"), ]
    MEA <- datMeas[(datMeas$Media == "MEA"), ]
    WA <- datMeas[(datMeas$Media == "WA"), ]
    CEA <- datMeas[(datMeas$Media == "CEA"), ]
    REA <- datMeas[(datMeas$Media == "REA"), ]
    OEA <- datMeas[(datMeas$Media == "OEA"), ]
    
    meansData <- data.frame(PDA = mean(PDA$Size, na.rm=TRUE), MEA= mean(MEA$Size, na.rm=TRUE), WA = mean(WA$Size, na.rm=TRUE), CEA = mean(CEA$Size, na.rm=TRUE), REA = mean(REA$Size, na.rm=TRUE), OEA = mean(OEA$Size, na.rm=TRUE))
    meansList <- c(meansData$PDA, meansData$MEA, meansData$WA, meansData$CEA, meansData$REA, meansData$OEA)
    
    p <- plot_ly(meansData, labels = ~names(meansData), values = ~meansList, type = 'pie',
                 textposition = 'inside',
                 textinfo = 'label+percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 text = ~paste('Average Size: ', round(meansList, 2), ' mm diameter'),
                 marker = list(colors = colors,
                               line = list(color = '#FFFFFF', width = 1)),
                 pull = 0.05,
                 showlegend = FALSE) %>%
      layout(
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
  
  ####################################################################################################
  ############### Plot 3 Line Chart - Growth rate of the fungi depending on media and condition selected
  ####################################################################################################
  
  output$plot3 <- renderPlotly({
    
    pl <-plot_ly()
    current <- reactiveDataChosenMeas()
    
    media <- c("PDA", "MEA", "WA", "CEA", "REA", "OEA")
    
    for(entry in sort(unique(current$ICMP))){
      
      group <- na.exclude(current[(current$ICMP == entry), ])
      
      for(mediaType in media){
        listDark <- na.exclude(group[(group$Media == mediaType & group$Condition=="D"), ])
        listLight <- na.exclude(group[(group$Media == mediaType & group$Condition=="L"), ])
        
        ############ Add all fungi grown in dark conditions to line chart #################
        for(rep in sort(unique(listDark$Replicate))){
          timeSeries <- na.exclude(listDark[(listDark$Replicate == rep), ])
          
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
        
        ############ Add all fungi grown in light conditions to line chart #################
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
  ############### Calculate growth rates
  ####################################################################################################
  
  calculateGrowth <- function(past, present){
    ((present - past) / past) * 100
  }

}