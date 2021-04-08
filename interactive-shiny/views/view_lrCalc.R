tabLRCalc = tabItem(tabName = "tabLRCalc",
                    fluidRow(class="hideIfEmbedded",
                             box(title="Likelihood Ratio (LR) in forensic science", width=12,
                                 p("In this example we demonstrate how the LR is calculated based upon its underlying conditional probabilities."),
                                 p("In forensic science, the LR is a quantitative tool to determine the value of a piece of evidence in discriminating between the prosecution's and defence's version of events."),
                                 p("The LR applied to forensic science depends upon three key elements: "),
                                 withMathJax(),
                                 tags$div(
                                   tags$ul(
                                     tags$li("\\(E\\): evidence,"),
                                     tags$li("\\(H_p\\): prosecution hypothesis for the evidence,"),
                                     tags$li("\\(H_d\\): defence hypothesis for the evidence. ")
                                   )
                                 ),
                                 p("The LR compares the magnitude of the probability of \\(E\\) conditioned on \\(H_p\\) with the probability of \\(E\\) conditioned on \\(H_d\\)."),
                                 p("If the probability of \\(E\\) conditioned on \\(H_p\\) is two times as large as the probability of \\(E\\) conditioned on \\(H_d\\), say 0.5 compared to 0.25, then the LR is 2."),
                                 p("If the probability of \\(E\\) conditioned on \\(H_p\\) is only one quarter the size of the probability of \\(E\\) conditioned on \\(H_d\\), say 0.1 compared to 0.4, then the LR is 0.25."),
                                 p("The LR determines how much more likely the recovered evidence was assuming the prosecution hypothesis to be true compared to when the defence hypothesis is true."),
                                 p("Fix each of the conditional probabilities in the calculator below to see the resulting LR.")
                             )
                    ),
                    fluidRow(
                      box(title="LR calculator", width=12,
                          p("Please fix the conditional probabilities to be between 0 and 1. You can also see the mathematical expression for computing the LR."),
                          column(width=6,
                                 numericInput("lrCalc_probHp", "Probability of \\(E\\) conditioned on \\(H_p\\)", min=0, max=1,
                                             value=0.1, step=0.01)
                          ),
                          column(width=6,
                                 numericInput("lrCalc_probHd", "Probability of \\(E\\) conditioned on \\(H_d\\)", min=0, max=1,
                                             value=0.0001, step=0.01)
                          ),
                          column(width=12, align="center",
                                 uiOutput("display_lrCalc_likelihoodRatioCalcs")
                          )
                      )
                      
                    )
)
