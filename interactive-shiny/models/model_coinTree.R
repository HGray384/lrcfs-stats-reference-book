output$display_coinTree_tree = renderPlot({
  totalNumTosses = input$coinTree_numberOfTosses
  expectedPorbability = input$coinTree_expectedPorbability
  
  total = totalNumTosses
  heads = totalNumTosses * expectedPorbability
  tails = total - heads
  
  
  
  e <- c(1, 2, 1, 3)
  v <- c(paste0(total,"\ntosses"), paste0(heads,"\nheads"), paste0(tails,"\ntails"))
  freqTree <- graph(edges=e, n=3, directed=FALSE)
  V(freqTree)$name <- v
  
  # the commented code below complicates the point
  # V(freqTree)$color <- c(rep(colPal[1], 3), 
  #                        colPal[4], 
  #                        colPal[7],
  #                        colPal[7],
  #                        colPal[4])
  V(freqTree)$color <- c(rep("red", 3))
  par(mar = c(0, 0, 0, 0))
  plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
       vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
       vertex.label.cex=1.2, edge.color="grey70",  edge.width=2,
       layout=layout_as_tree(graph = freqTree, root = 1),
       vertex.size=50)
  # legend("bottomright", legend=c("True", "False"),
  #        col=colPal[c(4,7)], bty = "n",
  #        pch=16)
  #par(mar = defMar)
  
  
})