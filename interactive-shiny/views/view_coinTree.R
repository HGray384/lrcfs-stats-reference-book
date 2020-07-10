tabCoinTree = tabItem(tabName = "tabCoinTree",
                      fluidRow(
                        
                        box(title="Inputs",
                            sliderInput("coinTree_numberOfTosses", "Number of Coin Tosses:", 1, 500, 50),
                            sliderInput("coinTree_expectedPorbability", "Expected Probability Of Heads:", 0, 1, 0.5)
                        ),
                        box(title="Outputs",
                            plotOutput("display_coinTree_tree")
                        )
                      )
                      
)