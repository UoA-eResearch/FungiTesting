source('customServer.R', local = TRUE)

#########################################################################################################
########### Load data from .csv files and subset to what user has chosen in UI
#########################################################################################################


data_filtered <- reactive({
  d <- filter(data_combined, Researcher == input$Researcher)
})


####################################################################################################
############### Reactive data Alex
####################################################################################################

reactiveDataAlex <- reactive({
  
  data <- data_filtered()
  
  if(!is.null(input$ICMPAlex)){
    data <- filter(data, ICMP %in% as.list(input$ICMPAlex))
  }
  
  if(!is.null(input$StrainAlex)){
    data <- filter(data, Strain %in% as.list(input$StrainAlex))
  }
  
  if(!is.null(input$Phylum)){
    data <- filter(data, Phylum %in% as.list(input$Phylum))
  }
  
  if(!is.null(input$TimePoint)){
    data <- filter(data, TimePoint %in% as.list(input$TimePoint))
  }
  
  if(!is.null(input$TestedAgainstAlex)){
    data <- filter(data, TestedAgainst %in% as.list(input$TestedAgainstAlex))
  }
  
  
  if(!is.null(input$MediaAlex)){
    data <- filter(data, Media %in% as.list(input$MediaAlex))
  }
  
  
  if(input$ZeroToOne){
    data[data$LogInhibition == 0, "LogInhibition"] <- 1
  }
  
  #data <- na.exclude(data)
  
  data
  
})

####################################################################################################
############### Reactive data Shara
####################################################################################################

reactiveDataSummary <- reactive({
  
  data <- data_filtered()
  
  if(input$L){ retL <- "L" }
  else{retL <- ""}
  
  if(input$D){ retD <- "D" }
  else{retD <- ""}

  
  if(!is.null(input$ICMP)){
    data <- filter(data, ICMP %in% as.list(input$ICMP))
  }
  
  if(!is.null(input$TestedAgainst)){
    data <- filter(data, TestedAgainst %in% as.list(input$TestedAgainst))
  }
  
  if(!is.null(input$Media)){
    data <- filter(data, Media %in% as.list(input$Media))
  }
  
  data <- filter(data, Condition == retL | Condition == retD)
  
  if(!is.null(input$StrainShara)){
    data <- filter(data, Strain %in% as.list(input$StrainShara))
  }
  
  if(!is.null(input$Phylum)){
    data <- filter(data, Phylum %in% as.list(input$Phylum))
  }
  
  if(input$RemoveZero){
    data <- data %>% dplyr::na_if(6)
  }
  
  if(input$sizePercent != "All"){
    data <- filter(data, SizePercent %in% as.list(input$sizePercent))
  }
  #data <- na.exclude(data)
  data
  
})


####################################################################################################
############### Reactive data Shara Other
####################################################################################################

reactiveDataSummaryOther <- reactive({
  
  data <- data_filtered()
  
  if(input$LOther){ retL <- "L" }
  else{retL <- ""}
  
  if(input$DOther){ retD <- "D" }
  else{retD <- ""}
  
  if(!is.null(input$ICMPOther)){
    data <- filter(data, ICMP %in% as.list(input$ICMPOther))
  }
  
  if(!is.null(input$MediaOther)){
    data <- filter(data, Media %in% as.list(input$MediaOther))
  }
  
  data <- filter(data, Condition == retL | Condition == retD)
  
  if(!is.null(input$TestedAgainstOther)){
    data <- filter(data, TestedAgainst %in% as.list(input$TestedAgainstOther))
  }
  
  if(input$RemoveZeroOther){
    data <- data %>% dplyr::na_if(6)
  }
  
  if(input$ZeroToOneOther){
    data[data$LogInhibition == 0, "LogInhibition"] <- 1
  }
  
  #data <- na.exclude(data)
  
  data
  
  
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
  
  if(!is.null(input$Media1)){
    dataSharaIndiv <- filter(dataSharaIndiv, Media %in% as.list(input$Media1))
  }
  
  
  #if(input$RemoveZero1){
  #  dataSharaIndiv <- dataSharaIndiv %>% dplyr::na_if(6)
  #}
  
  dataSharaIndiv <- filter(dataSharaIndiv, Condition == retL | Condition == retD)
  
  #dataSharaIndiv <- na.exclude(dataSharaIndiv)
  
  dataSharaIndiv
  
})

####################################################################################################
############### Reactive data percent growth
####################################################################################################

reactiveDataIndividualPercentGrowth <- reactive({
  
  data <- data_filtered()
  
  if(input$L2){ retL <- "L" }
  else{retL <- ""}
  
  if(input$D2){ retD <- "D" }
  else{retD <- ""}
  
  if(!is.null(input$ICMP2)){
    data <- filter(data, ICMP %in% as.list(input$ICMP2))
  }
  
  if(!is.null(input$Media2)){
    data <- filter(data, Media %in% as.list(input$Media2))
  }
  
  data <- filter(data, Condition == retL | Condition == retD)
  
  if(input$sizePercent2 != "All"){
    data <- filter(data, SizePercent %in% as.list(input$sizePercent2))
  }
  
  if(!is.null(input$TestedAgainst2)){
    data <- filter(data, TestedAgainst %in% as.list(input$TestedAgainst2))
  }
  
  if(input$RemoveZero2){
    data <- data %>% dplyr::na_if(6)
  }
  
  #data <- na.exclude(data)
  
  data
  
})

####################################################################################################
############### Reactive data media
####################################################################################################

reactiveDataIndividualMedia <- reactive({
  
  data <- data_filtered()
  
  if(input$L3){ retL <- "L" }
  else{retL <- ""}
  
  if(input$D3){ retD <- "D" }
  else{retD <- ""}
  
  if(!is.null(input$ICMP3)){
    data <- filter(data, ICMP %in% as.list(input$ICMP3))
  }
  
  if(!is.null(input$Media3)){
    data <- filter(data, Media %in% as.list(input$Media3))
  }
  
  
  data <- filter(data, Condition == retL | Condition == retD)
  
  if(!is.null(input$TestedAgainst3)){
    data <- filter(data, TestedAgainst %in% as.list(input$TestedAgainst3))
  }
  
  if(input$RemoveZero3){
    data <- data %>% dplyr::na_if(6)
  }
  
  #data <- na.exclude(data)
  
  data
  
})

####################################################################################################
############### Reactive data light
####################################################################################################

reactiveDataIndividualLight <- reactive({
  
  data <- data_filtered()
  
  
  if(!is.null(input$ICMP4)){
    data <- filter(data, ICMP %in% as.list(input$ICMP4))
  }
  
  if(!is.null(input$TestedAgainst4)){
    data <- filter(data, TestedAgainst %in% as.list(input$TestedAgainst4))
  }
  
  if(input$RemoveZero4){
    data <- data %>% dplyr::na_if(6)
  }
  
  #data <- na.exclude(data)
  
  data
  
})

####################################################################################################
############### Reactive data age
####################################################################################################

reactiveDataIndividualAge <- reactive({
  
  data <- data_filtered()
  
  if(!is.null(input$ICMP5)){
    data <- filter(data, ICMP %in% as.list(input$ICMP5))
  }
  
  if(!is.null(input$TestedAgainst5)){
    data <- filter(data, TestedAgainst %in% as.list(input$TestedAgainst5))
  }
  
  if(input$RemoveZero5){
    data <- data %>% dplyr::na_if(6)
  }
  
  #data <- na.exclude(data)
  
  data
  
})
