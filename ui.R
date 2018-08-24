library(shiny)
library(plotly)


ui <- fluidPage(
  titlePanel("Fungi Screening for Antibiotics"),
  
    
      fluidRow(
        column(6,
          fluidRow(
            column(6,
                   wellPanel(
                     h4(tags$b("Condition")),
                     checkboxInput("L","Light", TRUE),
                     checkboxInput("D","Dark", TRUE)
                   )
            ),
            column(6,
                   wellPanel(
                     h4(tags$b("Tested Against")),
                     checkboxInput("KP","Klebsiella Pneumoniae", TRUE),
                     checkboxInput("EC","E. Coli", TRUE)
                   )
            )
          ),
          fluidRow(
            column(6,
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
            ),
            column(6,
                   wellPanel(
                     h4(tags$b("Show Values As")),
                     checkboxInput("Average","Average", FALSE)
                   )
            )
          )
        ),
        column(6,
                 plotlyOutput("plot1")
        )
      ),
    

      fluidRow(
        column(6,
               plotlyOutput("plot2")
        ),
        column(6,
          tableOutput("tab"),
          verbatimTextOutput("value")
        )

      )

  
)
