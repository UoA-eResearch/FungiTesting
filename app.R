library(shiny)
library(plotly)
library(shinythemes)
source('SummaryDataTab.R')
source('IndividualDataTab.R')
source('MapDataTab.R')
source('customServer.R')


shinyApp(
  ui = navbarPage("Fungi Interactive Data", theme = shinytheme("flatly"),
          SummaryDataTab,
          IndividualDataTab,
          MapDataTab
        ),
  server = customServer
)