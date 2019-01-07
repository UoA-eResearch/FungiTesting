source('Input.R', local = TRUE)
source('output.R', local = TRUE)

SummaryDataTab <- tabPanel("Summary Data",
   
   tags$style(HTML(".centered { text-align: center;} ")),
   
   
  ### Fluid Row and Column allow to divide the screen into sections (like a grid width flexible width for each cell).
  fluidRow(
     
     ##############################################################################################################################
     ######################### INPUTS
     ##############################################################################################################################
     
     ### columns within a row have to add up to a width of 12. Here we are using 3 columns with widths of 2, 5 and 5 within this first row. The first column contains
     ### another 3 rows to split it up into an even finer grid.
     column(2,
            fluidRow(
              column(12,
                 wellPanel(
                   ICMP,
                   ControlAge,
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
     
     column(5,
            Plot1
     ),
     column(5,
            Plot3
     )
   ),
   
   
   ### This second row has only two columns with widths of 7 and 5.
   fluidRow(
     column(7,
            DataTable
     ),
     column(5,
            Plot2
     )
   )
)
