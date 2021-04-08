tabDoubleCoinTree = tabItem(tabName = "tabDoubleCoinTree",
                            fluidRow(class="hideIfEmbedded",
                              box(title="Double Coin Toss - Probabilities", width=12, collapsible = TRUE,
                                  p("In this example we use a double coin toss to introduce joint probabilities. "),
                                  p("In the previous example using a single coin toss, we introduced probability as a degree of belief on a scale from 0 to 1 and saw how it could be applied to calculate the expected number of heads. In this example, we will toss two coins and see how probabilities can be used to calculate expected outcomes of both tosses. "),
                                  p("Suppose that we now have two double sided coins, coin 1 and coin 2, each of which has the same probability of resulting in heads. First we toss coin 1 and view the result and then we toss coin 2. The possible outcomes of coin 1/coin 2 are heads/heads, heads/tails, tails/heads, heads/heads. The probabilities for these outcomes are called joint probabilities."),
                                  p("Joint probabilities describe the probability of multiple events occurring together. In this example the joint probabilities of interest are the outcome of coin 1 and coin 2."),
                                  p("The right-hand slider in the panel below controls the probability of heads, which is the same for both coins. The slider on the left represents the number of times we toss both coins, e.g. 200 tosses means that we toss coin 1 and coin 2 and repeat this 200 times."),
                              )
                              # box(title="Activities", width=6,
                              #     p("Here are some activities to try with this example:"),
                              #     p("Fix the slider at 400 tosses with probability of heads of 0.5 then read the explanation below for calculating the joint probability of heads/heads."),
                              #     p("The outcomes of coin 1 are the same as for the single coin toss in the previous example - if we repeat the double coin toss 400 times then we know that coin 1 will be tossed 400 times and so with a probability of heads of 0.5 we expect 200 of these tosses to result in heads and 200 to result in tails. This is shown in the expected frequency tree below."),
                              #     p("This means that there are two scenarios by the time coin 2 is tossed; either coin 1 resulted in heads or it resulted in tails. Coin 1 is expected to result in heads 200 of the 400 tosses and so coin 2 is expected to be tossed 200 times after coin 1 is heads. For 200 tosses with a probability of 0.5, we expect coin 2 to result in heads for 100 of these 200 tosses, and tails for the other 100. This means that we expect 100 out of the total 400 tosses to result in coin 1/coin 2 showing heads/heads - this reflects a joint probability for heads/heads of 0.25."),
                              #     p("- Repeat the same steps above for the other outcomes heads/tails, tails/heads, tails/tails and check your answers against the probabilities in the probability tree below. Notice how the probabilities can be calculated by multiplying the probability of the outcome for coin 1 by the probability of the outcome for coin 2."),
                              #     p("- Keep the number of tosses at 400 and change the probability of heads to 0.2. Look at the probability tree again and check that the joint probabilities are the same as multiplying the probabilities of the outcomes for coin 1 and coin 2 together, e.g. heads/tails is 0.2 multiplied by 0.8."),
                              #     p("The joint probabilities can be obtained by multiplication in this way because the outcomes of coin 1 and coin 2 are independent. This means that the outcome of coin 1 did not affect the probabilities of the outcomes of coin 2. If outcomes are not independent then the joint probabilities cannot be calculated using just the probabilities of either coin.")
                              # )
                            ),
                            fluidRow(
                              box(title="Number of double coin tosses and probability of heads", width=12,
                                  column(width=6,
                                         sliderInput("doubleCoinTree_coinTosses", "Number of Double Coin Tosses", 
                                                     min=0, max=500, step=20, value = 200),
                                  ),
                                  column(width=6,
                                         sliderInput("doubleCoinTree_headsProbability", "Probability of Heads", 
                                                     min=0, max=1, step=0.1, value = 0.5),
                                  )
                              )
                            ),
                            fluidRow(
                              box(title = "Probability Tree", width=6,
                                  p("This tree displays the probability for each outcome."),
                                  plotOutput("display_doubleCoinTree_tree_prob")
                              ),
                              box(title = "Expected Frequency Tree", width=6, 
                                  p("This tree displays the expected frequency of each outcome for a certain number of double tosses."),
                                  plotOutput("display_doubleCoinTree_tree_freq")
                              )
                            )
)