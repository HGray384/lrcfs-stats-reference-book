tabCoinToss = tabItem(tabName = "tabCoinToss",
                      fluidRow(class="hideIfEmbedded",
                              box(title="Single Coin Toss - Samples", width=12, collapsible = TRUE,
                                  p("In this example we consider both the expected outcomes of the coin toss as well as actual outcomes of the tosses."),
                                  p("When we assign a probability of a coin toss resulting in a head, we have an expectation for the number of heads that will be acheived for a certain number of tosses. However, this number of heads is not guaranteed to occur when the coin is actually tossed."),
                                  p("When the coin is tossed a number of times and the results are recorded then this is known as a sample."),
                                  p("Use the sliders below to change the number of tosses and the probability of heads for the coin to generate a sample of tosses and view the results in the graphs below."),
                                  p("The outcomes for the sample have been added to a new tree diagram which represents the sample number (also known as the sample frequency) of heads and tails.")
                              )
                      ),
                      fluidRow(class="hideIfEmbedded",
                               box(title = "Try it", width=12, collapsible = TRUE, collapsed = TRUE,
                                   p("Try the following activities, you can see the answers at the bottom of the page."),
                                   tags$div(
                                     tags$ol(
                                       tags$li("Set the number of tosses to around 50 and the probability of heads to be 0.5. Compare the expected number of heads/tails to the sample number of heads/tails. Why are these numbers different?"),
                                       tags$li("Now set the number of tosses to 500. Look at the graph which shows the sample proportion of heads/tails with each toss. Can you tell how the sample proportion of heads is calculated?"),
                                       tags$li("Look at the graph which shows the sample proportion of heads/tails with each toss again. What happens to the lines on the graph between 1-100 tosses compared to the lines on the graph between 400-500 tosses?"),
                                       tags$li("Repeat activity 2 above for a probability of heads of 0.8. Can you tell why you view this behaviour for the lines between tosses 0-100 compared to tosses 400-500?"),
                                       )
                                   )  
                               )
                      ),
                      fluidRow(
                              box(title="Number of tosses and probability of heads", width=12,
                                  column(6,
                                         sliderInput("coinToss_numberOfTosses", "Number of Coin Tosses:", 1, 500, 500),
                                         
                                  ),
                                  column(6,
                                         sliderInput("coinToss_headsProbabilty", "Probability of Heads:", 0, 1, 0.5, step=0.1)
                                  )
                              )
                      ),
                      fluidRow(
                              box(title="Probability Tree", width=4,
                                  p("This tree displays the probability for each outcome."),
                                  plotOutput("display_coinToss_treeProb")
                              ),
                              box(title="Expected Frequency Tree", width=4,
                                  p("This tree displays the expected frequency of each outcome for a certain number of tosses."),
                                  plotOutput("display_coinToss_treeExp")
                              ),
                              box(title="Sample Frequency Tree", width=4,
                                  p("This tree displays the sample frequency of each outcome for a certain number of tosses."),
                                  plotOutput("display_coinToss_treeSample")
                              )
                      ),
                      fluidRow(
                              box(title="Coin Tosses", width=12,
                                  p("This plot shows the outcomes of each coin toss in the order in which they occurred."),
                                  uiOutput("display_coinToss_tossResultsWaffle")
                              )
                      ),
                      fluidRow(
                              box(title="Sample proportion of heads/tails with each coin toss", width=12,
                                  p("This plot shows the sample proportion of heads/tails and how it changed as the coin was being tossed."),
                                  plotlyOutput("display_coinToss_plotlyGraph")
                              )
                      ),
                      fluidRow(
                              box(title="Total Number of Heads/Tails", width=6,
                                  p("This plot shows the total number of heads and tails in the sample."),
                                  plotOutput("display_coinToss_tossResultsPie")
                              ),
                              box(title="Distribution of the sample proportion of Heads", width=6,
                                  p("Use the buttons below to re-run the sample of coin tosses. This plot displays the sample proportion of heads for each sample together in what is known as a box plot."),
                                  p("The line through the centre of the box shows the median proportion of heads for the samples. This is the value for which half of the samples had a higher sample proportion of heads, and half of the samples had a lower sample proportion of heads."),
                                  p("The size of the box shows the central 50% of sample proportions for the samples - one quarter of the sample values are above the box, and one quarter are below the box."),
                                  p("Any dots outside of the box are known as outliers - values which are extreme compared to the other sample proportions that were observed."),
                                  p("The lines between the boxes and the outliers are known as whiskers and they show the range of values that are not considered to be outliers."),
                                  plotOutput("display_coinToss_overalWhisker"),
                                  actionButton("coinToss_rerunCoinToss", "Re-run Coin Toss"),
                                  actionButton("coinToss_resetTotals", "Reset Totals")
                                  
                              )
                      ),
                      fluidRow(class="hideIfEmbedded",
                               box(title = "Try it: answers", width=12, collapsible = TRUE, collapsed = TRUE,
                                   tags$div(
                                     tags$ol(
                                       tags$li("These numbers are different because the expectations from a theoretical probability model cannot determine precise outcomes from the real-world process that they attempt to model (in this case, coin toss outcomes)."),
                                       tags$li("The sample proportion of heads is calculated by dividing the sample number of heads by the total number of tosses."),
                                       tags$li("The lines between 0-100 tosses vary greatly, whilst the lines from 400-500 tosses are more stable."),
                                       tags$li("This behaviour occurs because for smaller sample sizes, the sample proportion of heads can be greatly affected by small random sequences of many heads or many tails (and you can see how many of these sequences occur in the Coin Tosses visualisation graph). Over many samples, the sample proportion of heads is less affected by small sequences of many heads or many tails. As a result, for larger sample sizes the sample proportion of heads is more stable and gets closer to the probability of heads."),
                                     )
                                   )  
                               )
                      )
)