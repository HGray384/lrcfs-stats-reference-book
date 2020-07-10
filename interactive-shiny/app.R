#Clear all lists from memory to avoid unintentional errors
rm(list = ls())

#Load required libraries
library(shiny)
library(shinyjs)
library(shinydashboard)
library(shinydashboardPlus)
library(plotly)
library(ggplot2)
library(igraph)

# library(plotly)
# library(riskyr)
# library(waffle)
# library(dplyr)
# library(hrbrthemes)
# library(igraph)
# library(ggthemes)
# library(kableExtra)
# library(tidyverse)
# library(grid)
# library(plyr)
# library(LSD)

#Load a global config file for easy access to application variables (APP_NAME_SHORT, APP_VER etc are set in here)
source("appConfig.R")

#Load any "views" - files that control how the page looks (UI controls)
source("views/view_coinToss.R")
source("views/view_coinTree.R")

ui <- function(request) { 
  dashboardPage(
    dashboardHeader(title = "Stats Book"),
    dashboardSidebar(
      sidebarMenu(id = "sidebar",
                  menuItem("Coin Toss", tabName = "tabCoinToss", icon = icon("dashboard")),
                  menuItem("Tree", tabName = "tabCoinTree", icon = icon("dashboard"),  badgeLabel = "new", badgeColor = "green")
      )
    ),
    dashboardBody(
      tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/lrcfs.css")),
      tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")),
      uiOutput('embedStylesheet'),
      bookmarkButton('bookmarkButton', id="bookmarkButton"),
      tabItems(
        tabCoinToss,
        tabCoinTree
      )
    )
  )
}

server <- function(input, output,session) {

  output$embedStylesheet = renderUI({
    query = getQueryString()
    if("embed" %in% names(query))
    {
      if(query["embed"] == "true")
      {
        tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/embed.css"))
      }
    }
  })
  
  source("models/model_coinToss.R", local = TRUE)
  source("models/model_coinTree.R", local = TRUE)


}
enableBookmarking(store = "url")
shinyApp(ui, server)