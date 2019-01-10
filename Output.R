
Plot1 <- wellPanel(
              h4(tags$b(tags$p(class = "centered", "ICMP and Zone of Inhibition Size"))),
              plotlyOutput("plot1")
            )

Plot2 <- wellPanel(
              h4(tags$b(tags$p(class = "centered", "Media Affect on Zone of Inhibition Size"))),
              plotlyOutput("plot2")
            )

Plot3 <- wellPanel(
              h4(tags$b(tags$p(class = "centered", "Size vs Zone of Inhibition"))),
              plotlyOutput("plot3")
            )

Plot4 <- wellPanel(
              h4(tags$b(tags$p(class = "centered", "Light vs Zone of Inhibition"))),
              plotlyOutput("plot4")
            )

DataTable <- wellPanel(
                h4(tags$b(tags$p(class = "centered", "Selected Data (FungiTesting.csv)"))),
                tableOutput("tab")
              )

