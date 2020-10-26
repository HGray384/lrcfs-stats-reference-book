tabCoinTree = tabItem(tabName = "tabCoinTree",
                      fluidRow(
                        box(title="Single Coin Toss - Probabilities", width=12,
                            p("In this example we use a coin toss to introduce the idea of probability. Probability here means a degree of belief in an event occurring."),
                            p("For a standard double-sided coin, each coin tosses can result in either heads or tails. The probability of getting a heads means the degree of belief that a  coin toss will result in heads."),
                            p("Probabilities represent this degree of belief as a number between 0 and 1. A probability of 1 reflects a belief that the coin is guaranteed to result in heads. A probability of 0 refelcts the belief that the coin will never result in heads, i.e. that it is guaranteed to be tails."),
                            p("A probability of 0.5, which is the mid-point of 0 and 1, represents the belief that heads and tails are equally likely results of the coin toss. The closer to 1 the probability of heads is, the stronger the belief that the coin will result in heads. The closer the probability of heads is to 0, the stronger the belief that the coin toss will not result heads, i.e. tails."),
                            p("The slider on the right-hand side below controls the probability of getting a heads for the coin toss in this example."),
                            p("This probability can be used to specify how many heads we expect for a certain number of coin tosses. "),
                            p("The slider on the left-hand side below controls the number of tosses to show the expected number of heads for a certain probability of heads."),
                            p("Use the sliders to see how different combinations of tosses and probabilities of heads affect the expected number of heads. Notice how the probability of heads reflects the proportion of heads that we expect to occur, e.g. for a probability of 0.5 and a total number of tosses of 100, we expect 50 of the 100 tosses to be heads, and the other 50 to be tails."),
                            p("Here are some activities to try with this example:"),
                            p("- What is the expected number of heads for 500 tosses when the probability of heads is 0.5? What is the expected number of tails?"),
                            p("- What is the expected number of heads for 500 tosses when the probability of heads is 0.9? Does this reflect the belief that heads is much more likely than tails?"),
                            p("- What is the expected number of heads for 500 tosses when the probability of heads is 0.2? What does this tell you about the degree of belief in heads?"),
                            p("- Look at the probability tree for each of the above examples. What is the result if we add together the probability of heads with the probability of tails? What does this say about either heads or tails occurring?")
                        )
                      ),
                      fluidRow(
                        box(title="Inputs", width=12,
                            column(width=6,
                                   sliderInput("coinTree_numberOfTosses", "Number of Coin Tosses:", 1, 500, 50)
                            ),
                            column(width=6,
                                   sliderInput("coinTree_expectedPorbability", "Probability Of Heads:", 0, 1, 0.5)
                            )
                        )
                      ),
                      fluidRow(
                        box(title="Probability Tree",
                            plotOutput("display_coinTree_prob")
                        ),
                        box(title="Expected Frequency Tree",
                            plotOutput("display_coinTree_freq")
                        )
                      )
                      
)
