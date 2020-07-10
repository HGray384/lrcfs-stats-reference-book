tabCoinTree = tabItem(tabName = "tabCoinTree",
                      fluidRow(
                        column(4,
                               sliderInput("coinTree_numberOfTosses", "Number of Coin Tosses:", 1, 500, 50),
                               sliderInput("coinTree_expectedPorbability", "Expected Probability Of Heads:", 0, 1, 0.5)
                        ),
                        column(4,
                               plotOutput("display_coinTree_tree")
                        )
                      )
)