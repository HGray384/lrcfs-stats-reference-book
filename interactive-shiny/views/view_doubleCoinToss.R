tabDoubleCoinToss = tabItem(tabName = "tabDoubleCoinToss",
                            fluidRow(
                              box(title="Double Coin Toss - Samples", width=12, collapsible = TRUE,
                                  p("In this example we consider the expected outcomes and the sample frequencies from a double coin toss. Please see the 'Double Toss Probabilities' tab if you need a recap of this example."),
                                  p("A 'sample' for the double coin tosses consists of tossing coin 1 followed by coin 2 and then repeating this. For example, a possible outcome for a sample of size 2 could be heads/heads, heads/tails."),
                                  p("As with the single coin toss samples, the double coin toss samples are almost guaranteed to be different from the expectations of a probability model."),
                                  p("Use the sliders below to change the number of double tosses and the probability of heads for the coins to generate a sample of double tosses and view the results in the graphs below.")
                              )
                            ),
                            fluidRow(
                                  box(title="Number of double coin tosses and probability of heads", width=12,
                                      column(width=6,
                                        sliderInput("doubleCoinToss_coinTosses", "Number of Double Coin Tosses",
                                                    min=0, max=500, step=20, value = 200),
                                      ),
                                      column(width=6,
                                        sliderInput("doubleCoinToss_headsProbability", "Probability of Heads",
                                                    min=0, max=1, step=0.1, value = 0.5),
                                      )
                                  )
                            ),
                            fluidRow(
                              box(title="Probability Tree", width=4,
                                  p("This tree displays the probability for each outcome."),
                                  plotOutput("display_doubelCoinToss_probabilityTree")
                              ),
                              box(title="Expected Frequency Tree", width=4,
                                  p("This tree displays the expected frequency of each outcome for a certain number of double tosses."),
                                  plotOutput("display_doubelCoinToss_expectedFrequencyTree")
                              ),
                              box(title="Sample Frequency Tree", width=4,
                                  p("This tree displays the sample frequency of each outcome for a certain number of double tosses."),
                                  plotOutput("display_doubelCoinToss_actualFrequencyTree")
                              )
                            ),
                            fluidRow(
                              box(title="Visualisation of Tosses", width=12, collapsible = TRUE,
                                  p("This plot shows the outcomes of the coin tosses for each coin and the order in which they occurred."),
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
                                           h3(HTML(paste0(uiOutput("display_doubelCoinToss_coin1HeadsResult2", inline=TRUE), " Tosses of Coin 2 after coin 1 heads"))),
                                           uiOutput("display_doubelCoinToss_secondTossHeads")
                                    ),
                                    column(width=6,
                                           h3(HTML(paste0(uiOutput("display_doubelCoinToss_coin1TailsResult2", inline=TRUE), " Tosses of Coin 2 after coin 1 tails"))),
                                           uiOutput("display_doubelCoinToss_secondTossTails")
                                    )
                                  ),
                                  fluidRow(
                                    column(width=3,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1HeadsResult_coin2HeadsResult", inline=TRUE), " Coin 2 Heads after Coin 1 Heads"))),
                                           uiOutput("display_doubelCoinToss_secondTossHeads_headsResults")
                                    ),
                                    column(width=3,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1HeadsResult_coin2TailsResult", inline=TRUE), " Coin 2 Tails after Coin 1 Heads"))),
                                           uiOutput("display_doubelCoinToss_secondTossHeads_tailsResults")
                                    ),
                                    column(width=3,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1TailsResult_coin2HeadsResult", inline=TRUE), " Coin 2 Heads after Coin 1 Tails"))),
                                           uiOutput("display_doubelCoinToss_secondTossTails_headsResults")
                                    ),
                                    column(width=3,
                                           h4(HTML(paste0(uiOutput("display_doubelCoinToss_coin1TailsResult_coin2TailsResult", inline=TRUE), " Coin 2 Tails after Coin 1 Tails"))),
                                           uiOutput("display_doubelCoinToss_secondTossTails_tailsResults")
                                    )
                                  )
                              )
                            ),
                            # fluidRow(
                            #   box(title="Parallel Coordinates Graph", width=12, collapsible = TRUE,
                            #       plotlyOutput("display_doubelCoinToss_parCoords")
                            #   )
                            # ),
                            fluidRow(
                              box(title="Sample proportion of outcomes with each double toss", width=12, collapsible = TRUE,
                                  p("This plot shows the sample proportion of each outcome and how it changed as the coins were being tossed."),
                                  plotlyOutput("display_doubelCoinToss_freqGraph")
                              )
                            )
)