tabDiseaseTest = tabItem(tabName = "tabDiseaseTest",
                         fluidRow(
                           box(title="Disease Testing Example", width=12,
                               p("In this example we will explore something called the base rate and how that can affect conditional probabilities. The base rate describes the background occurrence of something within a population."),
                               p("For diseases, the base rate describes the proportion of the population who have the disease."),
                               p("When we test people for the disease, we do not know whether they have the disease or not and we are using the test to try to help us determine that."),
                               p("However, every test makes mistakes, and so the result of the test is not guaranteed to be true."),
                               p("Change the base rate of the disease using the slider below and see how that affects the number of mistakes the test is expected to make.")
                           )
                         ),
                         fluidRow(
                           box(title = "Disease and Test Information",
                               sliderInput("diseasePrevalence", h3("Base Rate of Disease"), min=0.05, max=0.95, step=0.05, value = 0.2),
                               br(),
                               h3("Test sensitivity: 0.95"),
                               div(class="infoBox", "A test sensitivity of 0.95 means that out of 100 doping athletes 95 would test positive.", status = "info"),
                               br(),
                               h3("Test specificity: 0.95"),
                               div(class="infoBox", "A test sensitivity of 0.95 means that out of 100 doping athletes 95 would test positive.", status = "info")
                           ),
                           box(title="Expected disease and test results",
                               plotOutput("display_diseaseTree_tree")
                           )
                         )
)