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
                              box(title="Expected Frequency Tree", width=6,
                                  plotOutput("display_doubelCoinToss_expectedFrequencyTree")
                              ),
                              box(title="Actual Frequency Tree", width=6,
                                  plotOutput("display_doubelCoinToss_actualFrequencyTree")
                              )
                            ),
                            fluidRow(
                              box(title="Visualisatoin of Tosses", width=12,
                                  h3(HTML(paste0("First Toss Results (of ",uiOutput("display_doubelCoinToss_totalNumTosses", inline=TRUE)," tosses)"))),
                                  fluidRow(
                                    column(width=12,
                                           uiOutput("display_doubelCoinToss_firstToss")
                                    )
                                  ),
                                  fluidRow(
                                    column(width=6,
                                           h4(HTML(paste0("Number of Heads Thrown From First Toss (",uiOutput("display_doubelCoinToss_coin1HeadsResult", inline=TRUE),")"))),
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
                              box(title="Parrelel Coordinates Graph", width=12,
                                  plotlyOutput("display_doubelCoinToss_secondTossTails_parCoords")
                              )
                            )
)