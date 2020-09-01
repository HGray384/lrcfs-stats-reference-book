tabCoinTree = tabItem(tabName = "tabCoinTree",
                      fluidRow(
                        box(title="Single Coin Toss - Probabilites", width=12,
                            p("Blah")
                        )
                      ),
                      fluidRow(
                        box(title="Inputs", width=12,
                            column(width=6,
                                   sliderInput("coinTree_numberOfTosses", "Number of Coin Tosses:", 1, 500, 50)
                            ),
                            column(width=6,
                                   sliderInput("coinTree_expectedPorbability", "Probability Of Heads:", 0, 1, 0.5)
                            )
                        )
                      ),
                      fluidRow(
                        box(title="Probabilty Tree",
                            plotOutput("display_coinTree_prob")
                        ),
                        box(title="Expected Frequency Tree",
                            plotOutput("display_coinTree_freq")
                        )
                      )
                      
)