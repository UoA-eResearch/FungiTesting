


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
                                                    ICMP
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
                                                    Media
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
                                    column(6
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
                                                    Media
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    TestedAgainst
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
                                    column(8,
                                           fluidRow(
                                             column(12,
                                                    PlotPercentGrowth
                                             )
                                           )
                                    ),
                                    
                                    fluidRow(
                                      column(6
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
                                                    Media
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    TestedAgainst
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
                                      column(6
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
                                                      ICMP,
                                                      RemoveZero
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    TestedAgainst
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
                                      column(6
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
                                                      ICMP,
                                                      RemoveZero
                                                    )
                                             )
                                           ),
                                           fluidRow(
                                             column(12,
                                                    TestedAgainst
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
                                      column(6
                                      ),
                                      column(6
                                      )
                                    )
                                    
                                  )
                                )
                              )
)
