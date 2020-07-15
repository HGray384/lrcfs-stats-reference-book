output$display_likelyhood_graph = renderPlotly({
  
  
  
  
  

  gridVals = input$likelyhood_1
  bottom = input$likelyhood_2
  top = input$likelyhood_3
  steps = input$likelyhood_4 
  
  #gridVals <- 100
  prob1 <- prob2 <- seq(bottom, top, by=steps)[-1]
  vars <- expand.grid(prob1, prob2)
  lrDf <- tibble(prob1 = vars$Var1, prob2 = vars$Var2)%>%
    mutate(lr = prob1/prob2)
  
  graph = ggplot(lrDf, aes(x=prob2, y=prob1, fill=lr)) +
    geom_tile(aes(text = paste('Probability of E assuming A is true: ', prob1,
                               '<br>Probability of E assuming B is true:', prob2,
                               '<br>LR: ',lr))) +
    xlab("Probability of E assuming B is true") +
    ylab("Probability of E assuming A is true") +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0)) +
    scale_fill_gradientn(colors = c(COLOUR_PALLETE[7],
                                    COLOUR_PALLETE[2],
                                    "white",
                                    COLOUR_PALLETE[3],
                                    COLOUR_PALLETE[6]),
                         breaks = c(0.01, 0.1, 1, 10, 100),
                         labels = c(0.01, 0.1, 1, 10, 100),
                         name="LR", trans = "log"
                         # values = c(0, 0.4, 
                         #            0.5, 
                         #            0.6, 1)
    )
  
  plotlyGraph = ggplotly(graph, tooltip = "text")
  
  return(plotlyGraph)
  
})