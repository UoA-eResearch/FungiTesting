source('Input.R', local = TRUE)
source('Output.R', local = TRUE)

SummaryDataTab <- navbarMenu("Summary Data",
#  tabPanel("Summary Data",
   
   
   
   #fluidPage(
     #h3("Select a Graph:"),
     #navlistPanel(
       #widths = c(2, 10),
       
       
       
       tabPanel(
         tags$style(tags$html(".centered { text-align: center;} .dropdown-menu { width: 25em; background-color: #ecf0f1;}")),
         
         title = div( h4("ICMP & ZOI Size", style = "padding: 0.5em;"),
           img(src="growthrate.png", style = "width: inherit;"),
           style = "display: inline-block; align-items: center; width: 20em;  padding-bottom: 0.5em;"),
         
         
     
     ##############################################################################################################################
     ######################### INPUTS
     ##############################################################################################################################
     
     ### columns within a row have to add up to a width of 12. Here we are using 3 columns with widths of 2, 5 and 5 within this first row. The first column contains
     ### another 3 rows to split it up into an even finer grid.
     column(3,
            fluidRow(
              column(12,
                 wellPanel(
                   ICMP,
                   RemoveZero
                 )
              )
            ),
            fluidRow(
              column(12,
                  Condition
              )
            ),
            fluidRow(
              column(12,
                  TestedAgainst
              )
            ),
            fluidRow(
              column(12,
                  Media
              )
            ),
            fluidRow(
              column(12,
                  SizePercent
              )
            )
     ),
     
     ##############################################################################################################################
     ######################### OUTPUTS
     ##############################################################################################################################
       column(9,
              fluidRow(
                column(12,
                       Plot1
                )
              )
        )
      ),
     
     
     
     tabPanel(
         tags$style(tags$html(".centered { text-align: center;} .dropdown-menu { width: 25em; }")),
         
         title = div( h4("Other", style = "padding: 0.5em;"),
                      img(src="growthrate.png", style = "width: inherit;"),
                      style = "display: inline-block; align-items: center; width: 20em;  padding-bottom: 0.5em;"),
       
       fluidRow(
         column(3,
                fluidRow(
                  column(12,
                         wellPanel(
                           ICMPOther,
                           RemoveZeroOther
                         )
                  )
                ),
                fluidRow(
                  column(12,
                         ConditionOther
                  )
                ),
                fluidRow(
                  column(12,
                         TestedAgainstOther
                  )
                ),
                fluidRow(
                  column(12,
                         MediaOther
                  )
                ),
                fluidRow(
                  column(12,
                         SizePercentOther
                  )
                )
         ),
         
         ##############################################################################################################################
         ######################### OUTPUTS
         ##############################################################################################################################
         column(9,
                fluidRow(
                  column(6,
                         Plot2
                  ),
                  column(6,
                          Plot3
                  )
                ),
                fluidRow(
                  column(6,
                         Plot4
                  ),
                  column(6,
                         Plot5
                  )
                )
         )
      ),
       
       fluidRow(
         column(12,
                DataTableTesting
         )
       )

     )
#)
#)
)
#)

