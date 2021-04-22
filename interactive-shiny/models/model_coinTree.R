output$display_coinTree_prob = renderPlot({
  numCoinTosses = 1
  headsProbability = input$coinTree_expectedPorbability

  numHeadsCoinTosses = numCoinTosses * headsProbability
  numTailsCoinTosses = numCoinTosses * (1-headsProbability)

  edges <- c(1, 2, 1, 3)
  verts <- c(paste0("Probability of\n",numCoinTosses),
             paste0("Probability of\nHeads\n",numHeadsCoinTosses),
             paste0("Probability of\nTails\n",numTailsCoinTosses))
  black=COLOUR_PALLETE[1]
  colours = c(black,HEADS_COLOUR,TAILS_COLOUR)
  
  return(createBinaryTree(edges,verts,colours))
}, width = IMAGE_WIDTH)

output$display_coinTree_freq = renderPlot({
  totalNumTosses = input$coinTree_numberOfTosses
  expectedPorbability = input$coinTree_expectedPorbability
  
  total = totalNumTosses
  heads = totalNumTosses * expectedPorbability
  tails = totalNumTosses * (1-expectedPorbability)
  
  edges <- c(1, 2, 1, 3)
  verts <- c(paste0(total,"\nTosses"), paste0(heads,"\nHeads"), paste0(tails,"\nTails"))
  black=COLOUR_PALLETE[1]
  colours = c(black, HEADS_COLOUR, TAILS_COLOUR)
  
  return(createBinaryTree(edges,verts,colours))
  
}, width = IMAGE_WIDTH)