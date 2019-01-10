
library(shiny)
library(plotly)
library(shinythemes)
library(dplyr)
library(plyr)
source('SummaryDataTab.R')
source('IndividualDataTab.R')
source('MapDataTab.R')
source('customServer.R')
source('Input.R', local = TRUE)
source('Output.R')

shinyApp(
  ui = navbarPage("Fungi Interactive Data", theme = shinytheme("flatly"),
          SummaryDataTab,
          IndividualDataTab,
          MapDataTab
        ),
  server = customServer
)