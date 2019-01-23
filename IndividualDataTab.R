


IndividualDataTab <- tabPanel("Individual Data",
                              
                              fluidPage(
                                h3("Select a Graph:"),
                                navlistPanel(
                                  widths = c(3, 9),
                                  
                                  "Growth Data",
                                  
                                  tabPanel(
                                    title = div(
                                      img(src="growthrate.png", style = "height: inherit; padding: 0.5em;"),
                                      h4("Growth Rate", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"),
                                    
                                    
                                    column(3,
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                  wellPanel(
                                                    ICMP1,
                                                    RemoveZero1,
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
                                                    Media1
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
                                  
                                  "Zone of Inhibition Data",
                                  
                                  tabPanel(
                                    title = div(
                                        img(src="percentsize.png", style = "height: inherit; padding: 0.5em;"),
                                        h4("Percent Growth Size", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"),
                                    
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
                                                    Media2
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    TestedAgainst2
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
                                    title = div(
                                      img(src = "media.png", style = "height: inherit; padding: 0.5em;"),
                                      h4("Media", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"
                                    ),
                                    
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
                                                    Media3
                                             )
                                           ),
                                           fluidRow(
                                             column(12, offset = 0, style='padding:0px;',
                                                    TestedAgainst3
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
                                    title = div(
                                      img(src = "light.png", style = "height: inherit; padding: 0.5em;"),
                                      h4("Light", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"
                                    ),
                                    
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
                                                    TestedAgainst4
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
                                    title = div(
                                      img(src = "age.png", style = "height: inherit; padding: 0.5em;"),
                                      h4("Age", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"
                                    ),
                                    
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
                                                    TestedAgainst5
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
                              )
)
