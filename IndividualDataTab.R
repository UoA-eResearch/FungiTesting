


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
                                    
                                    
                                    column(4,
                                           fluidRow(
                                             column(12,
                                                  wellPanel(
                                                    ICMP1,
                                                    RemoveZero1
                                                  )
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    Condition1
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    Media1
                                             )
                                           )
                                           
                                    ),
                                    
                                    ##############################################################################################################################
                                    ######################### OUTPUTS
                                    ##############################################################################################################################
                                    column(8,
                                           fluidRow(
                                             column(12,
                                                    PlotGrowthRate
                                             )
                                           )
                                    ),
                                  
                                  fluidRow(
                                    column(6,
                                           DataTableIndivGrowth
                                    ),
                                    column(6
                                    )
                                  )
                                    
                                    
                                    
                                  ),
                                  
                                  "Zone of Inhibition Data",
                                  
                                  tabPanel(
                                    title = div(
                                        img(src="percentsize.png", style = "height: inherit; padding: 0.5em;"),
                                        h4("Percent Growth Size", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"),
                                    
                                    column(4,
                                           fluidRow(
                                             column(12,
                                                    wellPanel(
                                                      ICMP2,
                                                      RemoveZero2
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    Condition2
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    Media2
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    TestedAgainst2
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    SizePercent2
                                             )
                                           )
                                    ),
                                    
                                    ##############################################################################################################################
                                    ######################### OUTPUTS
                                    ##############################################################################################################################
                                    column(8,
                                           fluidRow(
                                             column(12,
                                                    PlotPercentGrowth
                                             )
                                           )
                                    ),
                                    
                                    fluidRow(
                                      column(6,
                                             DataTableIndivPercentGrowth
                                      ),
                                      column(6
                                      )
                                    )
                                  
                                    ),
                                  
                                  tabPanel(
                                    title = div(
                                      img(src = "media.png", style = "height: inherit; padding: 0.5em;"),
                                      h4("Media", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"
                                    ),
                                    
                                    column(4,
                                           fluidRow(
                                             column(12,
                                                    wellPanel(
                                                      ICMP3,
                                                      RemoveZero3
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    Condition3
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    Media3
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    TestedAgainst3
                                             )
                                           )
                                    ),
                                    
                                    ##############################################################################################################################
                                    ######################### OUTPUTS
                                    ##############################################################################################################################
                                    column(8,
                                           fluidRow(
                                             column(12,
                                                    PlotMedia
                                             )
                                           )
                                    ),
                                    
                                    fluidRow(
                                      column(6,
                                             DataTableIndivMedia
                                      ),
                                      column(6
                                      )
                                    )
                                    
                                  ),
                                  
                                  tabPanel(
                                    title = div(
                                      img(src = "light.png", style = "height: inherit; padding: 0.5em;"),
                                      h4("Light", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"
                                    ),
                                    
                                    column(4,
                                           fluidRow(
                                             column(12,
                                                    wellPanel(
                                                      ICMP4,
                                                      RemoveZero4
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    TestedAgainst4
                                             )
                                           )
                                    ),
                                    
                                    ##############################################################################################################################
                                    ######################### OUTPUTS
                                    ##############################################################################################################################
                                    column(8,
                                           fluidRow(
                                             column(12,
                                                    PlotLight
                                             )
                                           )
                                    ),
                                    
                                    fluidRow(
                                      column(6,
                                             DataTableIndivLight
                                      ),
                                      column(6
                                      )
                                    )
                                    
                                  ),
                                  
                                  tabPanel(
                                    title = div(
                                      img(src = "age.png", style = "height: inherit; padding: 0.5em;"),
                                      h4("Age", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"
                                    ),
                                    
                                    column(4,
                                           fluidRow(
                                             column(12,
                                                    wellPanel(
                                                      ICMP5,
                                                      RemoveZero5
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    TestedAgainst5
                                             )
                                           )
                                    ),
                                    
                                    ##############################################################################################################################
                                    ######################### OUTPUTS
                                    ##############################################################################################################################
                                    column(8,
                                           fluidRow(
                                             column(12,
                                                    PlotAge
                                             )
                                           )
                                    ),
                                    
                                    fluidRow(
                                      column(6,
                                             DataTableIndivAge
                                      ),
                                      column(6
                                      )
                                    )
                                    
                                  )
                                )
                              )
)
