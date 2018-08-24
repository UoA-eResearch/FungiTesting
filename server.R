library(dplyr)
library(plotly)

server <- function(input, output) {
  
  datTest <- read.csv("FungiTesting.csv")
  datMeas <- read.csv("FungiMeasurements.csv")
  data <- datTest[order(datTest$DaysOld),]
  
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
      )
  })
  
  output$tab <- renderTable({
      reactiveDataChosen()
    })
  
  
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
                 #The 'pull' attribute can also be used to create space between the sectors
                 showlegend = FALSE) %>%
      layout(title = 'Average Zones Produced by Media',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
  perc <- function(num, sum){
    val <- (num*100)/sum
  }
  
}