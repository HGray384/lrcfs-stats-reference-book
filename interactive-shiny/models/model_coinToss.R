##### Global Vars for updating in real time ######
myTosses <<- vector()
dfAllTosses <<- data.frame()
##################################################

observeEvent(input$coinToss_resetTotals, {
  myTosses <<- vector()
  dfAllTosses <<- data.frame()
})

GetCoinTosses = reactive({
  input$coinToss_rerunCoinToss
  headsProbabilty = input$coinToss_headsProbabilty
  coin = c("heads","tails") #Create the coin object for tossing
  sideProbabilites = c(headsProbabilty,1-headsProbabilty) #Define the probabilities of each side of the coin
  numberOfTosses = input$coinToss_numberOfTosses #Specify the number of coin tosses
  
  #Do our coin tosses
  tosses = sample(coin, size=numberOfTosses, replace=TRUE, prob=sideProbabilites)
})







#Display trees
output$display_coinToss_treeProb = renderPlot({
  
  numCoinTosses = 1
  headsProbability = input$coinToss_headsProbabilty
  
  numHeadsCoinTosses = numCoinTosses * headsProbability
  numTailsCoinTosses = numCoinTosses * (1-headsProbability)
  
  e <- c(1, 2, 1, 3)
  v <- c(paste0("Probability of\n",numCoinTosses),
         paste0("Probability of\nHeads\n",numHeadsCoinTosses),
         paste0("Probability of\nTails\n",numTailsCoinTosses))
  black=COLOUR_PALLETE[1]
  c <- c(black,HEADS_COLOUR,TAILS_COLOUR)
  
  return(createBinaryTree(e,v,c))
})

output$display_coinToss_treeExp = renderPlot({
  totalNumTosses = input$coinToss_numberOfTosses
  expectedPorbability = input$coinToss_headsProbabilty
  
  total = totalNumTosses
  heads = totalNumTosses * expectedPorbability
  tails = totalNumTosses * (1-expectedPorbability)
  
  e <- c(1, 2, 1, 3)
  v <- c(paste0(total,"\nTosses"), paste0(heads,"\nHeads"), paste0(tails,"\nTails"))
  black <- COLOUR_PALLETE[1]
  c <- c(black, HEADS_COLOUR, TAILS_COLOUR)
  
  return(createBinaryTree(e,v,c))
})

output$display_coinToss_treeSample = renderPlot({
  numberOfTosses = input$coinToss_numberOfTosses
  expectedPorbability = input$coinToss_headsProbabilty
  
  coinTosses = GetCoinTosses()
  
  #Get the number of occurrences of each side of the coin toss
  results = table(coinTosses)
  headsOccur  = results["heads"]
  tailsOccur = results["tails"]

  e <- c(1, 2, 1, 3)
  v <- c(paste0(numberOfTosses,"\nTosses"), paste0(headsOccur,"\nHeads"), paste0(tailsOccur,"\nTails"))
  black <- COLOUR_PALLETE[1]
  c <- c(black, HEADS_COLOUR, TAILS_COLOUR)
  return(createBinaryTree(e,v,c))
})















output$display_coinToss_tossResultsWaffle = renderUI({
  input$coinToss_rerunCoinToss
  
  numberOfTosses = input$coinToss_numberOfTosses
  
  coinTosses = GetCoinTosses()
  
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
  return(HTML(output))
  
})

output$display_coinToss_plotlyGraph = renderPlotly({
  input$coinToss_rerunCoinToss
  
  numberOfTosses = input$coinToss_numberOfTosses #Specify the number of coin tosses
  
  coinTosses = GetCoinTosses()
  
  #Get the number of occurrences of each side of the coin toss
  results = table(coinTosses)
  headsOccur  = cumsum(coinTosses == "heads") / 1:numberOfTosses
  tailsOccur = 1-headsOccur
  dfHeadsOccur = data.frame(headsOccur)
  
  ggplotGraph = ggplot(dfHeadsOccur, aes(x=1:numberOfTosses)) + 
    geom_line(aes(y = headsOccur, text=lapply(paste0('<b>Sample proportion of heads:</b>', headsOccur), HTML)), color = HEADS_COLOUR) + 
    geom_line(aes(y = tailsOccur, text=lapply(paste0('<b>Sample proportion of tails:</b>', tailsOccur), HTML)), color = TAILS_COLOUR) + 
    geom_line(aes(y = 0.5), color="steelblue", linetype="dash") +
    xlim(0, numberOfTosses) +
    ylim(0,1) +
    xlim(0,500) +
    ylab("Sample proportion") +
    xlab("Coin Tosses")
  
  ggplotly(ggplotGraph, tooltip="text") %>% layout(hovermode = "x unified")
})

output$display_coinToss_tossResultsPie = renderPlot({
  input$coinToss_rerunCoinToss
  
  numberOfTosses = input$coinToss_numberOfTosses
  
  colours = c("Heads","Tails")
  
  coinTosses = GetCoinTosses()
  coinTossesOverall = table(coinTosses)
  dfCoinTossesOverall = data.frame(coinTossesOverall)
  
  ggplot(dfCoinTossesOverall, aes(x = coinTosses, y = Freq, fill = colours)) +
    geom_bar(stat="identity") +
    theme(legend.position='none') +
    scale_fill_manual(values = c("Heads" = HEADS_COLOUR, "Tails" = TAILS_COLOUR)) +
    ylab("Total number of occurrences") +
    xlab("Side of Coin")
  
})

output$display_coinToss_overalWhisker = renderPlot({
  input$coinToss_rerunCoinToss
  input$coinToss_resetTotals
  numberOfTosses = input$coinToss_numberOfTosses
  coinTosses = GetCoinTosses()
  
  results = table(coinTosses)
  headsOccur  = cumsum(coinTosses == "heads") / 1:numberOfTosses
  
  latestToss = data.frame(
    tosses = numberOfTosses,
    headsProbabilty = headsOccur[numberOfTosses]
  )
  
  dfAllTosses <<- rbind(dfAllTosses, latestToss)
  
  ggplot(dfAllTosses, aes(x=tosses, y=headsProbabilty, group=tosses)) + 
    geom_boxplot() +
    ylim(0,1) +
    ylab("Sample proportion of Heads") +
    xlab("Number of coin tosses")
})