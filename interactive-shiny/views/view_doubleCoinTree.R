tabDoubleCoinTree = tabItem(tabName = "tabDoubleCoinTree",
                            fluidRow(
                              box(title="Double Coin Toss - Probabilities", width=12,
                                  p("Blah")
                              )
                            ),
                            fluidRow(
                              box(title="Inputs", width=12,
                                  column(width=6,
                                         sliderInput("doubleCoinTree_coinTosses", "Number of Coin Tosses", min=4, max=500, step=4, value = 200),
                                  ),
                                  column(width=6,
                                         sliderInput("doubleCoinTree_headsProbability", "Probability of Heads", min=0, max=1, step=0.1, value = 0.5),
                                  )
                              )
                            ),
                            fluidRow(
                              box(title = "Probability Tree", width=6,
                                  plotOutput("display_doubleCoinTree_tree_prob")
                              ),
                              box(title = "Expected Frequency Tree", width=6, 
                                  plotOutput("display_doubleCoinTree_tree_freq")
                              )
                            )
)