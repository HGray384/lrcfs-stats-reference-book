output$display_doubleCoinTree_tree = renderPlot({
  
  numCoinTosses = input$doubleCoinTree_coinTosses
  headsProbability = input$doubleCoinTree_headsProbability
  
  coin1Heads            = numCoinTosses * headsProbability
  coin1Heads_coin2Heads = coin1Heads * headsProbability
  coin1Heads_coin2Tails = coin1Heads * (1-headsProbability)
  
  coin1Tails            = numCoinTosses * (1-headsProbability)
  coin1Tails_coin2Heads = coin1Tails * headsProbability
  coin1Tails_coin2Tails = coin1Tails * (1-headsProbability)
  
  
  
  e <- c(1, 2, 1, 3, 2, 4, 2, 5, 3, 6, 3, 7)
  v <- c(paste0(numCoinTosses,"\ntosses"),
         paste0(coin1Heads,"\ncoin 1 heads"),
         paste0(coin1Tails,"\ncoin 1 tails"),
         paste0(coin1Heads_coin2Heads,"\ncoin 2 heads"),
         paste0(coin1Heads_coin2Tails,"\ncoin 2 tails"),
         paste0(coin1Tails_coin2Heads,"\ncoin 2 heads"),
         paste0(coin1Tails_coin2Tails,"\ncoin 2 tails"))
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