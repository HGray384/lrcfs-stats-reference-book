tabDiseaseTest = tabItem(tabName = "tabDiseaseTest",
                         fluidRow(class="hideIfEmbedded",
                           box(title="Disease Testing Example", width=12, collapsible = TRUE,
                               p("In this example we will explore something called the base rate and how that can affect the results of a disease test. The base rate describes the background occurrence of something within a population."),
                               p("For diseases, the base rate describes the proportion of the population who have the disease."),
                               p("When we test people for the disease, we do not know whether they have the disease or not and we are using the test to try to help us determine that."),
                               p("However, every test makes mistakes, and so the result of the test is not guaranteed to be correct."),
                               p("Two important features of a diagnostic test are the sensitivity and specificity, and these are explained in the information box below."),
                               p("Change the base rate of the disease using the slider below and see how that affects the number of mistakes the test makes for a population of 10,000 people.")
                           )
                         ),
                         fluidRow(
                           box(title = "Disease and Test Information",
                               p("In this box you can control the base rate of the disease and view the sensitivity and specificity of the test. You can see the effects of the changes that you make in the box opposite."),
                               p("One interesting result occurs when the disease is very rare. How many positive results are returned then? What proportion of those positive results are correct? Can you tell why this happens?"),
                               sliderInput("diseasePrevalence", h3("Base Rate of Disease"), min=0.05, max=0.95, step=0.05, value = 0.2),
                               br(),
                               h3("Test sensitivity: 0.95"),
                               p("The sensitivity of the disease test is the probability that it returns a positive test result when the tested person has the disease."),
                               div(class="infoBox", "A test sensitivity of 0.95 means that out of 100 diseased individuals, 95 correctly test positive.", status = "info"),
                               br(),
                               h3("Test specificity: 0.95"),
                               p("The specificity of the disease test is the probability that it returns a negative test result when the tested person is disease-free."),
                               div(class="infoBox", "A test specificity of 0.95 means that out of 100 disease-free individuals, 95 correctly test negative.", status = "info")
                           ),
                           box(title="Disease and test results",
                               p("This tree shows the test results for a population of people for the base rate and test details given in the box opposite."),
                               plotOutput("display_diseaseTree_tree")
                           )
                         )
)