source('Input.R', local = TRUE)
source('Output.R', local = TRUE)

SummaryDataTab <- navbarMenu("Summary Data",
                             
                             
                             tabPanel(
                               tags$style(tags$html(".centered { text-align: center;} .dropdown-menu { width: 18em; background-color: #ecf0f1;}")),
                               useShinyjs(),
                               useShinyalert(),
                               
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
                                                 ColorPalette
                                               )
                                        )
                                      ),
                                      fluidRow(
                                        column(12,
                                               conditionalPanel(
                                                 condition = "input.toggleData == 'Zone of Inhibition' && input.Researcher",
                                                 wellPanel(ICMP,
                                                           RemoveZero,
                                                           h5(tags$b("Condition")),
                                                           Condition,
                                                           TestedAgainst,
                                                           StrainShara,
                                                           Media,
                                                           SizePercent)
                                               ),
                                               conditionalPanel(
                                                 condition = "input.toggleData == 'Bioluminescence' && input.Researcher",
                                                 wellPanel(ICMPAlex,
                                                           ZeroToOne,
                                                           TestedAgainstAlex,
                                                           StrainAlex,
                                                           MediaAlex,
                                                           TimePoint)
                                               )
                                        )
                                      ),
                                      fluidRow(
                                        column(12,
                                               conditionalPanel(
                                                 condition = "input.Researcher",
                                                 wellPanel(
                                                   Phylum
                                                 )
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
                                               conditionalPanel(
                                                 condition = "input.Researcher",
                                                 Plot1
                                               ),
                                               conditionalPanel(
                                                 condition = "!input.Researcher",
                                                 NoData
                                               )
                                        )
                                      ),
                                      fluidRow(
                                        column(12,
                                               conditionalPanel(
                                                 condition = "input.Researcher",
                                                 Plot2
                                               )
                                        )
                                      )
                               ),
                               
                               fluidRow(
                                 column(12,
                                        conditionalPanel(
                                          condition = "input.Researcher",
                                          DataTableTesting
                                        )
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
                                                   conditionalPanel(
                                                     condition = "input.toggleData == 'Zone of Inhibition' && input.Researcher",
                                                     RemoveZeroOther
                                                   ),
                                                   conditionalPanel(
                                                     condition = "input.toggleData == 'Bioluminescence' && input.Researcher",
                                                     ZeroToOneOther
                                                   )
                                                 )
                                          )
                                        ),
                                        fluidRow(
                                          column(12,
                                                 conditionalPanel(
                                                   condition = "input.Researcher",
                                                   ConditionOther
                                                 )
                                          )
                                        ),
                                        fluidRow(
                                          column(12,
                                                 conditionalPanel(
                                                   condition = "input.Researcher",
                                                   wellPanel(
                                                     TestedAgainstOther,
                                                     MediaOther
                                                   )
                                                 )
                                          )
                                        ),
                                        fluidRow(
                                          column(12,
                                                 conditionalPanel(
                                                   condition = "input.Researcher",
                                                   SizePercentOther
                                                 )
                                          )
                                        )
                                 ),
                                 
                                 ##############################################################################################################################
                                 ######################### OUTPUTS
                                 ##############################################################################################################################
                                 column(9,
                                        fluidRow(
                                          column(6,
                                                 conditionalPanel(
                                                   condition = "input.Researcher",
                                                   Plot3
                                                 )
                                          ),
                                          column(6,
                                                 conditionalPanel(
                                                   condition = "input.Researcher",
                                                   Plot4
                                                 )
                                          )
                                        ),
                                        fluidRow(
                                          column(6,
                                                 conditionalPanel(
                                                   condition = "input.Researcher",
                                                   Plot5
                                                 )
                                          ),
                                          column(6,
                                                 conditionalPanel(
                                                   condition = "input.Researcher",
                                                   PlotAdditional
                                                 )
                                          )
                                        )
                                 )
                               )
                               
                             )
                             #)
                             #)
)
#)

