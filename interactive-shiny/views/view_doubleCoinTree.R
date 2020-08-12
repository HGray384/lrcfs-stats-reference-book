tabDoubleCoinTree = tabItem(tabName = "tabDoubleCoinTree",
                            fluidRow(
                                  box(width=6,
                                    sliderInput("doubleCoinTree_coinTosses", h3("Number of Coin Tosses"), min=4, max=500, step=4, value = 200),
                                    sliderInput("doubleCoinTree_headsProbability", h3("Probability of Heads"), min=0, max=1, step=0.1, value = 0.5),
                                  ),
                                  box(width=6,
                                    plotOutput("display_doubleCoinTree_tree")
                                  )
                            )
)