library(shiny)
library(plotly)
library(shinythemes)

##################################################################
########### Set up UI elements for the shiny app here
##################################################################

ui <- fluidPage(theme = shinytheme("flatly"),
                
tags$style(HTML("
          
          .centered {
            text-align: center;
          }
          
")),

### Title            
titlePanel("Fungi Screening for Antibiotics"),
    
### Fluid Row and Column allow to divide the screen into sections (like a grid width flexible width for each cell).
fluidRow(
  ### columns within a row have to add up to a width of 12. Here we are using 3 columns with widths of 2, 5 and 5 within this first row. The first column contains
  ### another 3 rows to split it up into an even finer grid.
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
    

### This second row has only two columns with widths of 7 and 5.
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
