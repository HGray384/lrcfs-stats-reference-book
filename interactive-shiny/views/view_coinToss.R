tabCoinToss = tabItem(tabName = "tabCoinToss",
                      fluidRow(
                              box(title="Single Coin Toss - Samples", width=12,
                                  p("In this example we consider both the expected outcomes of the coin toss as well as actual outcomes of the tosses."),
                                  p("When we assign a probability of a coin toss resulting in a head, we have an expectation for the number of heads that will be acheived for a certain number of tosses. However, this number of heads is not guaranteed to occur when the coin is actually tossed."),
                                  p("When the coin is tossed a number of times and the results are recorded then this is known as a sample."),
                                  p("Use the sliders below to change the number of tosses and the probability of heads for the coin to generate a sample of tosses and view the results in the graphs below."),
                                  p("The outcomes for the sample have been added to a new tree diagram which represents the sample number of heads and tails (also known as the sample frequency).")
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
                                  plotOutput("display_coinToss_treeProb")
                              ),
                              box(title="Expected Frequency Tree", width=4,
                                  plotOutput("display_coinToss_treeExp")
                              ),
                              box(title="Sample Frequency Tree", width=4,
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
                      )
)