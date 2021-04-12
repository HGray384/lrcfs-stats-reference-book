tabHome = tabItem(tabName = "tabHome",
                  fluidRow(
                    box(title="Welcome to the Interactive Probability and Statistics Application (IPSA)", width = 12,
                        p("This application is used for understanding the probabilistic and statistical concepts used in evaluating evidence in forensic science."),
                        p("The application uses interactive examples so that you can explore how different values and assumptions can affect probabilistic and statistical conclusions."),
                        p("On the tab to the left of the application you can find the different examples. Within each tab there are some sub-tabs, which demonstrate different ideas using similar scenarios."),
                        p("You can use any example in any order that you prefer, but if you are unsure where to begin then start with the top one and work your way down the list of tabs."),
                        p(HTML("If you would like to learn more about the ideas introduced here then you can read about them in our <a href='https://lrcfs.dundee.ac.uk/lr-book/'>interactive probability and statistics book</a>.")),
                        p("We hope that you enjoy learning using this app.")
                    )
                  )
                  ,
                  fluidRow(
                    box(title="Information for research participants", width = 12,
                        p("If you are a research participant in our study, then please follow the instructions given in the survey. The text boxes at the top of each tab may be minimised to reduce screen clutter by clicking the button in their top right-hand corner."),
                    )
                  ),
                  fluidRow(
                    box(title = "Development information", width = 12,
                        p(HTML("This application is being developed by Mr Roy Mudie (Application Specialist) and Dr Harry Gray (Harding Fellow) at the Leverhulme Research Centre for Forensic Science (LRCFS). The principal investigator for this project is Professor Niamh Nic Da&eacute;id."))                      )
                  )
)