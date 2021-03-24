lrCalc_likelihoodRatio = reactive({
  answer = input$lrCalc_probHp/input$lrCalc_probHd
  return(answer)
})


# displays
output$display_lrCalc_likelihoodRatioCalcs = renderUI({
  
  likelihoodRatio = formatNumberForDisplay(lrCalc_likelihoodRatio())
  
  formulas = c(paste0("\\text{Likelihood Ratio} &= \\frac{\\text{Probability for } E \\text{ conditioned on }H_p}{\\text{Probability for }E \\text{ conditioned on }H_d}"))
  formulas = c(formulas, paste0("&= \\frac{",input$lrCalc_probHp,"}{",input$lrCalc_probHd,"}"))
  formulas = c(formulas, paste0("&=",likelihoodRatio))
  output = mathJaxAligned(formulas)
})