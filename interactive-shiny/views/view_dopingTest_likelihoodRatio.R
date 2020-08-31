tabDopingTest_likelihoodRatio = tabItem(tabName = "tabDopingTest_likelihoodRatio",
                        fluidRow(
                          box(title="Doping Testing Example with Likelihood Ratio", width=12,
                              p("In this example we will explore the effectiveness of tests and how that affects conditional probabilities."),
                              p("There are athletes who are doping in order to improve their performance. A test has been developed to try to detect whether the athletes is doping or not. The test can return positive or negative for doping, but there is always uncertainty about its results."),
                              p("The sensitivity of a test is the probability that it returns a positive test result when the athlete is truly doping."),
                              p("The specificity of a test is the probability that the test returns a negative result when the athlete is truly not doping."),
                              p("Change these properties of the test using the slider below and see how that affects the number of mistakes the test is expected to make.")
                          )
                        ),
                        fluidRow(
                          box(title="Doping Test Properties", width=12,
                              column(6,
                                sliderInput("doping_like_Sensitivity", "Test Sensitivity", min=0.01, max = 0.99, step=0.01, value = 0.95),
                                dashboardLabel("A test sensitivity of 0.95 means that out of 100 doping atheletes mean 95 would test positive.", status = "info")
                              ),
                              column(6,
                                sliderInput("doping_like_Specificity", "Test Specificity", min=0.01, max = 0.99, step=0.01, value = 0.95),
                                dashboardLabel("A test specificity of 0.95 means that out of 100 non-doping atheletes mean 95 would test negative.", status = "info")
                              )
                          )
                        ),
                        fluidRow(
                          box(title = "Information",
                              uiOutput("display_dopingTest_likelihoodratio_treeInfo")
                          ),
                          box(title="Expected doping and test results",
                              plotOutput("display_dopingTest_likelihoodratio_tree")
                          )
                        ),
                        fluidRow(
                          box(title="Prior Odds",
                              p("Something")
                          ),
                          box(title="Prior Odds Calculations",
                              uiOutput("display_dopingTest_likelihoodratio_priorOddsCalcs")
                          )
                        ),
                        fluidRow(
                          box(title="Likelihood Ratio",
                              uiOutput("display_dopingTest_likelihoodratio_likelihoodRatioInfo")
                          ),
                          box(title="Likelihood Ratio Calculations",
                              uiOutput("display_dopingTest_likelihoodratio_likelihoodRatioCalcs")
                          )
                        ),
                        fluidRow(
                          box(title="Posterior Odds",
                              uiOutput("display_dopingTest_likelihoodratio_posteriorOddsInfo")
                          ),
                          box(title="Posterior Odds Calculations", width=6,
                              uiOutput("display_dopingTest_likelihoodratio_posteriorOddsCalcs")
                          )
                        )
)