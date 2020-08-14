output$display_dopingTree_tree = renderPlot({
  # constants for this example
  
  populationSize <- 10000
  
  sensitivity <- input$dopingSensitivity # probability of testing positive given they are doping
  specificity <- input$dopingSpecificity # probability of testing negative given they are not doping
  
  # reactive variables from slider input
  prevalence <- 0.02
  
  doping <- populationSize*prevalence
  
  notDoping <- populationSize-doping
  
  dopingTestPositive <- doping*sensitivity
  dopingTestNegative <- doping-dopingTestPositive
  
  notDopingTestNegative <- notDoping*specificity
  notDopingTestPositive <- notDoping-notDopingTestNegative
  
  
  e <- c(1, 2, 1, 6, 2, 3, 3, 4, 3, 5, 6, 7, 7, 8, 7, 9)
  v <- c(paste0(populationSize,"\nAthletes"),
         paste0(doping,"\nDoping"),
         paste0(doping,"\nDoping Test"),
         paste0(dopingTestPositive,"\nTest Positive"),
         paste0(dopingTestNegative,"\nTest Negative"),
         paste0(notDoping,"\nNot Doping"),
         paste0(notDoping,"\nDoping Test"),
         paste0(notDopingTestPositive,"\nTest Positive"),
         paste0(notDopingTestNegative,"\nTest Negative"))
  freqTree <- graph(edges=e, n=9, directed=TRUE)
  V(freqTree)$name <- v
  
  black=COLOUR_PALLETE[1]
  V(freqTree)$color <- c(black,HEADS_COLOUR,black,HEADS_HEADS_COLOUR,HEADS_TAILS_COLOUR,TAILS_COLOUR,black,TAILS_HEADS_COLOUR,TAILS_TAILS_COLOUR)
  V(freqTree)$label.font <- c(1, 1, 1, 1, 1, 1, 1, 1, 1)
  V(freqTree)$label.family <- c(rep("sans",9))
  par(mar = c(0, 0, 0, 0))
  tree <- plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
               vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
               vertex.label.cex=1.2, edge.color="black",  edge.width=1,
               layout=layout_as_tree(graph = freqTree, root = 1),
               vertex.size=50)
  return(tree)
})
