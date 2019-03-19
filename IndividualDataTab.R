source('Input.R', local = TRUE)
source('Output.R', local = TRUE)

IndividualDataTab <- navbarMenu("Individual Data",
                                  
                                  tabPanel(
                                    
                                    title = div( h4("Growth Rate", style = "padding: 0.5em;"),
                                                 img(src="growthrate.png", style = "width: inherit;"),
                                                 style = "display: inline-block; align-items: center; width: 15em;  padding-bottom: 0.5em;"),
                                    
                                    
                                    column(3,
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                  wellPanel(
                                                    ICMP1,
                                                    ColourBy
                                                  )
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    Condition1
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    wellPanel(
                                                      Media1
                                                    )
                                             )
                                           )
                                           
                                    ),
                                    
                                    ##############################################################################################################################
                                    ######################### OUTPUTS
                                    ##############################################################################################################################
                                    column(9,
                                           PlotGrowthRate
                                    ),
                                  
                                  fluidRow(
                                    column(12,
                                           DataTableIndivGrowth
                                    )
                                  )
                                    
                                    
                                    
                                  ),
                                  
                                  tabPanel(
                                    
                                    title = div( h4("Percent Growth Size", style = "padding: 0.5em;"),
                                                 img(src="percentsize.png", style = "width: inherit;"),
                                                 style = "display: inline-block; align-items: center; width: 15em;  padding-bottom: 0.5em;"),
                                    
                                    column(3,
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    wellPanel(
                                                      ICMP2,
                                                      RemoveZero2
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    Condition2
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    wellPanel(
                                                      Media2,
                                                      TestedAgainst2
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    SizePercent2
                                             )
                                           )
                                    ),
                                    
                                    ##############################################################################################################################
                                    ######################### OUTPUTS
                                    ##############################################################################################################################
                                    column(9,
                                           fluidRow(
                                             column(12,
                                                    PlotPercentGrowth
                                             )
                                           )
                                    ),
                                    
                                    fluidRow(
                                      column(12,
                                             DataTableIndivPercentGrowth
                                      )
                                    )
                                  
                                    ),
                                  
                                  tabPanel(
                                    
                                    title = div( h4("Media", style = "padding: 0.5em;"),
                                                 img(src="media.png", style = "width: inherit;"),
                                                 style = "display: inline-block; align-items: center; width: 15em;  padding-bottom: 0.5em;"),
                                    
                                    column(3,
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    wellPanel(
                                                      ICMP3,
                                                      RemoveZero3
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    Condition3
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    wellPanel(
                                                      Media3,
                                                      TestedAgainst3
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
                                                    PlotMedia
                                             )
                                           )
                                    ),
                                    
                                    fluidRow(
                                      column(12,
                                             DataTableIndivMedia
                                      )
                                    )
                                    
                                  ),
                                  
                                  tabPanel(
                                    
                                    title = div( h4("Light", style = "padding: 0.5em;"),
                                                 img(src="light.png", style = "width: inherit;"),
                                                 style = "display: inline-block; align-items: center; width: 15em;  padding-bottom: 0.5em;"),
                                    
                                    column(3,
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    wellPanel(
                                                      ICMP4,
                                                      RemoveZero4
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    wellPanel(
                                                      TestedAgainst4
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
                                                    PlotLight
                                             )
                                           )
                                    ),
                                    
                                    fluidRow(
                                      column(12,
                                             DataTableIndivLight
                                      )
                                    )
                                    
                                  ),
                                  
                                  tabPanel(
                                    
                                    title = div( h4("Age", style = "padding: 0.5em;"),
                                                 img(src="age.png", style = "width: inherit;"),
                                                 style = "display: inline-block; align-items: center; width: 15em;  padding-bottom: 0.5em;"),
                                    
                                    column(3,
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    wellPanel(
                                                      ICMP5,
                                                      RemoveZero5
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    wellPanel(
                                                      TestedAgainst5
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
                                                    PlotAge
                                             )
                                           )
                                    ),
                                    
                                    fluidRow(
                                      column(12,
                                             DataTableIndivAge
                                      )
                                    )
                                    
                                  )
)
