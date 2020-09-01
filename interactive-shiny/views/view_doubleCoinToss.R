tabDoubleCoinToss = tabItem(tabName = "tabDoubleCoinToss",
                            fluidRow(
                              box(title="Double Coin Toss - Samples", width=12,
                                  p("Blah")
                              )
                            ),
                            fluidRow(
                                  box(title="Inputs", width=12,
                                      column(width=6,
                                        sliderInput("doubleCoinToss_coinTosses", "Number of Coin Tosses", min=4, max=500, step=4, value = 200),
                                      ),
                                      column(width=6,
                                        sliderInput("doubleCoinToss_headsProbability", "Probability of Heads", min=0, max=1, step=0.1, value = 0.5),
                                      )
                                  )
                            ),
                            fluidRow(
                              box(title="Probability Tree", width=4,
                                  plotOutput("display_doubelCoinToss_probabilityTree")
                              ),
                              box(title="Expected Frequency Tree", width=4,
                                  plotOutput("display_doubelCoinToss_expectedFrequencyTree")
                              ),
                              box(title="Sample Frequency Tree", width=4,
                                  plotOutput("display_doubelCoinToss_actualFrequencyTree")
                              )
                            ),
                            fluidRow(
                              box(title="Visualisation of Tosses", width=12, collapsible = TRUE,
                                  h3(HTML(paste0(uiOutput("display_doubelCoinToss_totalNumTosses", inline=TRUE), " Tosses of Coin 1"))),
                                  fluidRow(
                                    column(width=12,
                                           uiOutput("display_doubelCoinToss_firstToss")
                                    )
                                  ),
                                  fluidRow(
                                    column(width=6,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1HeadsResult", inline=TRUE), " Coin 1 Heads"))),
                                           uiOutput("display_doubelCoinToss_firstTossHeads"), 
                                    ),
                                    column(width=6,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1TailsResult", inline=TRUE), " Coin 1 Tails"))),
                                           uiOutput("display_doubelCoinToss_firstTossTails"),
                                    )
                                  ),
                                  fluidRow(
                                    column(width=6,
                                           h3(HTML(paste0(uiOutput("display_doubelCoinToss_coin1HeadsResult2", inline=TRUE), " Tosses of Coin 2"))),
                                           uiOutput("display_doubelCoinToss_secondTossHeads")
                                    ),
                                    column(width=6,
                                           h3(HTML(paste0(uiOutput("display_doubelCoinToss_coin1TailsResult2", inline=TRUE), " Tosses of Coin 2"))),
                                           uiOutput("display_doubelCoinToss_secondTossTails")
                                    )
                                  ),
                                  fluidRow(
                                    column(width=3,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1HeadsResult_coin2HeadsResult", inline=TRUE), " Coin 2 Heads"))),
                                           uiOutput("display_doubelCoinToss_secondTossHeads_headsResults")
                                    ),
                                    column(width=3,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1HeadsResult_coin2TailsResult", inline=TRUE), " Coin 2 Tails"))),
                                           uiOutput("display_doubelCoinToss_secondTossHeads_tailsResults")
                                    ),
                                    column(width=3,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1TailsResult_coin2HeadsResult", inline=TRUE), " Coin 2 Heads"))),
                                           uiOutput("display_doubelCoinToss_secondTossTails_headsResults")
                                    ),
                                    column(width=3,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1TailsResult_coin2TailsResult", inline=TRUE), " Coin 2 Tails"))),
                                           uiOutput("display_doubelCoinToss_secondTossTails_tailsResults")
                                    )
                                  )
                              )
                            ),
                            fluidRow(
                              box(title="Parallel Coordinates Graph", width=12, collapsible = TRUE,
                                  plotlyOutput("display_doubelCoinToss_parCoords")
                              )
                            ),
                            fluidRow(
                              box(title="Sample proportion of outcomes with each double toss", width=12, collapsible = TRUE,
                                  plotlyOutput("display_doubelCoinToss_freqGraph")
                              )
                            )
)