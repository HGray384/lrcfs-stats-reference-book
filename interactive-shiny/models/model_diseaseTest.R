output$display_diseaseTree_tree = renderPlot({
  # constants for this example
  
  populationSize <- 10000
  
  sensitivity <- 0.95 # probability of testing positive given they do have the disease
  specificity <- 0.95 # probability of testing negative given they do not have the disease
  
  # reactive variables from slider input
  prevalence <- input$diseasePrevalence
  
  diseased <- populationSize*prevalence
  
  notDiseased <- populationSize-diseased
  
  diseasedTestPositive <- diseased*sensitivity
  diseasedTestNegative <- diseased-diseasedTestPositive
  
  notDiseasedTestNegative <- notDiseased*specificity
  notDiseasedTestPositive <- notDiseased-notDiseasedTestNegative
  
  e <- c(1, 2, 1, 6, 2, 3, 3, 4, 3, 5, 6, 7, 7, 8, 7, 9)
  v <- c(paste0(populationSize,"\nPeople"),
         paste0(diseased,"\nDisease"),
         paste0(diseased,"\nDiseased Tested"),
         paste0(diseasedTestPositive,"\nTest Positive"),
         paste0(diseasedTestNegative,"\nTest Negative"),
         paste0(notDiseased,"\nNo Disease"),
         paste0(notDiseased,"\nDisease-free Tested"),
         paste0(notDiseasedTestPositive,"\nTest Positive"),
         paste0(notDiseasedTestNegative,"\nTest Negative"))
  black=COLOUR_PALLETE[1]
  c <- c(black,HEADS_COLOUR,black,HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR,TAILS_COLOUR,black,TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
  return(createBinaryTree(e,v,c))
}, width = IMAGE_WIDTH,)
