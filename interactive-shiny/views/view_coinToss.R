tabCoinToss = tabItem(tabName = "tabCoinToss",
        fluidRow(
          box(title="Coin Toss Example", width=12,
              p("The classic example for demonstrating probability is tossing a two-sided coin. Before the coin has been tossed, the outcome is uncertain. We can consider some of the questions from the previous section to describe this uncertainty.")
          ),
          box(title="Inputs", width=12,
            column(6,
                   sliderInput("coinToss_numberOfTosses", "Number of Coin Tosses:", 1, 500, 500),
                   
            ),
            # column(1,
            #        textInput("coinToss_numberOfTossesTEXT", label="",value="500")
            # ),
            column(6,
                   sliderInput("coinToss_headsProbabilty", "Probability of Heads:", 0, 1, 0.5, step=0.1)
            )
          )
        ),
        fluidRow(
          box(title="Coin Tosses", width=12,
                 uiOutput("display_coinToss_tossResultsWaffle")
          )
        ),
        fluidRow(
          box(title="Frequncy of Occurances (heads/tails) over number of Coin Tosses", width=12,
              plotlyOutput("display_coinToss_plotlyGraph")
          )
        ),
        fluidRow(
          
          
          box(title="Total Number of Heads/Tails", width=6,
              plotOutput("display_coinToss_tossResultsPie")
          ),
          box(title="Cumulative Probability of Heads", width=6,
              plotOutput("display_coinToss_overalWhisker"),
              actionButton("coinToss_rerunCoinToss", "Re-run Coin Toss"),
              actionButton("coinToss_resetTotals", "Reset Totals")
              
          )
        )
)