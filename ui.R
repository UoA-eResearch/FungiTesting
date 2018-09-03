library(shiny)
library(plotly)
library(shinythemes)


ui <- fluidPage(theme = shinytheme("flatly"),
                
tags$style(HTML("
          
          .centered {
            text-align: center;
          }
          
")),
                
titlePanel("Fungi Screening for Antibiotics"),
    
fluidRow(
  column(2,
    fluidRow(
      column(12,
        wellPanel(
          h4(tags$b("Condition")),
          checkboxInput("L","Light", TRUE),
          checkboxInput("D","Dark", FALSE)
        )
      )
    ),
    fluidRow(
      column(12,
        wellPanel(
          h4(tags$b("Tested Against")),
          checkboxInput("KP","Klebsiella Pneumoniae", TRUE),
          checkboxInput("EC","E. Coli", TRUE)
        )
      )
    ),
    fluidRow(
      column(12,
             wellPanel(
               selectInput("Media", h4(tags$b("Media")),
                           c(
                             "PDA" = "PDA",
                             "MEA" = "MEA",
                             "WA" = "WA",
                             "CEA" = "CEA",
                             "REA" = "REA",
                             "OEA" = "OEA",
                             "All" = "All"
                           )
               )
             )
      )
    )
  ),
  column(5,
         wellPanel(
           h4(tags$b(tags$p(class = "centered", "Correlation of Fungi Size and Age"))),
           plotlyOutput("plot1")
         )
         
  ),
  column(5,
         wellPanel(
           h4(tags$b(tags$p(class = "centered", "Growth Rate Depending on Media and Condition Selected"))),
           plotlyOutput("plot3") 
         )
  )
),
    

fluidRow(
    column(7,
           wellPanel(
             h4(tags$b(tags$p(class = "centered", "Selected Data (FungiTesting.csv)"))),
             tableOutput("tab") 
           )
    ),
    column(5,
           wellPanel(
             h4(tags$b(tags$p(class = "centered", "Average Zones Produced by Media"))),
             plotlyOutput("plot2") 
           )
    )
)
  
)
