source('Reactive.R', local = TRUE)

ICMP <- selectizeInput("ICMP", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
               options = list( placeholder = 'Default (Showing All)' ))



ControlAge <- checkboxInput("ControlAge","Control for Age", FALSE)



RemoveZero <- checkboxInput("RemoveZero","Remove 0 Values", FALSE)


Condition <- wellPanel( h4(tags$b("Condition")),
                fluidRow(
                  column(5,
                         checkboxInput("L","Light", TRUE)
                  ),
                  column(7,
                         checkboxInput("D","Dark", FALSE)
                  )
                )
              )



TestedAgainst <- wellPanel( h4(tags$b("Tested Against")),
                    fluidRow(
                      column(5,
                             checkboxInput("EC","E. Coli", TRUE)
                      ),
                      column(7,
                             checkboxInput("KP","K. Pneumoniae", TRUE)
                      )
                    )
                  )



Media <- wellPanel( selectInput("Media", h4(tags$b("Media")), choices = c("All", as.character(datTest$Media)), selected = "All"))


SizePercent <- wellPanel(
                  radioButtons("sizePercent", h4(tags$b("Size")),
                     choices = list("20 %" = 20, "50 %" = 50, "100%" = 100),
                     selected = 1, 
                     inline = TRUE)
                )















