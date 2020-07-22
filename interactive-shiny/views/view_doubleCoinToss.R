tabDoubleCoinToss = tabItem(tabName = "tabDoubleCoinToss",
                            fluidRow(
                                  box(width=12,
                                      column(width=6,
                                        sliderInput("doubleCoinToss_coinTosses", h3("Number of Coin Tosses"), min=4, max=500, step=4, value = 200),
                                      ),
                                      column(width=6,
                                        sliderInput("doubleCoinToss_headsProbability", h3("Probabilty of Heads"), min=0, max=1, step=0.1, value = 0.5),
                                      )
                                      
                                      
                                  ),
                                  
                            ),
                            fluidRow(
                              box(title=h3(HTML(paste0("First Toss Results (of ",uiOutput("display_doubelCoinToss_totalNumTosses", inline=TRUE)," tosses)"))), width=12,
                                  fluidRow(
                                    column(width=12,
                                           uiOutput("display_doubelCoinToss_firstToss")
                                    )
                                  ),
                                  fluidRow(
                                    column(width=6,
                                           h4("Number of Heads Thrown From First Toss"),
                                           uiOutput("display_doubelCoinToss_firstTossHeads"),
                                           h3("Second Toss of Coins that were Heads"),
                                           fluidRow(
                                             column(width=12,
                                                    uiOutput("display_doubelCoinToss_secondTossHeads")
                                             )
                                           ),
                                           fluidRow(
                                             column(width=6,
                                                    h4("Number of Heads Thrown on second toss"),
                                                    uiOutput("display_doubelCoinToss_secondTossHeads_headsResults")
                                             ),
                                             column(width=6,
                                                    h4("Number of Tails Thrown on second toss"),
                                                    uiOutput("display_doubelCoinToss_secondTossHeads_tailsResults")
                                             )
                                           )
                                    ),
                                    column(width=6,
                                           h4("Number of Tails Thrown From First Toss"),
                                           uiOutput("display_doubelCoinToss_firstTossTails"),
                                           h3("Second Toss of Coins that were Tails"),
                                           fluidRow(
                                             column(width=12,
                                                    uiOutput("display_doubelCoinToss_secondTossTails")
                                             )
                                           ),
                                           fluidRow(
                                             column(width=6,
                                                    h4("Number of Heads Thrown on second toss"),
                                                    uiOutput("display_doubelCoinToss_secondTossTails_headsResults")
                                             ),
                                             column(width=6,
                                                    h4("Number of Tails Thrown on second toss"),
                                                    uiOutput("display_doubelCoinToss_secondTossTails_tailsResults")
                                             )
                                           )
                                    )
                                  )
                              )
                            ),
                            fluidRow(
                              box(title=h3("Tree"), width=12,
                                  plotOutput("display_doubelCoinToss_doubeCoinTossTree")
                              )
                            )
                            
)