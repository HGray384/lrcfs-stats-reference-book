tabDopingTest_likelihoodRatio = tabItem(tabName = "tabDopingTest_likelihoodRatio",
                        fluidRow(class="hideIfEmbedded",
                          box(title="Doping Testing Example with Likelihood Ratio", width=12, collapsible = TRUE,
                              p("This example continues on from the previous doping test example. Athletes are doping and a test is used to try to detect them."),
                              p("In this example we will see how the base rate of doping and the sensitivity and specificity of the test affect the key components of Bayes' rule: the prior odds, the likelihood ratio, and the posterior odds."),
                              p("Bayes' rule is a rule of probability that determines how to update beliefs based upon learning new information. In this example, the belief is about whether an athlete is doping or not and the new information which updates that belief is the result of the doping test."),
                              p("The belief before learning the test result can be expressed as prior odds: the relative size of the probability that the athlete is doping compared to not doping."),
                              p("The belief after learning the test result can be expressed as posterior odds: the relative size of the probability that the athlete is doping compared to not doping conditional on the result of the test."),
                              p("The update factor which converts the prior odds to the posterior odds is controlled by the effectiveness of the test and is known as the likelihood ratio (LR). The LR compares the probabilities of obtaining the observed test result conditioned on the athlete doping versus the same probability conditioned on them not doping."),
                              p("Since the effectiveness of the test is determined by its sensitivity and specificity, this means that these test properties have an effect on both the LR and the posterior odds."),
                              p("Change the sensitivity and specificity of the test using the slider below and see how that affects the components of Bayes' rule in this population of 10,000 athletes. There is a text description to help explain the mathematical calculations.")
                          )
                        ),
                        fluidRow(class="hideIfEmbedded",
                          box(title="Try it", width=12, collapsible = TRUE, collapsed = TRUE,
                              p("Below you can control the sensitivity and specificity of the doping test. You can see the effects of the changes in the calculations below."),
                              p("Try the following activities, you can see the answers at the bottom of the page."),
                              tags$div(
                                tags$ol(
                                  tags$li("Read through the calculations and descriptions below for the prior odds. In this example, is doping rare or common?"),
                                  tags$li("Set both the sensitivity and specificity of the doping test to 0.9 and read through the calculations and description of the LR. What is the value of the LR? What does this value mean?"),
                                  tags$li("Keep the same sensitivity and specificity above and read through the calculations and description for the posterior odds. What is the value? What does this mean for a randomly selected athlete who tests positive?"),
                                  tags$li("What do the above two steps highlight about the interpretation of the LR?"),
                                  tags$li("See if you can find values for the sensitivity and specificity which result in posterior odds that are greater than 1. Why is this important?")
                                )
                              )
                          )
                        ),
                        fluidRow(
                          box(title="Doping Test Properties", width=12,
                              p("In this box you can control the sensitivity and specificity of the test. You can see the effects of the changes that you make in the text description and calculations below."),
                              column(6,
                                sliderInput("doping_like_Sensitivity", "Test Sensitivity", min=0.01, max = 0.99, step=0.01, value = 0.95),
                                div(class="infoBox", "A test sensitivity of 0.95 means that out of 100 doping athletes, 95 test positive.", status = "info")
                              ),
                              column(6,
                                sliderInput("doping_like_Specificity", "Test Specificity", min=0.01, max = 0.99, step=0.01, value = 0.95),
                                div(class="infoBox", "A test specificity of 0.95 means that out of 100 non-doping athletes, 95 test negative.", status = "info")
                              )
                          )
                        ),
                        fluidRow(
                          infoBoxOutput("display_dopingTest_likelihoodratio_infoBoxPopulation", width = 6),
                          infoBoxOutput("display_dopingTest_likelihoodratio_infoBoxBaseRate", width = 6)
                        ),
                        # fluidRow(
                        #   box(title = "Information",
                        #       uiOutput("display_dopingTest_likelihoodratio_treeInfo")
                        #   ),
                        #   box(title="Expected doping and test results",
                        #       plotOutput("display_dopingTest_likelihoodratio_tree")
                        #   )
                        # ),
                        fluidRow(
                          box(title="Prior Odds",
                              p("The box opposite contains the calculations for the prior odds in this doping example. The probability that any randomly selected athlete is doping is determined by the base rate, 0.02. Since athletes are either doping or not doping and cannot be doing both then these probabilities are exhaustive and mutually exclusive and so must sum to 1. This makes the probability that a randomly selected athlete is not doping equal to 0.98."),
                              p("The prior odds compares the size of these two probabilities, giving odds of roughly 0.02. This can be interpreted as any randomly selected athlete is 0.02 times as likely to be doping as not doping. In other words, they are far less likely to be doping and much more likely to not be doping when randomly selected.")
                          ),
                          box(title="Prior Odds Calculation",
                              uiOutput("display_dopingTest_likelihoodratio_priorOddsCalcs")
                          )
                        ),
                        fluidRow(
                          box(title="Likelihood Ratio",
                              uiOutput("display_dopingTest_likelihoodratio_likelihoodRatioInfo")
                          ),
                          box(title="Likelihood Ratio Calculation",
                              uiOutput("display_dopingTest_likelihoodratio_likelihoodRatioCalcs")
                          )
                        ),
                        fluidRow(
                          box(title="Posterior Odds",
                              uiOutput("display_dopingTest_likelihoodratio_posteriorOddsInfo")
                          ),
                          box(title="Posterior Odds Calculation", width=6,
                              uiOutput("display_dopingTest_likelihoodratio_posteriorOddsCalcs")
                          )
                        ),
                        fluidRow(class="hideIfEmbedded",
                          box(title="Try it: answers", width=12, collapsible = TRUE, collapsed = TRUE,
                              tags$div(
                                tags$ol(
                                  tags$li("The base rate is 0.02, implying prior odds of 0.0204. This means that a randomly selected athlete is 0.0204 times as probable to be doping compared to not doping. This means that doping is rare."),
                                  tags$li("The LR is 9. This means that a positive test is 9 times as probable when an athlete is doping compared to when they are not doping."),
                                  tags$li("The posterior odds are 0.1837. This means that a randomly selected athlete who tests positive is 0.1837 times as likely to be doping compared to not be doping. Since this number is less than 1, the athlete is more likely to not be doping."),
                                  tags$li("In the steps above, an LR above 1 still resulted in posterior odds less than 1 (due to doping being rare). This shows that LRs needs to be carefully considered and not mistakenly confused with posterior odds."),
                                  tags$li("Posterior odds greater than 1 are important because this is the value at which an athlete who tests positive is more likely to be doping than not doping.")
                                )
                              )
                          )
                        )
)