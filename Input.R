source('Reactive.R', local = TRUE)
source('customServer.R', local = TRUE)

TT <- popover(title = "?", content = "This could be any help text or information.", class ="btn btn-info", trigger = "hover")

ColorPalette <- radioButtons("colorPalette", h5(tags$b("Colour Palette")),
                            choices = list( "High Contrast" = "Dark2", "Shara's Palette" = "Sharas"),
                            selected = "Dark2", 
                            inline = TRUE)

ToggleData <- radioButtons("toggleData", h4(tags$b("Choose Dataset")),
                           choices = list( "Zone of Inhibition" = "Zone of Inhibition", "Bioluminescence" = "Bioluminescence"),
                           selected = "Zone of Inhibition",
                           inline = TRUE)

ICMP <- selectizeInput("ICMP", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE,
               options = list( placeholder = 'Default (Showing All)'))

ICMPAlex <- selectizeInput("ICMPAlex", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)'))

Researcher <- selectizeInput("Researcher", choices = sort(unique(data_combined$Researcher)), h5(tags$b("Researcher")), multiple = TRUE)

Phylum <- selectizeInput("Phylum", choices = NULL, h5(tags$b("Phylum")), multiple = TRUE)

RemoveZero <- checkboxInput("RemoveZero","Remove 6mm Values", FALSE)

ZeroToOne <- checkboxInput("ZeroToOne","Exchange 0 Values for 1", FALSE)

Condition <- fluidRow(column(5,
                             checkboxInput("L","Light", TRUE)
                      ),
                      column(7,
                             checkboxInput("D","Dark", FALSE)
                      )
              )

TestedAgainst <- selectizeInput("TestedAgainst", choices = NULL, h5(tags$b("Tested Against")), multiple = TRUE)

TestedAgainstAlex <- selectizeInput("TestedAgainstAlex", choices = NULL, h5(tags$b("Tested Against")), multiple = TRUE)

Media <- selectizeInput("Media", h5(tags$b("Media")), choices = NULL, multiple = TRUE)

MediaAlex <- selectizeInput("MediaAlex", h5(tags$b("Media")), choices = NULL, multiple = TRUE)

TimePoint <- selectizeInput("TimePoint", choices = NULL, h5(tags$b("Time Point")), multiple = TRUE)

SizePercent <- radioButtons("sizePercent", h5(tags$b("Size")),
                            choices = list( "All" = "All", "20 %" = 20, "50 %" = 50, "100%" = 100),
                            selected = "All", 
                            inline = TRUE)

StrainShara <- selectizeInput("StrainShara", choices = NULL, h5(tags$b("Strain")), multiple = TRUE) #uiOutput("uiStrain")

StrainAlex <- selectizeInput("StrainAlex", choices = NULL, h5(tags$b("Strain")), multiple = TRUE, 
                           options = list( placeholder = 'Default (Showing All)' ))

#############################################################################################################################
############# Other
#############################################################################################################################



ICMPOther <- selectizeInput("ICMPOther", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE,
                       options = list( placeholder = 'Default (Showing All)' ))


RemoveZeroOther <- checkboxInput("RemoveZeroOther","Remove 6mm Values", FALSE)

ZeroToOneOther <- checkboxInput("ZeroToOneOther","Exchange 0 Values for 1", FALSE)

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


TestedAgainstOther <- selectizeInput("TestedAgainstOther", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE)


MediaOther <- selectizeInput("MediaOther", h4(tags$b("Media")), choices = NULL, multiple = TRUE)


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

RemoveZero1 <- checkboxInput("RemoveZero1","Remove 6mm Values", FALSE)

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

Media1 <- selectizeInput("Media1", h4(tags$b("Media")), choices = NULL, multiple = TRUE)

ColourBy <- radioButtons("colourBy", h4(tags$b("Colour by:")),
               choices = list("Condition" = "Condition", "Media" = "Media"),
               selected = "Condition", 
               inline = TRUE)


#############################################################################################################################
############# 2
#############################################################################################################################


ICMP2 <- selectizeInput("ICMP2", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)' ))

RemoveZero2 <- checkboxInput("RemoveZero2","Remove 6mm Values", TRUE)

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

TestedAgainst2 <- selectizeInput("TestedAgainst2", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE)


Media2 <- selectizeInput("Media2", h4(tags$b("Media")), choices = NULL, multiple = TRUE)


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

RemoveZero3 <- checkboxInput("RemoveZero3","Remove 6mm Values", FALSE)

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

TestedAgainst3 <- selectizeInput("TestedAgainst3", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE)


Media3 <- selectizeInput("Media3", h4(tags$b("Media")), choices = NULL, multiple = TRUE)



#############################################################################################################################
############# 4
#############################################################################################################################


ICMP4 <- selectizeInput("ICMP4", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)' ))

RemoveZero4 <- checkboxInput("RemoveZero4","Remove 6mm Values", FALSE)


TestedAgainst4 <- selectizeInput("TestedAgainst4", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE)

#############################################################################################################################
############# 5
#############################################################################################################################


ICMP5 <- selectizeInput("ICMP5", choices = NULL, h4(tags$b("ICMP")), multiple = TRUE, 
                       options = list( placeholder = 'Default (Showing All)' ))

RemoveZero5 <- checkboxInput("RemoveZero5","Remove 6mm Values", FALSE)


TestedAgainst5 <- selectizeInput("TestedAgainst5", choices = NULL, h4(tags$b("Tested Against")), multiple = TRUE,
                                 options = list( placeholder = 'Default (Showing All)' ))

Media5 <- selectizeInput("Media5", h4(tags$b("Media")), choices = NULL, multiple = TRUE)


