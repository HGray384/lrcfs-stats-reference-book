output$display_coinTree_prob = renderPlot({
  
  numCoinTosses = 1
  headsProbability = input$coinTree_expectedPorbability
  
  numHeadsCoinTosses = numCoinTosses * headsProbability
  numTailsCoinTosses = numCoinTosses * (1-headsProbability)
  
  edges <- c(1, 2, 1, 3)
  v <- c(paste0("Probability of\n",numCoinTosses),
         paste0("Probability of Heads\n",numHeadsCoinTosses),
         paste0("Probability of Tails\n",numTailsCoinTosses))
  freqTree <- graph(edges=edges, n=3, directed=TRUE)
  V(freqTree)$name <- v
  
  black=COLOUR_PALLETE[1]
  V(freqTree)$color <- c(black,HEADS_COLOUR,TAILS_COLOUR)
  V(freqTree)$label.font <- c(1, 1, 1)
  V(freqTree)$label.family <- c(rep("sans",9))
  par(mar = c(0, 0, 0, 0))
  tree = plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
              vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
              vertex.label.cex=1.2, edge.color="black",  edge.width=1,
              layout=layout_as_tree(graph = freqTree, root = 1),
              vertex.size=50)
  
  return(tree)
  
  
}, width = IMAGE_WIDTH)


output$display_coinTree_freq = renderPlot({
  totalNumTosses = input$coinTree_numberOfTosses
  expectedPorbability = input$coinTree_expectedPorbability
  
  total = totalNumTosses
  heads = totalNumTosses * expectedPorbability
  tails = totalNumTosses * (1-expectedPorbability)
  
  
  
  e <- c(1, 2, 1, 3)
  v <- c(paste0(total,"\nTosses"), paste0(heads,"\nHeads"), paste0(tails,"\nTails"))
  freqTree <- graph(edges=e, n=3, directed=TRUE)
  V(freqTree)$name <- v
  black <- COLOUR_PALLETE[1]
  V(freqTree)$color <- c(black, HEADS_COLOUR, TAILS_COLOUR)
  V(freqTree)$label.font <- c(1, 1, 1)
  V(freqTree)$label.family <- c(rep("sans",3))
  # the commented code below complicates the point
  # V(freqTree)$color <- c(rep(colPal[1], 3), 
  #                        colPal[4], 
  #                        colPal[7],
  #                        colPal[7],
  #                        colPal[4])
  par(mar = c(0, 0, 0, 0))
  plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
       vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
       vertex.label.cex=1.2, edge.color="black",  edge.width=1,
       layout=layout_as_tree(graph = freqTree, root = 1),
       vertex.size=50)
  # legend("bottomright", legend=c("True", "False"),
  #        col=colPal[c(4,7)], bty = "n",
  #        pch=16)
  #par(mar = defMar)
  
}, width = IMAGE_WIDTH)