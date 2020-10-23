tabHome = tabItem(tabName = "tabHome",
                  fluidRow(
                    box(title="Welcome to Stats Pro!", width = 12,
                        p("Stats Pro is an application for understanding the statistical and probabilistic concepts used in evaluating evidence in forensic science."),
                        p("The application uses interactive examples so that you can explore how different values and assumptions can affect statistical and probabilistic conclusions."),
                        p("On the tab to the left of the application you can find the different examples. Within each tab there are some sub-tabs, which demonstrate different statistical or probabilistic ideas using similar scenarios."),
                        p("You can use any example in any order that you prefer, but if you are unsure where to begin then start with the top one and work your way down the list of tabs."),
                        p("If you would like to learn more about the ideas introduced here then you can read about them in our interactive statistics book [insert link]."),
                        p("We hope that you enjoy learning using Stats Pro!")
                    )
                  ),
                  fluidRow(
                    box(title="Feedback survey", width = 12,
                        p("After using some of the examples, we would really appreciate it if you could take the time to complete the survey below. Your responses to the survey will help us to understand which features of the application
                          are useful and which features we can improve. You will also have the opportunity to suggest ideas for future developments. "),
                        HTML('<iframe src="https://dundee.onlinesurveys.ac.uk/r-shiny-app-feedback" width="100%" height="800" style="border:0px"></iframe>')
                        )
                  )
                  
)