## a file containing useful helper functions

#Check to see if output is a "dynamic" format
#Returns TRUE if output is dynamic
isDynamicOutput = function()
{
  return(knitr:::pandoc_to() == "html")
}

getInteractiveLink = function(tabName = NULL, parentTabName = NULL, embed = FALSE)
{
  #If we don't have a tab name then just use the host
  if(is.null(tabName))
  {
    url = SHINY_HOST
  }else{
    url = paste0(SHINY_HOST,'/?_inputs_&sidebar=%22',tabName)
    
    if(!is.null(parentTabName))
    {
      url = paste0(url,'%22&sidebarItemExpanded=%22',parentTabName,'%22')
    }
    
    if(embed)
    {
      url = paste0(url,'%22&embed=%22',embed,'%22')
    }
  }
  return(url)
}

createBinaryTree = function(edges, verts, fontWeights = c(rep(1,length(verts))), fontSize = 1.2, plotMargins = c(0, 0, 0, 0)){
  par(mar = plotMargins)
  freqTree = graph(edges=edges, n=length(verts), directed=FALSE)
  V(freqTree)$name = verts
  V(freqTree)$color = c(rep(colPal[1], length(verts)))
  V(freqTree)$label.font = fontWeights
  V(freqTree)$label.family = c(rep("sans",length(verts)))
  
  tree = plot(freqTree, vertex.shape="none", vertex.label=V(freqTree)$name,
              vertex.label.color=V(freqTree)$color, vertex.label.font=V(freqTree)$label.font,
              vertex.label.cex=fontSize, edge.color="grey70",  edge.width=1,
              layout=layout_as_tree(graph = freqTree, root = 1),
              vertex.size=50)
  par(mar = defMar) # reset back to default margins
}

source("./code/server-config.R", local = TRUE)