source('Reactive.R', local = TRUE)

ICMP <- selectizeInput("ICMP", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
               options = list( placeholder = 'Default (Showing All)' ))


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


TestedAgainst <- selectizeInput("TestedAgainst", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE,
                       options = list( placeholder = 'Default (Showing All)' ))


Media <- wellPanel( selectInput("Media", h4(tags$b("Media")), choices = c("All", as.character(datTest$Media)), selected = "All"))


SizePercent <- wellPanel(
                  radioButtons("sizePercent", h4(tags$b("Size")),
                     choices = list( "All" = "All", "20 %" = 20, "50 %" = 50, "100%" = 100),
                     selected = "All", 
                     inline = TRUE)
                )


#############################################################################################################################
############# Other
#############################################################################################################################



ICMPOther <- selectizeInput("ICMPOther", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)' ))


RemoveZeroOther <- checkboxInput("RemoveZeroOther","Remove 0 Values", FALSE)


ConditionOther <- wellPanel( h4(tags$b("ConditionOther")),
                        fluidRow(
                          column(5,
                                 checkboxInput("LOther","Light", TRUE)
                          ),
                          column(7,
                                 checkboxInput("DOther","Dark", FALSE)
                          )
                        )
)


TestedAgainstOther <- selectizeInput("TestedAgainstOther", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE,
                                options = list( placeholder = 'Default (Showing All)' ))


MediaOther <- wellPanel( selectInput("MediaOther", h4(tags$b("Media")), choices = c("All", as.character(datTest$Media)), selected = "All"))


SizePercentOther <- wellPanel(
  radioButtons("sizePercentOther", h4(tags$b("Size")),
               choices = list( "All" = "All", "20 %" = 20, "50 %" = 50, "100%" = 100),
               selected = "All", 
               inline = TRUE)
)


#############################################################################################################################
############# 1
#############################################################################################################################


ICMP1 <- selectizeInput("ICMP1", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)' ))

RemoveZero1 <- checkboxInput("RemoveZero1","Remove 0 Values", FALSE)

Condition1 <- wellPanel(h4(tags$b("Condition")),
                        fluidRow(
                          column(5,
                                 checkboxInput("L1","Light", TRUE)
                          ),
                          column(7,
                                 checkboxInput("D1","Dark", TRUE)
                          )
                        )
)

Media1 <- wellPanel( selectInput("Media1", h4(tags$b("Media")), choices = c("All", as.character(datTest$Media)), selected = "All"))

ColourBy <- radioButtons("colourBy", h4(tags$b("Colour by:")),
               choices = list("Condition" = "Condition", "Media" = "Media"),
               selected = "Condition", 
               inline = TRUE)


#############################################################################################################################
############# 2
#############################################################################################################################


ICMP2 <- selectizeInput("ICMP2", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)' ))

RemoveZero2 <- checkboxInput("RemoveZero2","Remove 0 Values", TRUE)

Condition2 <- wellPanel( h4(tags$b("Condition")),
                        fluidRow(
                          column(5,
                                 checkboxInput("L2","Light", TRUE)
                          ),
                          column(7,
                                 checkboxInput("D2","Dark", FALSE)
                          )
                        )
)

TestedAgainst2 <- selectizeInput("TestedAgainst2", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE,
                                     options = list( placeholder = 'Default (Showing All)' ))


Media2 <- wellPanel( selectInput("Media2", h4(tags$b("Media")), choices = c("All", as.character(datTest$Media)), selected = "All"))


SizePercent2 <- wellPanel(
  radioButtons("sizePercent2", h4(tags$b("Size")),
               choices = list( "All" = "All", "20 %" = 20, "50 %" = 50, "100%" = 100),
               selected = "All", 
               inline = TRUE)
)






#############################################################################################################################
############# 3
#############################################################################################################################


ICMP3 <- selectizeInput("ICMP3", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)' ))

RemoveZero3 <- checkboxInput("RemoveZero3","Remove 0 Values", FALSE)

Condition3 <- wellPanel( h4(tags$b("Condition")),
                        fluidRow(
                          column(5,
                                 checkboxInput("L3","Light", TRUE)
                          ),
                          column(7,
                                 checkboxInput("D3","Dark", TRUE)
                          )
                        )
)

TestedAgainst3 <- selectizeInput("TestedAgainst3", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE,
                                 options = list( placeholder = 'Default (Showing All)' ))


Media3 <- wellPanel( selectInput("Media3", h4(tags$b("Media")), choices = c("All", as.character(datTest$Media)), selected = "All"))



#############################################################################################################################
############# 4
#############################################################################################################################


ICMP4 <- selectizeInput("ICMP4", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)' ))

RemoveZero4 <- checkboxInput("RemoveZero4","Remove 0 Values", FALSE)


TestedAgainst4 <- selectizeInput("TestedAgainst4", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE,
                                 options = list( placeholder = 'Default (Showing All)' ))

#############################################################################################################################
############# 5
#############################################################################################################################


ICMP5 <- selectizeInput("ICMP5", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)' ))

RemoveZero5 <- checkboxInput("RemoveZero5","Remove 0 Values", FALSE)


TestedAgainst5 <- selectizeInput("TestedAgainst5", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE,
                                 options = list( placeholder = 'Default (Showing All)' ))

