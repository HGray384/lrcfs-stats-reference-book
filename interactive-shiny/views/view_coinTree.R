tabCoinTree = tabItem(tabName = "tabCoinTree",
                      fluidRow(class="hideIfEmbedded",
                               box(title="Single Coin Toss - Probabilities", width=12, collapsible = TRUE,
                                   p("In this example we use a coin toss to introduce the idea of probability. Probability here means a degree of belief in an event occurring."),
                                   p("For a standard double-sided coin, each coin tosses can result in either head or tail. The probability of getting a head means the degree of belief that a coin toss will result in a head."),
                                   p("Probabilities represent this degree of belief as a number between 0 and 1. A probability of 1 reflects a belief that the coin is guaranteed to result in a head. A probability of 0 reflects the belief that the coin will never result in a head, i.e. that it is guaranteed to be tails."),
                                   p("A probability of 0.5, which is the mid-point of 0 and 1, represents the belief that heads and tails are equally likely results of the coin toss. The closer to 1 the probability of heads is, the stronger the belief that the coin will result in a head. The closer the probability of heads is to 0, the stronger the belief that the coin toss will result in a tail."),
                                   p("The slider on the right-hand side of the panel below controls the probability of getting a head for the coin toss in this example."),
                                   p("The slider on the left-hand side of the panel below controls the number of tosses to consider.")
                               )
                        # column(width=6,
                        #        box(title="Activities", width=12,
                        #            p("Here are some activities to try with this example:"),
                        #            p("- What is the expected number of heads for 500 tosses when the probability of heads is 0.5? What is the expected number of tails?"),
                        #            p("- What is the expected number of heads for 500 tosses when the probability of heads is 0.9? Does this reflect the belief that a head is much more likely than a tail?"),
                        #            p("- What is the expected number of heads for 500 tosses when the probability of heads is 0.2? What does this tell you about the degree of belief in heads?"),
                        #            p("- Look at the probability tree for each of the above examples. What is the result if we add together the probability of heads with the probability of tails? What does this say about the probability of either heads or tails occurring?")
                        #        )
                        # )
                      ),
                      fluidRow(class="hideIfEmbedded",
                               box(title="Try it", width=12, collapsible = TRUE, collapsed = TRUE,
                                   p("Use the sliders to see how different combinations of tosses and probabilities of heads affect the expected number of heads shown on the tree diagrams. Notice how the probability of heads reflects the proportion of heads that we expect to occur, e.g. for a probability of 0.5 and a total number of tosses of 100, we expect 50 of the 100 tosses to be heads, and the other 50 to be tails."),
                                   p("Try the following activities, you can see the answers at the bottom of the page."),
                                   tags$div(
                                     tags$ol(
                                       tags$li("How many head are expected from 350 tosses with a probability of heads of 0.3?"),
                                       tags$li("If I expect 90 heads out of 150 tosses, what is my probability of heads for the coin?"),
                                       tags$li("Can you tell how the expected number of heads and tails are calculated? Hint: the calculations use the number of tosses and the probability of heads.")
                                     )
                                   )
                               )
                      ),
                      fluidRow(
                        box(title="Number of tosses and probability of heads", width=12,
                            column(width=6,
                                   sliderInput("coinTree_numberOfTosses", "Number of Coin Tosses:", min=0, max=500,
                                               value=200, step=50)
                            ),
                            column(width=6,
                                   sliderInput("coinTree_expectedPorbability", "Probability Of Heads:", min=0, max=1,
                                               value=0.5, step=0.05)
                            )
                        )
                      ),
                      fluidRow(
                        box(title="Probability Tree",
                            p("This tree displays the probability for each outcome."),
                            plotOutput("display_coinTree_prob")
                        ),
                        box(title="Expected Frequency Tree",
                            p("This tree displays the expected frequency of each outcome for a certain number of tosses."),
                            plotOutput("display_coinTree_freq")
                        )
                      ),
                      fluidRow(class="hideIfEmbedded",
                               box(title="Try it: answers", width=12, collapsible = TRUE, collapsed = TRUE,
                                   tags$div(
                                     tags$ol(
                                       tags$li("105. Move the sliders to the correct positions and read the expected number of heads."),
                                       tags$li("0.6. Fix the number of tosses to the correct amount and adjust the probability of heads until you see the required number of heads."),
                                       tags$li("The expected number of heads is calculated by multiplying the number of tosses by the probability of heads. The expected number of tails is calculated by multipling the number of tosses by the probability of tails, which is 1 minus the probability of heads.")
                                     )
                                   )
                               )
                        
                      )
                      
)
