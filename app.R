library(shiny)
library(plotly)
library(shinythemes)
library(plyr)
library(dplyr)
library(RColorBrewer)
source('SummaryDataTab.R')
source('IndividualDataTab.R')
source('MapDataTab.R')
source('customServer.R')
source('Input.R', local = TRUE)
source('Output.R')
library(colorRamps)
shinyApp(
  ui = navbarPage("Fungi Interactive Data", theme = shinytheme("flatly"),
          SummaryDataTab,
          IndividualDataTab,
          MapDataTab
        ),
  server = customServer
)