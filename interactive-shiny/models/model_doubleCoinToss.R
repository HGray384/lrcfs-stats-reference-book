
actualResults = reactiveValues(overallCoinTosses=c(),
                             overallCoinTosses_headsResults=0,
                             overallCoinTosses_tailsResults=0,
                             headsCoinTosses=c(),
                             headsCoinTosses_headsResults=0,
                             headsCoinTosses_tailsResults=0,
                             tailsCoinTosses=c(),
                             tailsCoinTosses_headsResults=0,
                             tailsCoinTosses_tailsResults=0)

GenerateCoinToss = function(numberOfCoinTosses, headsProbability)
{
  coin = c("heads","tails") #Create the coin object for tossing
  sideProbabilites = c(headsProbability,1-headsProbability) #Define the probabilities of each side of the coin
  numberOfTosses = numberOfCoinTosses #Specify the number of coin tosses
  
  #Do our coin tosses
  tosses = sample(coin, size=numberOfTosses, replace=TRUE, prob=sideProbabilites)
  return(tosses)
}

PopulateCoinToss = function(numberOfCoinTosses, headsProbability)
{
  actualResults$overallCoinTosses = GenerateCoinToss(numberOfCoinTosses, headsProbability)
  actualResults$overallCoinTosses_headsResults = length(which(actualResults$overallCoinTosses == "heads"))
  actualResults$overallCoinTosses_tailsResults = length(which(actualResults$overallCoinTosses == "tails"))
  
  actualResults$headsCoinTosses = GenerateCoinToss(actualResults$overallCoinTosses_headsResults, headsProbability)
  actualResults$headsCoinTosses_headsResults = length(which(actualResults$headsCoinTosses == "heads"))
  actualResults$headsCoinTosses_tailsResults = length(which(actualResults$headsCoinTosses == "tails"))
  
  actualResults$tailsCoinTosses = GenerateCoinToss(actualResults$overallCoinTosses_tailsResults, headsProbability)
  actualResults$tailsCoinTosses_headsResults = length(which(actualResults$tailsCoinTosses == "heads"))
  actualResults$tailsCoinTosses_tailsResults = length(which(actualResults$tailsCoinTosses == "tails"))
}

unorderedCoinTossWafflePlot = function(coinTosses,headsColour,tailsColour)
{
  output = ""
  for (val in coinTosses)
  {
    if(val == "heads")
    {
      output = paste0(output,"<div class='tossIcon tossIconHeads' style='background-color: ",headsColour,"'>H</div>");
    }
    else
    {
      output = paste0(output,"<div class='tossIcon tossIconTails' style='background-color: ",tailsColour,"'>T</div>");
    }
  }
  output = paste0(output, "<div style='clear: both'>&nbsp</div>")
  return(HTML(output))
}


# Reactives
######################################

# Expected Results
########################################################
coin1HeadsResultExpected = reactive({
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  numHeadsCoinTosses = numCoinTosses * headsProbability
  return(numHeadsCoinTosses)
})
coin1HeadsResultExpected_coin2HeadsResultExpected = reactive({
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  headsCoinTosses_headsResults = coin1HeadsResultExpected() * headsProbability
  return(headsCoinTosses_headsResults)
})
coin1HeadsResultExpected_coin2TailsResultExpected = reactive({
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  headsCoinTosses_tailsResults = coin1HeadsResultExpected() * (1-headsProbability)
  return(headsCoinTosses_tailsResults)
})


coin1TailsResultExpected = reactive({
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  numTailsCoinTosses = numCoinTosses * (1-headsProbability)
  return(numTailsCoinTosses)
})
coin1TailsResultExpected_coin2HeadsResultExpected = reactive({
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  tailsCoinTosses_headsResults = coin1TailsResultExpected() * headsProbability
  return(tailsCoinTosses_headsResults)
})
coin1TailsResultExpected_coin2TailsResultExpected = reactive({
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  tailsCoinTosses_tailsResults = coin1TailsResultExpected() * (1-headsProbability)
  return(tailsCoinTosses_tailsResults)
})




# Display properties
######################################
output$display_doubelCoinToss_totalNumTosses = renderUI({
  return(paste(input$doubleCoinToss_coinTosses))
})

output$display_doubelCoinToss_coin1HeadsResult = renderUI({
  return(paste(actualResults$overallCoinTosses_headsResults))
})

output$display_doubelCoinToss_coin1HeadsResult2 = renderUI({
  return(paste(actualResults$overallCoinTosses_headsResults))
})

output$display_doubelCoinToss_coin1TailsResult = renderUI({
  return(paste(actualResults$overallCoinTosses_tailsResults))
})
output$display_doubelCoinToss_coin1TailsResult2 = renderUI({
  return(paste(actualResults$overallCoinTosses_tailsResults))
})

output$display_doubelCoinToss_coin1HeadsResult_coin2HeadsResult = renderUI({
  return(paste(actualResults$headsCoinTosses_headsResults))
})

output$display_doubelCoinToss_coin1HeadsResult_coin2TailsResult = renderUI({
  return(paste(actualResults$headsCoinTosses_tailsResults))
})

output$display_doubelCoinToss_coin1TailsResult_coin2HeadsResult = renderUI({
  return(paste(actualResults$tailsCoinTosses_headsResults))
})

output$display_doubelCoinToss_coin1TailsResult_coin2TailsResult = renderUI({
  return(paste(actualResults$tailsCoinTosses_tailsResults))
})



observeEvent(input$doubleCoinToss_coinTosses, {
  PopulateCoinToss(input$doubleCoinToss_coinTosses, input$doubleCoinToss_headsProbability)
})

observeEvent(input$doubleCoinToss_headsProbability, {
  PopulateCoinToss(input$doubleCoinToss_coinTosses, input$doubleCoinToss_headsProbability)
})








# First Toss
#######################################
output$display_doubelCoinToss_firstToss = renderUI({
  unorderedCoinTossWafflePlot(actualResults$overallCoinTosses,HEADS_COLOUR,TAILS_COLOUR)
})

# First Heads Results
output$display_doubelCoinToss_firstTossHeads = renderUI({
  unorderedCoinTossWafflePlot(c(rep("heads",actualResults$overallCoinTosses_headsResults)),HEADS_COLOUR,TAILS_COLOUR)
})

# First Tails Results
output$display_doubelCoinToss_firstTossTails = renderUI({
  unorderedCoinTossWafflePlot(c(rep("tails",actualResults$overallCoinTosses_tailsResults)),HEADS_COLOUR,TAILS_COLOUR)
})

# Second Toss Heads
#######################################
output$display_doubelCoinToss_secondTossHeads = renderUI({
  unorderedCoinTossWafflePlot(actualResults$headsCoinTosses,HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR)
})

output$display_doubelCoinToss_secondTossHeads_headsResults = renderUI({
  unorderedCoinTossWafflePlot(c(rep("heads",actualResults$headsCoinTosses_headsResults)),HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR)
})

output$display_doubelCoinToss_secondTossHeads_tailsResults = renderUI({
  unorderedCoinTossWafflePlot(c(rep("tails",actualResults$headsCoinTosses_tailsResults)),HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR)
})

# Second Toss Tails
#######################################
output$display_doubelCoinToss_secondTossTails = renderUI({
  unorderedCoinTossWafflePlot(actualResults$tailsCoinTosses,TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
})

output$display_doubelCoinToss_secondTossTails_headsResults = renderUI({
  unorderedCoinTossWafflePlot(c(rep("heads",actualResults$tailsCoinTosses_headsResults)),TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
})

output$display_doubelCoinToss_secondTossTails_tailsResults = renderUI({
  unorderedCoinTossWafflePlot(c(rep("tails",actualResults$tailsCoinTosses_tailsResults)),TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
})






# Double coin toss tree
##########################################

output$display_doubelCoinToss_probabilityTree = renderPlot({
  
  numCoinTosses = 1
  headsProbability = input$doubleCoinToss_headsProbability
  
  numHeadsCoinTosses = numCoinTosses * headsProbability
  headsCoinTosses_headsResults = numHeadsCoinTosses * headsProbability
  headsCoinTosses_tailsResults = numHeadsCoinTosses * (1-headsProbability)
  numTailsCoinTosses = numCoinTosses * (1-headsProbability)
  tailsCoinTosses_headsResults = numTailsCoinTosses * headsProbability
  tailsCoinTosses_tailsResults = numTailsCoinTosses * (1-headsProbability)
  
  e <- c(1, 2, 1, 6, 2, 3, 3, 4, 3, 5, 6, 7, 7, 8, 7, 9)
  v <- c(paste0("Probability of\n",numCoinTosses),
         paste0("Probability of Heads\n",numHeadsCoinTosses),
         paste0("\nToss of Coin 2"),
         paste0("Probability of\nHeads/Heads\n",headsCoinTosses_headsResults),
         paste0("Probability of\nHeads/Tails\n",headsCoinTosses_tailsResults),
         paste0("Probability of Tails\n",numTailsCoinTosses),
         paste0("\nToss of Coin 2"),
          paste0("Probability of\nTails/Heads\n",tailsCoinTosses_headsResults),
          paste0("Probability of\nTails/Tails\n",tailsCoinTosses_tailsResults))
  black=COLOUR_PALLETE[1]
  c = c(black,HEADS_COLOUR,black,HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR,TAILS_COLOUR,black,TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
  return(createBinaryTree(e,v,c))
  
})

output$display_doubelCoinToss_expectedFrequencyTree = renderPlot({
  
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  
  numHeadsCoinTosses = numCoinTosses * headsProbability
  headsCoinTosses_headsResults = numHeadsCoinTosses * headsProbability
  headsCoinTosses_tailsResults = numHeadsCoinTosses * (1-headsProbability)
  numTailsCoinTosses = numCoinTosses * (1-headsProbability)
  tailsCoinTosses_headsResults = numTailsCoinTosses * headsProbability
  tailsCoinTosses_tailsResults = numTailsCoinTosses * (1-headsProbability)
  
  e <- c(1, 2, 1, 6, 2, 3, 3, 4, 3, 5, 6, 7, 7, 8, 7, 9)
  v <- c(paste0(numCoinTosses,"\nTosses of Coin 1"),
         paste0(numHeadsCoinTosses,"\nCoin 1 Heads"),
         paste0(numHeadsCoinTosses,"\nTosses of Coin 2"),
         paste0(headsCoinTosses_headsResults,"\nCoin 2 Heads"),
         paste0(headsCoinTosses_tailsResults,"\nCoin 2 Tails"),
         paste0(numTailsCoinTosses,"\nCoin 1 Tails"),
         paste0(numTailsCoinTosses,"\nTosses of Coin 2"),
         paste0(tailsCoinTosses_headsResults,"\nCoin 2 Heads"),
         paste0(tailsCoinTosses_tailsResults,"\nCoin 2 Tails"))
  black=COLOUR_PALLETE[1]
  c <- c(black,HEADS_COLOUR,black,HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR,TAILS_COLOUR,black,TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
  return(createBinaryTree(e,v,c))
  
})



output$display_doubelCoinToss_actualFrequencyTree = renderPlot({
  
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability

  numHeadsCoinTosses = actualResults$overallCoinTosses_headsResults
  headsCoinTosses_headsResults = actualResults$headsCoinTosses_headsResults
  headsCoinTosses_tailsResults = actualResults$headsCoinTosses_tailsResults
  numTailsCoinTosses = actualResults$overallCoinTosses_tailsResults
  tailsCoinTosses_headsResults = actualResults$tailsCoinTosses_headsResults
  tailsCoinTosses_tailsResults = actualResults$tailsCoinTosses_tailsResults
  
  e <- c(1, 2, 1, 6, 2, 3, 3, 4, 3, 5, 6, 7, 7, 8, 7, 9)
  v <- c(paste0(numCoinTosses,"\nTosses of Coin 1"),
          paste0(numHeadsCoinTosses,"\nCoin 1 Heads"),
            paste0(numHeadsCoinTosses,"\nTosses of Coin 2"),
             paste0(headsCoinTosses_headsResults,"\nCoin 2 Heads"),
             paste0(headsCoinTosses_tailsResults,"\nCoin 2 Tails"),
          paste0(numTailsCoinTosses,"\nCoin 1 Tails"),
            paste0(numTailsCoinTosses,"\nTosses of Coin 2"),
             paste0(tailsCoinTosses_headsResults,"\nCoin 2 Heads"),
             paste0(tailsCoinTosses_tailsResults,"\nCoin 2 Tails"))
  black=COLOUR_PALLETE[1]
  c <- c(black,HEADS_COLOUR,black,HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR,TAILS_COLOUR,black,TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
  return(createBinaryTree(e,v,c))
  
})

output$display_doubelCoinToss_parCoords = renderPlotly({
  
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  numHeadsCoinTosses = actualResults$overallCoinTosses_headsResults
  headsCoinTosses_headsResults = actualResults$headsCoinTosses_headsResults
  headsCoinTosses_tailsResults = actualResults$headsCoinTosses_tailsResults
  numTailsCoinTosses = actualResults$overallCoinTosses_tailsResults
  tailsCoinTosses_headsResults = actualResults$tailsCoinTosses_headsResults
  tailsCoinTosses_tailsResults = actualResults$tailsCoinTosses_tailsResults
  
  fig = plot_ly(type = 'parcats', line = list(color = c(HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR,TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)),
                 dimensions = list(
                   list(label = 'Coin 1 Tosses',
                        values = c("toss","toss","toss","toss")),
                   list(label = 'Coin 1 Toss Results',
                        values = c("heads","heads","tails","tails")),
                   list(label = 'Coin 2 Tosses',
                        values = c("heads-toss","heads-toss","tails-toss","tails-toss")),
                   list(label = 'Coin 2 Toss Results',
                        values = c("heads-heads","heads-tails","tails-heads","tails-tails"))
                 ),
                 counts=c(headsCoinTosses_headsResults, headsCoinTosses_tailsResults, tailsCoinTosses_headsResults, tailsCoinTosses_tailsResults)
  )
  return(fig)
})

output$display_doubelCoinToss_freqGraph = renderPlotly({
  
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  headsHeadsProbabilty = headsProbability*headsProbability
  
  coin1Tosses = actualResults$overallCoinTosses
  headsCoinTosses = actualResults$headsCoinTosses
  tailsCoinTosses = actualResults$tailsCoinTosses

  coinToss2and3Results = c()
  headsIndex = 1
  tailsIndex = 1
  for(value in coin1Tosses)
  {
    if(value == "heads")
    {
      coinToss2and3Results = c(coinToss2and3Results,paste0("heads-",headsCoinTosses[headsIndex]))
      headsIndex = headsIndex + 1
    }
    else
    {
      coinToss2and3Results = c(coinToss2and3Results,paste0("tails-",tailsCoinTosses[tailsIndex]))
      tailsIndex = tailsIndex + 1
    }
  }

  headsHeadsOccur = cumsum(coinToss2and3Results == "heads-heads") / 1:numCoinTosses
  headsTailsOccur = cumsum(coinToss2and3Results == "heads-tails") / 1:numCoinTosses
  tailsHeadsOccur = cumsum(coinToss2and3Results == "tails-heads") / 1:numCoinTosses
  tailsTailsOccur = cumsum(coinToss2and3Results == "tails-tails") / 1:numCoinTosses
  
  ggplotGraph = ggplot(NULL, aes(x=1:numCoinTosses)) + 
    geom_line(aes(y = headsHeadsOccur, text=lapply(paste0('<b>Sample proportion of Heads/Heads:</b>', headsHeadsOccur), HTML)), color = HEADS_HEADS_COLOUR) + 
    geom_line(aes(y = headsTailsOccur, text=lapply(paste0('<b>Sample proportion of Heads/Tails:</b>', headsTailsOccur), HTML)), color = HEADS_TAILS_COLOUR) + 
    geom_line(aes(y = tailsHeadsOccur, text=lapply(paste0('<b>Sample proportion of Tails/Heads:</b>', tailsHeadsOccur), HTML)), color = TAILS_HEADS_COLOUR) + 
    geom_line(aes(y = tailsTailsOccur, text=lapply(paste0('<b>Sample proportion of Tails/Tails:</b>', tailsTailsOccur), HTML)), color = TAILS_TAILS_COLOUR) + 
    geom_line(aes(y = headsHeadsProbabilty, text=lapply(paste0('<b>Probability of Heads/Heads:</b>', headsHeadsProbabilty), HTML)), color="steelblue", linetype="dash") +
    xlim(0, numCoinTosses) +
    ylim(0,1) +
    ylab("Sample proportion") +
    xlab("Coin Tosses")
  
  ggplotly(ggplotGraph, tooltip="text") %>% layout(hovermode = "x unified")
  
  
})

