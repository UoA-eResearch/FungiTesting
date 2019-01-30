


IndividualDataTab <- tabPanel("Individual Data",
                              
                              fluidPage(
                                h3("Select a Graph:"),
                                navlistPanel(
                                  widths = c(2, 10),
                                  
                                  "Growth Rate",
                                  
                                  tabPanel(
                                    title = div(
                                      img(src="growthrate.png", style = "width: -webkit-fill-available;"),
                                      #h4("Growth Rate", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center;"),
                                    
                                    
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
                                  
                                  "Percent Growth Size",
                                  
                                  tabPanel(
                                    title = div(
                                        img(src="percentsize.png", style = "width: -webkit-fill-available;"),
                                        #h4("Percent Growth Size", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center;"),
                                    
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
                                  
                                  "Media",
                                  
                                  tabPanel(
                                    title = div(
                                      img(src = "media.png", style = "width: -webkit-fill-available;"),
                                      #h4("Media", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center;"
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
                                  
                                  "Light",
                                  
                                  tabPanel(
                                    title = div(
                                      img(src = "light.png", style = "width: -webkit-fill-available;"),
                                      #h4("Light", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center;"
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
                                  
                                  "Age",
                                  
                                  tabPanel(
                                    title = div(
                                      img(src = "age.png", style = "width: -webkit-fill-available;"),
                                      #h4("Age", style = "padding: 0.5em;"),
                                      
                                      style = "display: flex; align-items: center;"
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
