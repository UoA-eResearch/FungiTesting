


IndividualDataTab <- tabPanel("Individual Data",
                              
                              fluidPage(
                                h3("Select a Graph:"),
                                navlistPanel(
                                  widths = c(3, 9),
                                  "Growth Data",
                                  tabPanel(
                                    title = div(
                                      img(src="growthrate.png", style = "height: inherit; padding: 1em;"),
                                      h4("Growth Rate", style = "padding: 1em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;")
                                  ),
                                  
                                  "Zone of Inhibition Data",
                                  
                                  tabPanel(
                                    title = div(
                                        img(src="percentsize.png", style = "height: inherit; padding: 1em;"),
                                        h4("Percent Growth Size", style = "padding: 1em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;")),
                                  
                                  tabPanel(
                                    title = div(
                                      img(src = "media.png", style = "height: inherit; padding: 1em;"),
                                      h4("Media", style = "padding: 1em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"
                                    )
                                  ),
                                  
                                  tabPanel(
                                    title = div(
                                      img(src = "light.png", style = "height: inherit; padding: 1em;"),
                                      h4("Light", style = "padding: 1em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"
                                    )
                                  ),
                                  
                                  tabPanel(
                                    title = div(
                                      img(src = "age.png", style = "height: inherit; padding: 1em;"),
                                      h4("Age", style = "padding: 1em;"),
                                      
                                      style = "display: flex; align-items: center; height: 8em;"
                                    )
                                  )
                                )
                              ))
