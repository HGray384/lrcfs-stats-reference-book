tabDopingTest_probabilities = tabItem(tabName = "tabDopingTest_probabilities",
                        fluidRow(class="hideIfEmbedded",
                          box(title="Doping Test Example with Probabilities", width=12, collapsible = TRUE,
                              p("In this example we will explore the effectiveness of tests and how that affects drugs testing results."),
                              p("There are athletes who are doping in order to improve their performance. A test has been developed to try to detect whether an athlete is doping or not. The test can return positive or negative for doping, but there is always uncertainty about its results."),
                              p("The sensitivity of a test is the probability that it returns a positive test result when the athlete is truly doping. This a conditional probability, since it is conditional on the athlete doping."),
                              p("The specificity of a test is the probability that the test returns a negative result when the athlete is truly not doping. This is a probability that is conditioned on the athlete not doping."),
                              p("Change the sensitivity and specificity of the test using the slider below and see how that affects the number of mistakes the test makes for a population of 10,000 athletes.")
                          )
                        ),
                        fluidRow(class="hideIfEmbedded",
                                 box(title="Try it", width = 12, collapsible = TRUE, collapsed = TRUE,
                                     p("Below you can control the sensitivity and specificity of the doping test. You can see the effects of the changes in the tree diagram below."),
                                     p("Try the following activities, you can see the answers at the bottom of the page."),
                                     tags$div(
                                       tags$ol(
                                         tags$li("What is the number of incorrect negative test results when the sensitivity is 0.99? These are also known as false negatives."),
                                         tags$li("Decrease the sensitivity from 0.99 gradually. How does the number of false negatives change? Which side of the tree diagram is affected?"),
                                         tags$li("Set the specificity to 0.99 and decrease it gradually. How does the number of false positives change? Which side of the tree diagram is affected?"),
                                         tags$li("Use the above results to decide whether a high sensitivity alone is enough to control the number of false results the test makes.")
                                       )
                                     )
                                 )
                        ),
                        fluidRow(
                          box(title="Doping Test Properties", width=12,
                              p("In this box you can control the sensitivity and specificity of the test. You can see the effects of the changes that you make in the text description and tree diagram below."),
                              p("One way to understand the effects of the sensitivity or specificity is to change only one of the sliders at a time and see how that affects the results. For example, which side of the tree diagram does the sensitivity value affect? What does this mean for the number of true positive test results?"),
                              column(6,
                                sliderInput("doping_prob_Sensitivity", "Test Sensitivity", min=0.01, max = 0.99, step=0.01, value = 0.95),
                                div(class="infoBox", "A test sensitivity of 0.95 means that out of 100 doping athletes, 95 test positive.", status = "info")
                              ),
                              column(6,
                                sliderInput("doping_prob_Specificity", "Test Specificity", min=0.01, max = 0.99, step=0.01, value = 0.95),
                                div(class="infoBox", "A test specificity of 0.95 means that out of 100 non-doping athletes, 95 test negative.", status = "info")
                              )
                          )
                        ),
                        fluidRow(
                          infoBoxOutput("display_dopingTest_probabilities_infoBoxPopulation", width = 6),
                          infoBoxOutput("display_dopingTest_probabilities_infoBoxBaseRate", width = 6)
                        ),
                        fluidRow(
                          box(title = "Text description of results",
                              uiOutput("display_dopingTest_probabilities_treeInfo")
                          ),
                          box(title="Doping status and test results",
                              plotOutput("display_dopingTest_probabilities_tree")
                          )
                        ),
                        fluidRow(class="hideIfEmbedded",
                                 box(title="Try it: answers", width = 12, collapsible = TRUE, collapsed = TRUE,
                                     tags$div(
                                       tags$ol(
                                         tags$li("2. This can be seen by setting the sensitivity to the correct number and seeing the number of negative test results returned to athletes who are doping."),
                                         tags$li("The number of false negatives increases as the sensitivity decreases. This affects the left-hand side of the tree, which shows the doping athletes."),
                                         tags$li("The number of false positives increases as the specificity decreases. This affects the right-hand side of the tree, which shows the non-doping athletes."),
                                         tags$li("High sensitivity alone is not enough to control the number of false results, since it does not affect the number of false positives. Both a high sensitivity and a high specificity are required. The base rate also has an effect and this is shown in the Disease Test example.")
                                       )
                                     )
                                 )
                        )
)