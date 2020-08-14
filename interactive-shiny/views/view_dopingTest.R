tabDopingTest = tabItem(tabName = "tabDopingTest",
                         fluidRow(
                           box(title="Doping Testing Example", width=12,
                               p("In this example we will explore the effectiveness of tests and how that affects conditional probabilities."),
                               p("There are athletes who are doping in order to improve their performance. A test has been developed to try to detect whether the athletes is doping or not. The test can return positive or negative for doping, but there is always uncertainty about its results."),
                               p("The sensitivity of a test is the probability that it returns a positive test result when the athlete is truly doping."),
                               p("The specificity of a test is the probability that the test returns a negative result when the athlete is truly not doping."),
                               p("Change these properties of the test using the slider below and see how that affects the number of mistakes the test is expected to make.")
                           )
                         ),
                         fluidRow(
                           box(title = "Doping rate and Test Information",
                               h3("Base Rate of Doping Athletes: 0.02"),
                               br(),
                               sliderInput("dopingSensitivity", h3("Test sensitivity:"), min=0.01, max = 0.99, step=0.01, value = 0.95),
                               br(),
                               sliderInput("dopingSpecificity", h3("Test specificity:"), min=0.01, max = 0.99, step=0.01, value = 0.95)
                           ),
                           box(title="Expected doping and test results",
                               plotOutput("display_dopingTree_tree")
                           )
                         )
)