source('Input.R', local = TRUE)
source('Output.R', local = TRUE)

SummaryDataTab <- navbarMenu("Summary Data",
       
       
       tabPanel(
         tags$style(tags$html(".centered { text-align: center;} .dropdown-menu { width: 18em; background-color: #ecf0f1;}")),
         useShinyjs(),
         
         title = div( h4("ICMP & ZOI Size", style = "padding: 0.5em;"),
           img(src="ICMP.png", style = "width: inherit;"),
           style = "display: inline-block; align-items: center; width: 15em;  padding-bottom: 0.5em;"),
         
         
     
     ##############################################################################################################################
     ######################### INPUTS
     ##############################################################################################################################
     
     ### columns within a row have to add up to a width of 12. Here we are using 3 columns with widths of 2, 5 and 5 within this first row. The first column contains
     ### another 3 rows to split it up into an even finer grid.
     column(3,
            fluidRow(
              column(12,
                 wellPanel(
                   ToggleData,
                   Researcher,
                   conditionalPanel(
                     condition = "input.toggleData == 'Zone of Inhibition'",
                     ICMP
                   ),
                   conditionalPanel(
                     condition = "input.toggleData == 'Bioluminescence'",
                     ICMPAlex
                   ),
                  RemoveZero
                 )
              )
            ),
            fluidRow(
              column(12,
                     conditionalPanel(
                       condition = "input.toggleData == 'Zone of Inhibition'",
                       Condition
                     )
              )
            ),
            fluidRow(
              column(12,
                   conditionalPanel(
                     condition = "input.toggleData == 'Zone of Inhibition'",
                       wellPanel(
                         TestedAgainst,
                         StrainShara
                       )
                   ),
                   conditionalPanel(
                     condition = "input.toggleData == 'Bioluminescence'",
                       wellPanel(
                         TestedAgainstAlex,
                         StrainAlex
                       )
                   )
              )
            ),
            fluidRow(
              column(12,
                     conditionalPanel(
                       condition = "input.toggleData == 'Zone of Inhibition'",
                       Media
                     ),
                     conditionalPanel(
                       condition = "input.toggleData == 'Bioluminescence'",
                       MediaAlex
                     )
              )
            ),
            fluidRow(
              column(12,
                     conditionalPanel(
                       condition = "input.toggleData == 'Zone of Inhibition'",
                       SizePercent
                     )
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
              ),
              fluidRow(
                column(12,
                       Plot2
                )
              )
        ),
     
     fluidRow(
       column(12,
              DataTableTesting
       )
      )
     ),
     
     
     
     tabPanel(
         
         title = div( h4("Other", style = "padding: 0.5em;"),
                      img(src="Other.png", style = "width: inherit;"),
                      style = "display: inline-block; align-items: center; width: 15em;  padding-bottom: 0.5em;"),
       
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
                         wellPanel(
                           TestedAgainstOther
                         )
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
                          Plot3
                  ),
                  column(6,
                         Plot4
                  )
                ),
                fluidRow(
                  column(6,
                         Plot5
                  )
                )
         )
      )

     )
#)
#)
)
#)

