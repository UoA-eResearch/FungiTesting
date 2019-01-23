

#########################################################################################################
########### Load dataShara from .csv files and subset to what user has chosen in UI
#########################################################################################################

dataShara <- read.csv("fungi_shara.csv")


####################################################################################################
############### Reactive dataShara from FungiTesting.csv
####################################################################################################

reactiveDataSummary <- reactive({
  
  if(input$L){ retL <- "L" }
  else{retL <- ""}
  
  if(input$D){ retD <- "D" }
  else{retD <- ""}
  
  if(input$KP){ retKP <- "KP" }
  else{ retKP <- ""}
  
  if(input$EC){ retEC <- "EC" }
  else{ retEC <- ""}
  
  
  if(!is.null(input$ICMP)){
    dataShara <- filter(dataShara, ICMP %in% input$ICMP)
    
  }
  
  if(!input$Media == "All"){
    dataShara <- filter(dataShara, Media == input$Media)
  }
  
  dataShara <- filter(dataShara, Condition == retL | Condition == retD)
  dataShara <- filter(dataShara, TestedAgainst == retKP| TestedAgainst == retEC)
  
  if(input$RemoveZero){
    dataShara[dataShara == 0] <- NA
  }
  
  if(input$sizePercent != "All"){
    dataShara <- filter(dataShara, Size %in% input$sizePercent)
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
  
})

####################################################################################################
############### Reactive dataMeas from FungiMeasurements.csv
####################################################################################################

reactiveDataIndividual <- reactive({
  
  if(input$L){ retL <- "L" }
  else{retL <- ""}
  
  if(input$D){ retD <- "D" }
  else{retD <- ""}
  
  if(!is.null(input$ICMP)){
    dataShara <- filter(dataShara, ICMP %in% input$ICMP)
  }
  
  if(!input$Media == "All"){
    dataShara <- filter(dataShara, Media == input$Media)
  }
  
  dataShara <- filter(dataShara, Condition == retL | Condition == retD)
  
  if(input$RemoveZero){
    dataShara[dataShara == 0] <- NA
  }
  
  if(input$sizePercent != "All"){
    dataShara <- filter(dataShara, Size %in% input$sizePercent)
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})


####################################################################################################
############### Reactive data growth
####################################################################################################

reactiveDataIndividualGrowth <- reactive({
  
  if(input$L1){ retL <- "L" }
  else{retL <- ""}
  
  if(input$D1){ retD <- "D" }
  else{retD <- ""}
  
  if(!is.null(input$ICMP1)){
    dataShara <- filter(dataShara, ICMP %in% input$ICMP1)
  }
  
  if(!input$Media1 == "All"){
    dataShara <- filter(dataShara, Media == input$Media1)
  }
  
  if(input$RemoveZero1){
    dataShara[dataShara == 0] <- NA
  }
  
  dataShara <- filter(dataShara, Condition == retL | Condition == retD)
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})

####################################################################################################
############### Reactive data percent growth
####################################################################################################

reactiveDataIndividualPercentGrowth <- reactive({
  
  if(input$L2){ retL <- "L" }
  else{retL <- ""}
  
  if(input$D2){ retD <- "D" }
  else{retD <- ""}
  
  if(!is.null(input$ICMP2)){
    dataShara <- filter(dataShara, ICMP %in% input$ICMP2)
  }
  
  if(!input$Media2 == "All"){
    dataShara <- filter(dataShara, Media == input$Media2)
  }
  
  dataShara <- filter(dataShara, Condition == retL | Condition == retD)
  
  if(input$sizePercent2 != "All"){
    dataShara <- filter(dataShara, Size %in% input$sizePercent2)
  }
  
  if(input$KP2){ retKP <- "KP" }
  else{ retKP <- ""}
  
  if(input$EC2){ retEC <- "EC" }
  else{ retEC <- ""}
  
  dataShara <- filter(dataShara, TestedAgainst == retKP| TestedAgainst == retEC)
  
  if(input$RemoveZero2){
    dataShara[dataShara == 0] <- NA
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})

####################################################################################################
############### Reactive data media
####################################################################################################

reactiveDataIndividualMedia <- reactive({
  
  if(input$L3){ retL <- "L" }
  else{retL <- ""}
  
  if(input$D3){ retD <- "D" }
  else{retD <- ""}
  
  if(!is.null(input$ICMP3)){
    dataShara <- filter(dataShara, ICMP %in% input$ICMP3)
  }
  
  if(!input$Media3 == "All"){
    dataShara <- filter(dataShara, Media == input$Media3)
  }
  
  dataShara <- filter(dataShara, Condition == retL | Condition == retD)
  
  
  if(input$KP3){ retKP <- "KP" }
  else{ retKP <- ""}
  
  if(input$EC3){ retEC <- "EC" }
  else{ retEC <- ""}
  
  dataShara <- filter(dataShara, TestedAgainst == retKP| TestedAgainst == retEC)
  
  if(input$RemoveZero3){
    dataShara[dataShara == 0] <- NA
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})

####################################################################################################
############### Reactive data light
####################################################################################################

reactiveDataIndividualLight <- reactive({
  
  
  if(!is.null(input$ICMP4)){
    dataShara <- filter(dataShara, ICMP %in% input$ICMP4)
  }
  
  if(input$KP4){ retKP <- "KP" }
  else{ retKP <- ""}
  
  if(input$EC4){ retEC <- "EC" }
  else{ retEC <- ""}
  
  dataShara <- filter(dataShara, TestedAgainst == retKP| TestedAgainst == retEC)
  
  if(input$RemoveZero4){
    dataShara[dataShara == 0] <- NA
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})

####################################################################################################
############### Reactive data age
####################################################################################################

reactiveDataIndividualAge <- reactive({
  
  if(!is.null(input$ICMP5)){
    dataShara <- filter(dataShara, ICMP %in% input$ICMP5)
  }
  
  if(input$KP5){ retKP <- "KP" }
  else{ retKP <- ""}
  
  if(input$EC5){ retEC <- "EC" }
  else{ retEC <- ""}
  
  dataShara <- filter(dataShara, TestedAgainst == retKP| TestedAgainst == retEC)
  
  if(input$RemoveZero5){
    dataShara[dataShara == 0] <- NA
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})




