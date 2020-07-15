tabLikelyhood = tabItem(tabName = "tabLikelyhood",
                      fluidRow(
                        box(title="Inputs",
                            sliderInput("likelyhood_1", "poitns:", 1, 150, 101),
                            sliderInput("likelyhood_2", "bottom:", 0, 1, 0, step = 0.01),
                            sliderInput("likelyhood_3", "top:", 0, 1, 1, step = 0.01),
                            sliderInput("likelyhood_4", "by:", 0, 0.2, 0.010, step = 0.001)
                        ),
                        box(title="Outputs",
                            plotlyOutput("display_likelyhood_graph")
                        )
                      )
                      
)