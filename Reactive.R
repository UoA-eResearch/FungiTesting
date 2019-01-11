

#########################################################################################################
########### Load data from .csv files and subset to what user has chosen in UI
#########################################################################################################

datTest <- read.csv("FungiTesting.csv")
datMeas <- read.csv("FungiMeasurements.csv")

data <- datTest[order(datTest$DaysOld),]


####################################################################################################
############### Subset the data depending on what the user selects (Reactive data)
####################################################################################################

### Reactive data recognises when the user changes the input element, eg clicks on a checkbox or chooses a dropdown option.
### The reactive data (reactiveL, reactiveD...) return strings of what the user has chosen ("L", "D"...) or empty strings if the checkbox is unchecked.
## input$"InputElementName" gets the input value from the element in ui.R called "InputElementName"

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
  ### The variable data is of type dataframe and contains what we read from the .csv file.
  ### Calling data$Condition grabs every entry of the column with the name (top row of csv) Condition.
  ### reactiveL() returns the values according to the reactive variable that we set in the step before this.
  ### as.character makes sure you get a string value as return.
  
  ### The following code retrieves all data where the Condition and the TestedAgainst values match the values you have chosen on the user interface
  ### (Condition could be L or D or both, TestedAgainst could be KP or EC or both)
  
  dataL <- data[(data$Condition == as.character(reactiveL())), ]
  dataD <- data[(data$Condition == as.character(reactiveD())), ]
  dataKP <- data[(data$TestedAgainst == as.character(reactiveKP())), ]
  dataEC <- data[(data$TestedAgainst == as.character(reactiveEC())), ]
  
  if(!input$Media == "All"){
    ### If not all Media are selected, return only the data previously selected if the Media is the same as the user chosen Media
    dataMedia <- data[(data$Media == as.character(input$Media)), ]
  }
  else{dataMedia <- data}
  ### If all media are selected, just return all of the data previously selected by the user
  ### Intersect and Union work the same as you would expect with the theory of sets
  dat <- intersect(union(dataL, dataD), union(dataKP, dataEC))
  dat <- intersect(dat, dataMedia)
  
  if(!is.null(input$ICMP)){
    dat <- na.exclude(subset(dat, dat$ICMP %in% input$ICMP))
  }
  
  dat
  
})

####################################################################################################
############### Reactive data from FungiMeasurements.csv
####################################################################################################

### Do the same as above with the second data set (.csv), except this one doesn't contain the field TestedAgainst (KP, EC)
reactiveDataChosenMeas <- reactive({
  dataL <- datMeas[(datMeas$Condition == as.character(reactiveL())), ]
  dataD <- datMeas[(datMeas$Condition == as.character(reactiveD())), ]
  
  if(!input$Media == "All"){
    dataM <- datMeas[(datMeas$Media == as.character(input$Media)), ]
  }
  else{dataM <- datMeas}
  
  datMeasure <- union(dataL, dataD)
  
  datMeasure <- intersect(datMeasure, dataM)
  
  if(!is.null(input$ICMP)){
    datMeasure <- na.exclude(subset(datMeasure, datMeasure$ICMP %in% input$ICMP))
  }
  
  datMeasure
  
})





