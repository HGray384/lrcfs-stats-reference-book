output$display_doubleCoinTree_tree_prob = renderPlot({
  
  numCoinTosses = 1
  headsProbability = input$doubleCoinTree_headsProbability
  
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
  freqTree <- graph(edges=e, n=9, directed=TRUE)
  V(freqTree)$name <- v
  
  black=COLOUR_PALLETE[1]
  V(freqTree)$color <- c(black,HEADS_COLOUR,black,HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR,TAILS_COLOUR,black,TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
  V(freqTree)$label.font <- c(1, 1, 1, 1, 1, 1, 1, 1, 1)
  V(freqTree)$label.family <- c(rep("sans",9))
  par(mar = c(0, 0, 0, 0))
  tree = plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
              vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
              vertex.label.cex=1.2, edge.color="black",  edge.width=1,
              layout=layout_as_tree(graph = freqTree, root = 1),
              vertex.size=50)
  
  return(tree)
  
})





output$display_doubleCoinTree_tree_freq = renderPlot({
  
  numCoinTosses = input$doubleCoinTree_coinTosses
  headsProbability = input$doubleCoinTree_headsProbability
  
  coin1Heads            = numCoinTosses * headsProbability
  coin1Heads_coin2Heads = coin1Heads * headsProbability
  coin1Heads_coin2Tails = coin1Heads * (1-headsProbability)
  
  coin1Tails            = numCoinTosses * (1-headsProbability)
  coin1Tails_coin2Heads = coin1Tails * headsProbability
  coin1Tails_coin2Tails = coin1Tails * (1-headsProbability)
  
  e <- c(1, 2, 1, 6, 2, 3, 3, 4, 3, 5, 6, 7, 7, 8, 7, 9)
  v <- c(paste0(numCoinTosses,"\nTosses of Coin 1"),
         paste0(coin1Heads,"\nCoin 1 Heads"),
         paste0(coin1Heads,"\nTosses of Coin 2"),
         paste0(coin1Heads_coin2Heads,"\nCoin 2 Heads"),
         paste0(coin1Heads_coin2Tails,"\nCoin 2 Tails"),
         paste0(coin1Tails,"\nCoin 1 Tails"),
         paste0(coin1Tails,"\nTosses of Coin 2"),
         paste0(coin1Tails_coin2Heads,"\nCoin 2 Heads"),
         paste0(coin1Tails_coin2Tails,"\nCoin 2 Tails"))
  freqTree <- graph(edges=e, n=9, directed=TRUE)
  V(freqTree)$name <- v

  black=COLOUR_PALLETE[1]
  V(freqTree)$color <- c(black,HEADS_COLOUR,black,HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR,TAILS_COLOUR,black,TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
  V(freqTree)$label.font <- c(1, 1, 1, 1, 1, 1, 1, 1, 1)
  V(freqTree)$label.family <- c(rep("sans",9))
  par(mar = c(0, 0, 0, 0))
  tree = plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
              vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
              vertex.label.cex=1.2, edge.color="black",  edge.width=1,
              layout=layout_as_tree(graph = freqTree, root = 1),
              vertex.size=50)

  return(tree)
})