tabPropLevel = tabItem(tabName = "tabPropLevel",
                       fluidRow(class="hideIfEmbedded",
                                column(width=6,
                                       box(title="Proposition levels", width=12,
                                           p("some text")
                                           )
                                ),
                       ),
                       # fluidRow(
                       #   box(title="Proposition quiz", width=12,
                       #       uiOutput("display_propLevel_quiz")
                       #   )
                       # )
                       fluidRow(
                         quiz(caption="Proposition levels", 
                              question("Glass fragments that were found inside the vehicle came from the broken window of the office.", 
                                       answer("Offence"), 
                                       answer("Activity"), 
                                       answer("Source", correct = TRUE), 
                                       answer("Sub-source") 
                              ), 
                              question("The suspect was present at the crime scene.",
                                       answer("Offence"), 
                                       answer("Activity"), 
                                       answer("Source", correct = TRUE), 
                                       answer("Sub-source") 
                              )
                         )
                       )
)
