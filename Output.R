
Plot1 <- wellPanel(
              h4(tags$b(tags$p(class = "centered", "Correlation of Fungi Size and Age"))),
              plotlyOutput("plot1")
            )

Plot3 <- wellPanel(
              h4(tags$b(tags$p(class = "centered", "Growth Rate Depending on Media and Condition Selected"))),
              plotlyOutput("plot3")
            )


DataTable <- wellPanel(
                h4(tags$b(tags$p(class = "centered", "Selected Data (FungiTesting.csv)"))),
                tableOutput("tab")
              )

Plot2 <- wellPanel(
                h4(tags$b(tags$p(class = "centered", "Average Zones Produced by Media"))),
                plotlyOutput("plot2")
              )