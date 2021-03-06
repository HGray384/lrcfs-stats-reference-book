dopingTest_likelihoodratio_likelihoodRatio = reactive({
  answer = input$doping_like_Sensitivity/(1-input$doping_like_Specificity)
  return(answer)
})

dopingTest_likelihoodratio_posteriorOdds = reactive({
  answer = priorOdds*dopingTest_likelihoodratio_likelihoodRatio()
  return(answer)
})

# displays

output$display_dopingTest_likelihoodratio_infoBoxPopulation <- renderInfoBox({
  infoBox("Population", populationSize, icon = icon("users"), color = "purple")
})

output$display_dopingTest_likelihoodratio_infoBoxBaseRate <- renderInfoBox({
  infoBox("Base Rate", baseRate, icon = icon("prescription-bottle"), color = "red")
})


output$display_dopingTest_likelihoodratio_treeInfo = renderUI({
  
  # reactive variables from slider input
  sensitivity <- input$doping_like_Sensitivity # probability of testing positive given they are doping
  specificity <- input$doping_like_Specificity # probability of testing negative given they are not doping
  
  dopingTestPositive <- doping*sensitivity
  dopingTestNegative <- doping-dopingTestPositive
  
  notDopingTestNegative <- notDoping*specificity
  notDopingTestPositive <- notDoping-notDopingTestNegative
  
  tagList(
    h4(paste0("Population: ", populationSize)),
    h4(paste0("Base Rate: ", baseRate)),
    p(paste0("In our interactive example we have a relevant population of ",populationSize," athletes. Using the base rate of ",baseRate," we expect ",doping," of these to be doping and ",notDoping," not to be doping.")),
    p(HTML(paste0("By testing our ",populationSize," athletes we are testing our ",doping," dopers. With a sensitivity of ",sensitivity," we know that out of the ",doping," athletes who are doping, the test is expected to return positive for <span class='goodResult' style='color:",GOOD_RESULT,"'>",dopingTestPositive,"</span> of them and negative for <span class='badResult' style='color:",BAD_RESULT,"'>",dopingTestNegative,"</span> of them."))),
    p(HTML(paste0("Out of the ",notDoping," athletes who are not doping, the specificity of ",specificity," tells us to expect <span class='goodResult' style='color:",GOOD_RESULT,"'>",notDopingTestNegative,"</span> to test negative but we also expect <span class='badResult' style='color:",BAD_RESULT,"'>",notDopingTestPositive,"</span> of these non-doping athletes to test positive.")))
  )
  
  
})

output$display_dopingTest_likelihoodratio_tree <- renderPlot({

  # reactive variables from slider input
  sensitivity <- input$doping_like_Sensitivity # probability of testing positive given they are doping
  specificity <- input$doping_like_Specificity # probability of testing negative given they are not doping
  
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
  freqTree <- graph(edges=e, n=9, directed=TRUE)
  V(freqTree)$name <- v
  
  black=COLOUR_PALLETE[1]
  V(freqTree)$color <- c(black,black,black,GOOD_RESULT,BAD_RESULT,black,black,BAD_RESULT,GOOD_RESULT)
  V(freqTree)$label.font <- c(1, 1, 1, 1, 1, 1, 1, 1, 1)
  V(freqTree)$label.family <- c(rep("sans",9))
  par(mar = c(0, 0, 0, 0))
  tree <- plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
               vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
               vertex.label.cex=1.2, edge.color="black",  edge.width=1,
               layout=layout_as_tree(graph = freqTree, root = 1),
               vertex.size=50)
  return(tree)
})



output$display_dopingTest_likelihoodratio_priorOddsCalcs = renderUI({

  priorOdds = formatNumberForDisplay(priorOdds)
  
  formulas = c(paste0("\\text{Prior Odds} = \\frac{\\text{Base Rate}}{1-\\text{Base Rate}} &= \\frac{",baseRate,"}{1-",baseRate,"}"))
  formulas = c(formulas, paste0("&= \\frac{",baseRate,"}{",1-baseRate,"}"))
  formulas = c(formulas, paste0("&=",priorOdds))
  output = mathJaxAligned(formulas)
  
})


output$display_dopingTest_likelihoodratio_likelihoodRatioInfo = renderUI({
  likelihoodRatio = formatNumberForDisplay(dopingTest_likelihoodratio_likelihoodRatio())
  tagList(
    p(paste0("The box opposite contains the calculations for the LR for a positive test result. The LR compares the probability of obtaining a positive test result conditioned on the athlete doping with the probability of a positive test result conditioned on the athlete not doping.")),
    p(paste0("The probability of a positive test result conditioned on the athlete doping is just the sensitivity, ", input$doping_like_Sensitivity, ".")),
    p(paste0("The probability of a positive test result conditioned on the athlete not doping is equal to 1 minus the probability of a negative test result conditioned on the athlete not doping since these two probabilities are mutually exclusive and exhaustive. This means that itis equal to 1 minus the specificity, ", input$doping_like_Specificity), "."),
    p(paste0("This LR means that a positive test is ", formatNumberForDisplay(likelihoodRatio), " times more probable when the athlete is doping compared to when they are not doping."))
  )
  
  
})

output$display_dopingTest_likelihoodratio_likelihoodRatioCalcs = renderUI({
  
  likelihoodRatio = formatNumberForDisplay(dopingTest_likelihoodratio_likelihoodRatio())
  
  formulas = c(paste0("\\text{Likelihood Ratio} = \\frac{\\text{Sensitivity}}{1-\\text{Specificity}} &= \\frac{",input$doping_like_Sensitivity,"}{1-",input$doping_like_Specificity,"}"))
  formulas = c(formulas, paste0("&= \\frac{",input$doping_like_Sensitivity,"}{",1-input$doping_like_Specificity,"}"))
  formulas = c(formulas, paste0("&=",likelihoodRatio))
  output = mathJaxAligned(formulas)
  
})


output$display_dopingTest_likelihoodratio_posteriorOddsInfo = renderUI({
  
  tagList(
    p(paste0("The box opposite contains the calculation for the posterior odds. Bayes' rule states that the posterior odds must be equal to the prior odds multiplied by the LR.")),
    p(paste0("This means that the prior odds, ",formatNumberForDisplay(priorOdds),", are updated through multiplication by the LR, ",formatNumberForDisplay(dopingTest_likelihoodratio_likelihoodRatio())," to obtain the posterior odds.")),
    p(paste0("This can be interpreted as the athlete being ", formatNumberForDisplay(dopingTest_likelihoodratio_posteriorOdds()), " times more likely to be doping than not doping after learning their test result.")),
    p(paste0("When the posterior odds are below 1 then the odds are still in favour of the athlete not doping. When they are greater than 1 then they are in favour of the athlete doping."))
  )
  
})

output$display_dopingTest_likelihoodratio_posteriorOddsCalcs = renderUI({
  
  posteriorOdds= formatNumberForDisplay(dopingTest_likelihoodratio_posteriorOdds())
  
  formulas = c(paste0("\\text{Posterior Odds} &= \\text{Prior Odds} \\times \\text{Likelihood Ratio}"))
  formulas = c(formulas, paste0("&= ",formatNumberForDisplay(priorOdds),"\\times",formatNumberForDisplay(dopingTest_likelihoodratio_likelihoodRatio())))
  formulas = c(formulas, paste0("&=",posteriorOdds))
  output = mathJaxAligned(formulas)
  
})




