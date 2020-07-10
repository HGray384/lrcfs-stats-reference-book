tabCoinToss = tabItem(tabName = "tabCoinToss",
        fluidRow(
          column(4,
                 sliderInput("coinToss_numberOfTosses", "Number of Coin Tosses:", 1, 500, 500)
          ),
          column(4,
                 sliderInput("coinToss_headsProbabilty", "Probability of Heads:", 0, 1, 0.5, step=0.1)
          ),
          column(4,
                 actionButton("coinToss_rerunCoinToss", "Re-run Coin Toss"),
                 actionButton("coinToss_resetTotals", "Reset Totals")
          )
        ),
        fluidRow(
          column(8,
                 uiOutput("display_coinToss_tossResultsWaffle")
          ),
          column(4,
                 plotOutput("display_coinToss_tossResultsPie")
          )
        ),
        fluidRow(
          column(8,
                 plotlyOutput("display_coinToss_plotlyGraph")
          ),
          column(4,
                 plotOutput("display_coinToss_overalWhisker")
          )
        )
)