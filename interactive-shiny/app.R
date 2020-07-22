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
library(tidyverse)
library(ggthemes)
library(kableExtra)

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
source("views/view_likelyhood.R")
source("views/view_doubleCoinToss.R")
source("views/view_doubleCoinTree.R")

ui = function(request) {
  dashboardPagePlus(title=paste0(APP_DEV_SHORT," - ",APP_NAME_SHORT," - v",APP_VER),
                    dashboardHeaderPlus(title = APP_NAME),
                    dashboardSidebar(
                      sidebarMenu(id = "sidebar",
                                  menuItem("Coin Toss", tabName = "tabCoinToss", icon = icon("dashboard")),
                                  menuItem("Tree", tabName = "tabCoinTree", icon = icon("dashboard")),
                                  menuItem("Likelyhood", tabName = "tabLikelyhood", icon = icon("dashboard")),
                                  menuItem("Doube Coin Toss", tabName = "tabDoubleCoinToss", icon = icon("dashboard"),  badgeLabel = "new", badgeColor = "green"),
                                  menuItem("Doube Coin Tree", tabName = "tabDoubleCoinTree", icon = icon("dashboard"),  badgeLabel = "new", badgeColor = "green")
                      ),
                      bookmarkButton(id='bookmarkButton')
                    ),
                    dashboardBody(
                      uiOutput('embedStylesheet'),
                      tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/lrcfs.css")),
                      tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")),
                      tabItems(
                        tabCoinToss,
                        tabCoinTree,
                        tabLikelyhood,
                        tabDoubleCoinToss,
                        tabDoubleCoinTree
                      )
                    ),
                    footer = dashboardFooter(
                      left_text = HTML(paste0("<div class='footerItem'>",APP_NAME," (v",APP_VER,") &copy;",format(Sys.time(), "%Y"),"</div>
                                           <div class='footerItem'><a href='https://www.dundee.ac.uk/leverhulme/'>Developed by ", APP_DEV_SHORT, "</a></div>
                                           <div class='footerItem'><a href='https://www.leverhulme.ac.uk/'>Funded by The Leverhulme Trust</a></div>")),
                      right_text = HTML("<div class='footerLogo'><a href='https://www.dundee.ac.uk/leverhulme/'><img src='images/lrcfs-logo-colour.png'  alt='Visit LRCFS website' /></a></div>
                                            <div class='footerLogo'><a href='https://www.leverhulme.ac.uk'><img src='images/lt-logo-colour.png' alt='Visit The Leverhulme Trust website' /></a></div>")
                    )
  )
}

server = function(input, output,session) {

  # Need to exclude the buttons from themselves being bookmarked
  setBookmarkExclude(c("bookmarkButton"))
  observeEvent(input$bookmarkButton, {
    session$doBookmark()
  })
  
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
  source("models/model_likelyhood.R", local = TRUE)
  source("models/model_doubleCoinToss.R", local = TRUE)
  source("models/model_doubleCoinTree.R", local = TRUE)

}

enableBookmarking(store = "url")
shinyApp(ui, server)