

#########################################################################################################
########### Load dataShara from .csv files and subset to what user has chosen in UI
#########################################################################################################

dataShara <- read.csv("fungi_shara.csv")
dataSharaIndiv <- read.csv("fungi_individual_shara.csv")


####################################################################################################
############### Reactive data Shara
####################################################################################################

reactiveDataSummary <- reactive({
  
  if(input$L){ retL <- "L" }
  else{retL <- ""}
  
  if(input$D){ retD <- "D" }
  else{retD <- ""}

  
  if(!is.null(input$ICMP)){
    dataShara <- filter(dataShara, ICMP %in% as.list(input$ICMP))
  }
  
  if(!is.null(input$TestedAgainst)){
    dataShara <- filter(dataShara, TestedAgainst %in% as.list(input$TestedAgainst))
  }
  
  if(!input$Media == "All"){
    dataShara <- filter(dataShara, Media == input$Media)
  }
  
  dataShara <- filter(dataShara, Condition == retL | Condition == retD)
  #dataShara <- filter(dataShara, TestedAgainst == retKP| TestedAgainst == retEC)
  
  if(input$RemoveZero){
    dataShara <- dataShara %>% dplyr::na_if(0)
  }
  
  if(input$sizePercent != "All"){
    dataShara <- filter(dataShara, SizePercent %in% as.list(input$sizePercent))
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})


####################################################################################################
############### Reactive data Shara Other
####################################################################################################

reactiveDataSummaryOther <- reactive({
  
  if(input$LOther){ retL <- "L" }
  else{retL <- ""}
  
  if(input$DOther){ retD <- "D" }
  else{retD <- ""}
  
  if(!is.null(input$ICMPOther)){
    dataShara <- filter(dataShara, ICMP %in% as.list(input$ICMPOther))
  }
  
  if(!input$MediaOther == "All"){
    dataShara <- filter(dataShara, Media == input$MediaOther)
  }
  
  dataShara <- filter(dataShara, Condition == retL | Condition == retD)
  
  if(!is.null(input$TestedAgainstOther)){
    dataShara <- filter(dataShara, TestedAgainst %in% as.list(input$TestedAgainstOther))
  }
  
  if(input$RemoveZeroOther){
    dataShara <- dataShara %>% dplyr::na_if(0)
  }
  
  if(input$sizePercentOther != "All"){
    dataShara <- filter(dataShara, SizePercent %in% as.list(input$sizePercentOther))
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
    dataSharaIndiv <- filter(dataSharaIndiv, ICMP %in% as.list(input$ICMP1))
  }
  
  if(!input$Media1 == "All"){
    dataSharaIndiv <- filter(dataSharaIndiv, Media == input$Media1)
  }
  
  if(input$RemoveZero1){
    dataSharaIndiv <- dataSharaIndiv %>% dplyr::na_if(0)
  }
  
  dataSharaIndiv <- filter(dataSharaIndiv, Condition == retL | Condition == retD)
  
  #dataSharaIndiv <- na.exclude(dataSharaIndiv)
  
  dataSharaIndiv
  
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
    dataShara <- filter(dataShara, ICMP %in% as.list(input$ICMP2))
  }
  
  if(!input$Media2 == "All"){
    dataShara <- filter(dataShara, Media == input$Media2)
  }
  
  dataShara <- filter(dataShara, Condition == retL | Condition == retD)
  
  if(input$sizePercent2 != "All"){
    dataShara <- filter(dataShara, SizePercent %in% as.list(input$sizePercent2))
  }
  
  if(!is.null(input$TestedAgainst2)){
    dataShara <- filter(dataShara, TestedAgainst %in% as.list(input$TestedAgainst2))
  }
  
  if(input$RemoveZero2){
    dataShara <- dataShara %>% dplyr::na_if(0)
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
    dataShara <- filter(dataShara, ICMP %in% as.list(input$ICMP3))
  }
  
  if(!input$Media3 == "All"){
    dataShara <- filter(dataShara, Media == input$Media3)
  }
  
  dataShara <- filter(dataShara, Condition == retL | Condition == retD)
  
  if(!is.null(input$TestedAgainst3)){
    dataShara <- filter(dataShara, TestedAgainst %in% as.list(input$TestedAgainst3))
  }
  
  if(input$RemoveZero3){
    dataShara <- dataShara %>% dplyr::na_if(0)
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})

####################################################################################################
############### Reactive data light
####################################################################################################

reactiveDataIndividualLight <- reactive({
  
  
  if(!is.null(input$ICMP4)){
    dataShara <- filter(dataShara, ICMP %in% as.list(input$ICMP4))
  }
  
  if(!is.null(input$TestedAgainst4)){
    dataShara <- filter(dataShara, TestedAgainst %in% as.list(input$TestedAgainst4))
  }
  
  if(input$RemoveZero4){
    dataShara <- dataShara %>% dplyr::na_if(0)
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})

####################################################################################################
############### Reactive data age
####################################################################################################

reactiveDataIndividualAge <- reactive({
  
  if(!is.null(input$ICMP5)){
    dataShara <- filter(dataShara, ICMP %in% as.list(input$ICMP5))
  }
  
  if(!is.null(input$TestedAgainst5)){
    dataShara <- filter(dataShara, TestedAgainst %in% as.list(input$TestedAgainst5))
  }
  
  if(input$RemoveZero5){
    dataShara <- dataShara %>% dplyr::na_if(0)
  }
  
  #dataShara <- na.exclude(dataShara)
  
  dataShara
  
})




