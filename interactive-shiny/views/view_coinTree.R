tabCoinTree = tabItem(tabName = "tabCoinTree",
                      fluidRow(
                        box(title="Single Coin Toss - Probabilities", width=12,
                            p("In this example we use a coin toss to introduce the idea of probability. Probability here means a degree of belief in an event occurring."),
                            p("For a standard double-sided coin, the coin tosses can result in either heads or tails. The probability of getting a heads means the degree of belief that a heads will occur."),
                            p("The slider on the right-hand side below shows that the probability is a number between 0 and 1."),
                            p("This probability can be used to specify how many heads we expect for a certain number of coin tosses. "),
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
                        box(title="Probability Tree",
                            plotOutput("display_coinTree_prob")
                        ),
                        box(title="Expected Frequency Tree",
                            plotOutput("display_coinTree_freq")
                        )
                      )
                      
)