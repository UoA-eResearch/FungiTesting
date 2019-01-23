
#############################################################################################################################
############ SUMMARY DATA
#############################################################################################################################


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

Plot5 <- wellPanel(
              h4(tags$b(tags$p(class = "centered", "Age vs Zone of Inhibition"))),
              plotlyOutput("plot5")
            )

DataTableTesting <- wellPanel(
              h4(tags$b(tags$p(class = "centered", "Selected Data (FungiTesting.csv)"))),
              tableOutput("tableTesting")
            )

DataTableMeasure <- wellPanel(
                h4(tags$b(tags$p(class = "centered", "Selected Data (FungiMeasurements.csv)"))),
                tableOutput("tableMeasure")
              )


#############################################################################################################################
############ INDIVIDUAL DATA
#############################################################################################################################


PlotGrowthRate <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Growth Rate"))),
  plotlyOutput("plotGrowthRate")
)

DataTableIndivGrowth <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Selected Data (FungiMeasurements.csv)"))),
  tableOutput("tableIndivGrowth")
)

####################################################################################################

PlotPercentGrowth <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Percent Growth Size"))),
  plotlyOutput("plotPercentGrowth")
)

DataTableIndivPercentGrowth <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Selected Data (FungiMeasurements.csv)"))),
  tableOutput("tableIndivPercentGrowth")
)

####################################################################################################


PlotMedia <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Media"))),
  plotlyOutput("plotMedia")
)

DataTableIndivMedia <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Selected Data (FungiMeasurements.csv)"))),
  tableOutput("tableIndivMedia")
)

####################################################################################################

PlotLight <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Condition"))),
  plotlyOutput("plotLight")
)

DataTableIndivLight <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Selected Data (FungiMeasurements.csv)"))),
  tableOutput("tableIndivLight")
)

####################################################################################################

PlotAge <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Age"))),
  plotlyOutput("plotAge")
)

DataTableIndivAge <- wellPanel(
  h4(tags$b(tags$p(class = "centered", "Selected Data (FungiMeasurements.csv)"))),
  tableOutput("tableIndivAge")
)

