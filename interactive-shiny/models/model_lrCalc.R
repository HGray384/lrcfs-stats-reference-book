lrCalc_likelihoodRatio = reactive({
  answer = input$lrCalc_probHp/input$lrCalc_probHd
  return(answer)
})

# displays
output$display_lrCalc_likelihoodRatioCalcs = renderUI({
  
  probHp = formatNumberForDisplay(input$lrCalc_probHp, numDecimalPlaces = 20, useScientificNotationIfLessThan = 0.000000000000000000001, useScientificNotationIfMoreThan = 100000000000000000000, numOfScientificNotationDigits = 4)
  probHd = formatNumberForDisplay(input$lrCalc_probHd, numDecimalPlaces = 20, useScientificNotationIfLessThan = 0.000000000000000000001, useScientificNotationIfMoreThan = 100000000000000000000, numOfScientificNotationDigits = 4)
  likelihoodRatio = formatNumberForDisplay(lrCalc_likelihoodRatio(), numDecimalPlaces = 20, useScientificNotationIfLessThan = 0.000000000000000000001, useScientificNotationIfMoreThan = 100000000000000000000, numOfScientificNotationDigits = 4)
  
  formulas = c(paste0("\\text{Likelihood Ratio} &= \\frac{\\text{Probability of } E \\text{ conditioned on }H_p}{\\text{Probability of }E \\text{ conditioned on }H_d}"))
  formulas = c(formulas, paste0("&= \\frac{",probHp,"}{",probHd,"}"))
  formulas = c(formulas, paste0("&=",likelihoodRatio))
  output = mathJaxAligned(formulas)
})