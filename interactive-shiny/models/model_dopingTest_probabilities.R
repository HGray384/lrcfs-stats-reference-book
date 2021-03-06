likelihoodRatio = reactive({
  answer = input$doping_prob_Sensitivity/(1-input$doping_prob_Specificity)
  return(answer)
})

posteriorOdds = reactive({
  answer = priorOdds*likelihoodRatio()
  return(answer)
})

# displays

output$display_dopingTest_probabilities_infoBoxPopulation <- renderInfoBox({
  infoBox("Population", populationSize, icon = icon("users"), color = "purple")
})

output$display_dopingTest_probabilities_infoBoxBaseRate <- renderInfoBox({
  infoBox("Base Rate", baseRate, icon = icon("prescription-bottle"), color = "red")
})


output$display_dopingTest_probabilities_treeInfo = renderUI({
  
  # reactive variables from slider input
  sensitivity <- input$doping_prob_Sensitivity # probability of testing positive given they are doping
  specificity <- input$doping_prob_Specificity # probability of testing negative given they are not doping
  
  dopingTestPositive <- doping*sensitivity
  dopingTestNegative <- doping-dopingTestPositive
  
  notDopingTestNegative <- notDoping*specificity
  notDopingTestPositive <- notDoping-notDopingTestNegative
  
  tagList(
    h4(paste0("Population: ", populationSize)),
    h4(paste0("Base Rate: ", baseRate)),
    p(paste0("In this example we have a relevant population of ",populationSize," athletes. Using the base rate of ",baseRate," we expect ",doping," of these to be doping and ",notDoping," not to be doping.")),
    p(HTML(paste0("By testing the ",populationSize," athletes we are testing ",doping," dopers. With a sensitivity of ",sensitivity," we know that out of the ",doping," athletes who are doping, the test is expected to return positive for <span class='goodResult' style='color:",GOOD_RESULT,"'>",dopingTestPositive,"</span> of them and negative for <span class='badResult' style='color:",BAD_RESULT,"'>",dopingTestNegative,"</span> of them."))),
    p(HTML(paste0("Out of the ",notDoping," athletes who are not doping, the specificity of ",specificity," tells us to expect <span class='goodResult' style='color:",GOOD_RESULT,"'>",notDopingTestNegative,"</span> to test negative and <span class='badResult' style='color:",BAD_RESULT,"'>",notDopingTestPositive,"</span> of these non-doping athletes to test positive.")))
  )
  
  
})

output$display_dopingTest_probabilities_tree <- renderPlot({

  # reactive variables from slider input
  sensitivity <- input$doping_prob_Sensitivity # probability of testing positive given they are doping
  specificity <- input$doping_prob_Specificity # probability of testing negative given they are not doping
  
  dopingTestPositive <- doping*sensitivity
  dopingTestNegative <- doping-dopingTestPositive
  
  notDopingTestNegative <- notDoping*specificity
  notDopingTestPositive <- notDoping-notDopingTestNegative
  
  e <- c(1, 2, 1, 6, 2, 3, 3, 4, 3, 5, 6, 7, 7, 8, 7, 9)
  v <- c(paste0(populationSize,"\nAthletes"),
         paste0(doping,"\nDoping"),
         paste0(doping,"\nDopers Tested"),
         paste0(dopingTestPositive,"\nTest Positive"),
         paste0(dopingTestNegative,"\nTest Negative"),
         paste0(notDoping,"\nNot Doping"),
         paste0(notDoping,"\nNon-dopers Tested"),
         paste0(notDopingTestPositive,"\nTest Positive"),
         paste0(notDopingTestNegative,"\nTest Negative"))
  black=COLOUR_PALLETE[1]
  c <- c(black,black,black,GOOD_RESULT,BAD_RESULT,black,black,BAD_RESULT,GOOD_RESULT)
  return(createBinaryTree(e,v,c))
}, width = IMAGE_WIDTH)




