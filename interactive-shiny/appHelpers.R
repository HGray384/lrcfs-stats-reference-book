# Allows building of mathJax formulas that are aligned by creating a vector of formulas
#
# To use create a vector of formulas with &= where you'd like the formulas to align
# lineSpacing can be used to change the spacing between lines
# [[break]] can be used to add a breaking space
# breakingSpace property can be set to change line height
#
# Example:
# formulas = c(paste0("\\text{Intercept}(b_0) &=",intercept))
# formulas = c(formulas, paste0("\\text{Slope}(b_1) &= ", colourNumber(slope, input$useColours, input$colour6)))
# formulas = c(formulas, paste0("R^2_{\\text{adj}} &=",rSquare))
# formulas = c(formulas, paste0("n &= ",colourNumber(n, input$useColours, input$colour5)))
# output = mathJaxAligned(formulas, 10)

mathJaxAligned = function(formulas, lineSpacing = 20, breakingSpace = 50)
{
  formulasOutput = ""
  for(element in formulas)
  {
    if(endsWith(element, "[[break]]"))
    {
      element = str_remove(element,"\\[\\[break\\]\\]")
      formulasOutput = paste("\\",formulasOutput, element,"\\\\[",breakingSpace,"pt]")
    }
    else
    {
      formulasOutput = paste("\\",formulasOutput, element,"\\\\[",lineSpacing,"pt]")
    }
    
  }
  
  output = paste("$$\\begin{align}", formulasOutput, "\\end{align}$$")
  return(withMathJax(output))
}




#Takes any number and formats it in either scientific notation or rounded to a specified number of decimal places
#Can also handle a vector
formatNumberForDisplay = function(number, numDecimalPlaces = 20, useScientificNotationIfLessThan = 0.00000000001, useScientificNotationIfMoreThan = 100000000000, numOfScientificNotationDigits = 4)
{
  #If it's got a length then lets apply the whole function again to the vector
  if(length(number) > 1)
  {
    numbers = lapply(number, function(x) formatNumberForDisplay(x,input))
    numbers = unlist(numbers) #Unlist because datatable has problem with sorting lists
    return(numbers)
  }
  
  #Check if number is a factor (possibly a string) and just return as character
  if(is.factor(number))
    return(as.character(number))
  
  #If it's NULL, NA or not numeric then just return it
  if(is.null(number) | any(is.na(number)) | !is.numeric(number))
  {
    return(number)
  }
  
  #If it's 0 then just return 0
  if(number == 0)
  {
    formattedNumber = 0;
  }
  #If it's less than some value (e.g. 0.0001) then use scientific notation
  else if(abs(number) < useScientificNotationIfLessThan)
  {
    formattedNumber = formatC(number, format = "e", digits = numOfScientificNotationDigits)
  }
  #If it's more than some value (e.g. 1,000,000) then use scientific notation
  else if(abs(number) > useScientificNotationIfMoreThan)
  {
    formattedNumber = formatC(number, format = "e", digits = numOfScientificNotationDigits)
  }
  #Else, lets round the number
  else
  {
    num = round(number, numDecimalPlaces)
    formattedNumber = formatC(num, format = "fg", digits=str_length(num)-1)
  }
  
  return(formattedNumber)
}