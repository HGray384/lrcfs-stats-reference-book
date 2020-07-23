
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

unorderedCoinTossWafflePlot = function(coinTosses)
{
  output = ""
  for (val in coinTosses)
  {
    if(val == "heads")
    {
      output = paste0(output,"<div class='tossIcon tossIconHeads' style='background-color: ",HEADS_COLOUR,"'>H</div>");
    }
    else
    {
      output = paste0(output,"<div class='tossIcon tossIconTails' style='background-color: ",TAILS_COLOUR,"'>T</div>");
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
  unorderedCoinTossWafflePlot(actualResults$overallCoinTosses)
})

# First Heads Results
output$display_doubelCoinToss_firstTossHeads = renderUI({
  unorderedCoinTossWafflePlot(c(rep("heads",actualResults$overallCoinTosses_headsResults)))
})

# First Tails Results
output$display_doubelCoinToss_firstTossTails = renderUI({
  unorderedCoinTossWafflePlot(c(rep("tails",actualResults$overallCoinTosses_tailsResults)))
})

# Second Toss Heads
#######################################
output$display_doubelCoinToss_secondTossHeads = renderUI({
  unorderedCoinTossWafflePlot(actualResults$headsCoinTosses)
})

output$display_doubelCoinToss_secondTossHeads_headsResults = renderUI({
  unorderedCoinTossWafflePlot(c(rep("heads",actualResults$headsCoinTosses_headsResults)))
})

output$display_doubelCoinToss_secondTossHeads_tailsResults = renderUI({
  unorderedCoinTossWafflePlot(c(rep("tails",actualResults$headsCoinTosses_headsResults)))
})

# Second Toss Tails
#######################################
output$display_doubelCoinToss_secondTossTails = renderUI({
  unorderedCoinTossWafflePlot(actualResults$tailsCoinTosses)
})

output$display_doubelCoinToss_secondTossTails_headsResults = renderUI({
  unorderedCoinTossWafflePlot(c(rep("heads",actualResults$tailsCoinTosses_headsResults)))
})

output$display_doubelCoinToss_secondTossTails_tailsResults = renderUI({
  unorderedCoinTossWafflePlot(c(rep("tails",actualResults$tailsCoinTosses_tailsResults)))
})






# Double coin toss tree
##########################################

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
  v <- c(paste0(numCoinTosses,"\nTosses of Coin-1"),
         paste0(numHeadsCoinTosses,"\nCoin-1 Heads"),
         paste0(numHeadsCoinTosses,"\nTosses of Coin-2"),
         paste0(headsCoinTosses_headsResults,"\nCoin-2 Heads"),
         paste0(headsCoinTosses_tailsResults,"\nCoin-2 Tails"),
         paste0(numTailsCoinTosses,"\nCoin-1 Tails"),
         paste0(numTailsCoinTosses,"\nTosses of Coin-2"),
         paste0(tailsCoinTosses_headsResults,"\nCoin-2 Heads"),
         paste0(tailsCoinTosses_tailsResults,"\nCoin-2 Tails"))
  freqTree <- graph(edges=e, n=9, directed=TRUE)
  V(freqTree)$name <- v
  
  black=COLOUR_PALLETE[1]
  V(freqTree)$color <- c(black,HEADS_COLOUR,black,HEADS_COLOUR,TAILS_COLOUR,TAILS_COLOUR,black,HEADS_COLOUR,TAILS_COLOUR)
  V(freqTree)$label.font <- c(1, 1, 1, 1, 1, 1, 1, 1, 1)
  par(mar = c(0, 0, 0, 0))
  tree = plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
              vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
              vertex.label.cex=1.2, edge.color="black",  edge.width=1,
              layout=layout_as_tree(graph = freqTree, root = 1),
              vertex.size=50)
  
  return(tree)
  
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
  v <- c(paste0(numCoinTosses,"\nTosses of Coin-1"),
          paste0(numHeadsCoinTosses,"\nCoin-1 Heads"),
            paste0(numHeadsCoinTosses,"\nTosses of Coin-2"),
             paste0(headsCoinTosses_headsResults,"\nCoin-2 Heads"),
             paste0(headsCoinTosses_tailsResults,"\nCoin-2 Tails"),
          paste0(numTailsCoinTosses,"\nCoin-1 Tails"),
            paste0(numTailsCoinTosses,"\nTosses of Coin-2"),
             paste0(tailsCoinTosses_headsResults,"\nCoin-2 Heads"),
             paste0(tailsCoinTosses_tailsResults,"\nCoin-2 Tails"))
  freqTree <- graph(edges=e, n=9, directed=TRUE)
  V(freqTree)$name <- v
  
  black=COLOUR_PALLETE[1]
  V(freqTree)$color <- c(black,HEADS_COLOUR,black,HEADS_COLOUR,TAILS_COLOUR,TAILS_COLOUR,black,HEADS_COLOUR,TAILS_COLOUR)
  V(freqTree)$label.font <- c(1, 1, 1, 1, 1, 1, 1, 1, 1)
  par(mar = c(0, 0, 0, 0))
  tree = plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
              vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
              vertex.label.cex=1.2, edge.color="black",  edge.width=1,
              layout=layout_as_tree(graph = freqTree, root = 1),
              vertex.size=50)
  
  return(tree)
  
})

output$display_doubelCoinToss_secondTossTails_parCoords = renderPlotly({
  
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  numHeadsCoinTosses = actualResults$overallCoinTosses_headsResults
  headsCoinTosses_headsResults = actualResults$headsCoinTosses_headsResults
  headsCoinTosses_tailsResults = actualResults$headsCoinTosses_tailsResults
  numTailsCoinTosses = actualResults$overallCoinTosses_tailsResults
  tailsCoinTosses_headsResults = actualResults$tailsCoinTosses_headsResults
  tailsCoinTosses_tailsResults = actualResults$tailsCoinTosses_tailsResults
  
  fig = plot_ly(type = 'parcats', line = list(color = c('#005B8C',HEADS_COLOUR,TAILS_COLOUR,'#B07B00')),
                 dimensions = list(
                   list(label = 'Coin-1 Tosses',
                        values = c("toss","toss","toss","toss")),
                   list(label = 'Coin-1 Toss Results',
                        values = c("heads","heads","tails","tails")),
                   list(label = 'Coin-2 Tosses',
                        values = c("heads-toss","heads-toss","tails-toss","tails-toss")),
                   list(label = 'Coin-2 Toss Results',
                        values = c("heads-heads","heads-tails","tails-heads","tails-tails"))
                 ),
                 counts=c(headsCoinTosses_headsResults, headsCoinTosses_tailsResults, tailsCoinTosses_headsResults, tailsCoinTosses_tailsResults)
  )
  return(fig)
})

