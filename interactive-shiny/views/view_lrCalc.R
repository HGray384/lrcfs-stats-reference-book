tabLRCalc = tabItem(tabName = "tabLRCalc",
                    fluidRow(class="hideIfEmbedded",
                             box(title="LR calculator", width=12,
                                 p("In this example we demonstrate how the LR is calculated based upon its underlying conditional probabilities."),
                                 p("The LR depends upon three key elements: "),
                                 tags$div(
                                   tags$ul(
                                     tags$li("E: evidence,"),
                                     tags$li("H_p: prosecution hypothesis for the evidence,"),
                                     tags$li("H_d: defence hypothesis for the evidence. ")
                                   )
                                 )
                             )
                    ),
                    fluidRow(
                      box(title="Conditional probabilities", width=12,
                          column(width=6,
                                 sliderInput("lrCalc_probHp", "Probability for E conditioned on H_p", min=0, max=1,
                                             value=0.1, step=0.01)
                          ),
                          column(width=6,
                                 sliderInput("lrCalc_probHd", "Probability for E conditioned on H_d", min=0, max=1,
                                             value=0.1, step=0.01)
                          ),
                          column(width=12,
                                 uiOutput("display_lrCalc_likelihoodRatioCalcs")
                          )
                      )
                      
                    )
)
