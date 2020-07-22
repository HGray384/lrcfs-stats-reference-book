overallCoinTosses = c()
headsCoinTosses = c()
headsCoinTosses_headsResults = 0
headsCoinTosses_tailsResults = 0
tailsCoinTosses = c()
tailsCoinTosses_headsResults = 0
tailsCoinTosses_tailsResults = 0

GetCoinTossNEw = function(numberOfCoinTosses, headsProbability)
{
  coin = c("heads","tails") #Create the coin object for tossing
  sideProbabilites = c(headsProbability,1-headsProbability) #Define the probabilities of each side of the coin
  numberOfTosses = numberOfCoinTosses #Specify the number of coin tosses
  
  #Do our coin tosses
  tosses = sample(coin, size=numberOfTosses, replace=TRUE, prob=sideProbabilites)
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




# Display properties
######################################
output$display_doubelCoinToss_totalNumTosses = renderUI({
  return(paste(input$doubleCoinToss_coinTosses))
})


















# First Toss
#######################################
output$display_doubelCoinToss_firstToss = renderUI({
  
  numberOfTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  overallCoinTosses <<- GetCoinTossNEw(numberOfTosses, headsProbability)
  
  return(unorderedCoinTossWafflePlot(overallCoinTosses))
  
})

# First Heads Results
output$display_doubelCoinToss_firstTossHeads = renderUI({
  
  numberOfTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  headsResults = overallCoinTosses[which(overallCoinTosses == "heads")]

  return(unorderedCoinTossWafflePlot(headsResults))
  
})

# First Tails Results
output$display_doubelCoinToss_firstTossTails = renderUI({

  numberOfTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  headsResults = overallCoinTosses[which(overallCoinTosses == "tails")]
  
  return(unorderedCoinTossWafflePlot(headsResults))
})






# Second Toss Heads
#######################################
output$display_doubelCoinToss_secondTossHeads = renderUI({
  
  numberOfTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  numHeads = length(which(overallCoinTosses == "heads"))
  
  headsCoinTosses <<- GetCoinTossNEw(numHeads, headsProbability)
  
  return(unorderedCoinTossWafflePlot(headsCoinTosses))
})

output$display_doubelCoinToss_secondTossHeads_headsResults = renderUI({
  
  numberOfTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  headsResults = headsCoinTosses[which(headsCoinTosses == "heads")]
  
  return(unorderedCoinTossWafflePlot(headsResults))
})

output$display_doubelCoinToss_secondTossHeads_tailsResults = renderUI({
  
  numberOfTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  tailsResults = headsCoinTosses[which(headsCoinTosses == "tails")]
  
  return(unorderedCoinTossWafflePlot(tailsResults))
})







# Second Toss Tails
#######################################
output$display_doubelCoinToss_secondTossTails = renderUI({
  
  numberOfTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  numTails = length(which(overallCoinTosses == "tails"))
  
  tailsCoinTosses <<- GetCoinTossNEw(numTails, headsProbability)
  
  return(unorderedCoinTossWafflePlot(tailsCoinTosses))
  
})

output$display_doubelCoinToss_secondTossTails_headsResults = renderUI({
  
  numberOfTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  headsResults = tailsCoinTosses[which(tailsCoinTosses == "heads")]
  
  return(unorderedCoinTossWafflePlot(headsResults))
})

output$display_doubelCoinToss_secondTossTails_tailsResults = renderUI({
  
  numberOfTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  tailsResults = tailsCoinTosses[which(tailsCoinTosses == "tails")]
  
  return(unorderedCoinTossWafflePlot(tailsResults))
})






# Double coin toss tree
##########################################
output$display_doubelCoinToss_doubeCoinTossTree = renderPlot({
  
  numCoinTosses = input$doubleCoinToss_coinTosses
  headsProbability = input$doubleCoinToss_headsProbability
  
  
  numHeadsCoinTosses = length(headsCoinTosses)
  headsCoinTosses_headsResults = length(which(headsCoinTosses == "heads"))
  headsCoinTosses_tailsResults = length(which(headsCoinTosses == "tails"))
  numTailsCoinTosses = length(tailsCoinTosses)
  tailsCoinTosses_headsResults = length(which(tailsCoinTosses == "heads"))
  tailsCoinTosses_tailsResults = length(which(tailsCoinTosses == "tails"))
  
  e <- c(1, 2, 1, 3, 2, 4, 2, 5, 3, 6, 3, 7)
  v <- c(paste0(numCoinTosses,"\ntosses"),
         paste0(numHeadsCoinTosses,"\ncoin 1 heads"),
         paste0(numTailsCoinTosses,"\ncoin 1 tails"),
         paste0(headsCoinTosses_headsResults,"\ncoin 2 heads"),
         paste0(headsCoinTosses_tailsResults,"\ncoin 2 tails"),
         paste0(tailsCoinTosses_headsResults,"\ncoin 2 heads"),
         paste0(tailsCoinTosses_tailsResults,"\ncoin 2 tails"))
  freqTree <- graph(edges=e, n=7, directed=FALSE)
  V(freqTree)$name <- v
  
  V(freqTree)$color <- c(rep(COLOUR_PALLETE[1], 7))
  V(freqTree)$label.font <- c(2, 2, 1, 2, 1, 1, 1)
  par(mar = c(0, 0, 0, 0))
  tree = plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
              vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
              vertex.label.cex=1.2, edge.color="grey70",  edge.width=2,
              layout=layout_as_tree(graph = freqTree, root = 1),
              vertex.size=50)
  
  return(tree)
  
})

