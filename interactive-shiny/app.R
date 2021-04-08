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
library(learnr)

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
source("appHelpers.R")

#Load any "views" - files that control how the page looks (UI controls)
source("views/view_home.R")
source("views/view_coinToss.R")
source("views/view_coinTree.R")
source("views/view_likelyhood.R")
source("views/view_doubleCoinToss.R")
source("views/view_doubleCoinTree.R")
source("views/view_diseaseTest.R")
source("views/view_dopingTest_probabilities.R")
source("views/view_dopingTest_likelihoodRatio.R")
# source("views/view_propLevel.R")
source("views/view_lrCalc.R")

ui = function(request) {
  dashboardPagePlus(title=paste0(APP_DEV_SHORT," - ",APP_NAME_SHORT," - v",APP_VER),
                    dashboardHeaderPlus(title = paste0(APP_DEV_SHORT," - ",APP_NAME_SHORT)),
                    dashboardSidebar(
                      sidebarMenu(id = "sidebar",
                                  
                                  menuItem('Home', tabName ="tabHome", icon = icon('home')),

                                  menuItem('Coin Toss', icon = icon('coins'),
                                           menuItem("Single Toss Probabilities", tabName = "tabCoinTree", icon = icon("coins")),
                                           menuItem("Double Toss Probabilities", tabName = "tabDoubleCoinTree", icon = icon("coins")),
                                           menuItem("Single Toss Samples", tabName = "tabCoinToss", icon = icon("coins")),
                                           menuItem("Double Toss Samples", tabName = "tabDoubleCoinToss", icon = icon("coins"))
                                           ),
                                  
                                  menuItem("Disease Test", tabName = "tabDiseaseTest", icon = icon("capsules")),
                                  
                                  menuItem('Doping Test', icon = icon('prescription-bottle'),
                                           menuItem('Probabilities', tabName = 'tabDopingTest_probabilities',icon = icon('prescription-bottle')),
                                           menuItem('Likelihood Ratio', tabName = 'tabDopingTest_likelihoodRatio', icon = icon('prescription-bottle'))
                                  ),
                                  
                                  # menuItem("Propositions", tabName = "tabPropLevel", icon = icon("comment")),
                                  
                                  menuItem("Likelihood ratio",  icon = icon("divide"),
                                           menuItem("LR Visualisation", tabName = "tabLikelyhood", icon = icon("divide")),
                                           menuItem("LR Calculator", tabName = "tabLRCalc", icon = icon("divide"))
                                           )
                                  
                      ),
                      bookmarkButton(id='bookmarkButton')
                    ),
                    dashboardBody(
                      uiOutput('embedStylesheet'),
                      tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/lrcfs.css")),
                      tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")),
                      tabItems(
                        tabHome,
                        tabCoinToss,
                        tabCoinTree,
                        tabLikelyhood,
                        tabDoubleCoinToss,
                        tabDoubleCoinTree,
                        tabDiseaseTest,
                        tabDopingTest_probabilities,
                        tabDopingTest_likelihoodRatio,
                        tabPropLevel,
                        tabLRCalc
                      )
                    ),
                    footer = dashboardFooter(
                      left_text = HTML(paste0("<div class='footerItem'>",APP_NAME," (v",APP_VER,") &copy;",format(Sys.time(), "%Y"),"</div>
                                           <div class='footerItem'><a href='https://www.dundee.ac.uk/leverhulme/'>Developed by ", APP_DEV_SHORT, "</a></div>
                                           <div class='footerItem'>Funded by <a href='https://www.leverhulme.ac.uk/'>The Leverhulme Trust</a> and the David And Claudia Harding Foundation</div>")),
                      right_text = HTML("<div class='footerLogo'><a href='https://www.dundee.ac.uk/leverhulme/'><img src='images/lrcfs-logo-colour.png'  alt='Visit LRCFS website' /></a></div>
                                            <div class='footerLogo'><a href='https://www.leverhulme.ac.uk'><img src='images/lt-logo-colour.png' alt='Visit The Leverhulme Trust website' /></a></div>")
                    )
  )
}

server = function(input, output,session) {
  
  output$embedStylesheet = renderUI({ 
    query = getQueryString()
    if("embed" %in% names(query) && query["embed"] == "\"TRUE\"")
    {
      tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "css/embed.css"))
    }
  })

  # Need to exclude the buttons from themselves being bookmarked
  setBookmarkExclude(c("bookmarkButton"))
  observeEvent(input$bookmarkButton, {
    session$doBookmark()
  })

  source("models/model_coinToss.R", local = TRUE)
  source("models/model_coinTree.R", local = TRUE)
  source("models/model_likelyhood.R", local = TRUE)
  source("models/model_doubleCoinToss.R", local = TRUE)
  source("models/model_doubleCoinTree.R", local = TRUE)
  source("models/model_diseaseTest.R", local = TRUE)
  source("models/model_dopingTest.R", local = TRUE) #common variables for dopingTest
  source("models/model_dopingTest_probabilities.R", local = TRUE)
  # source("models/model_propLevel.R", local = TRUE)
  source("models/model_dopingTest_likelihoodRatio.R", local = TRUE)
  source("models/model_lrCalc.R", local = TRUE)
}

enableBookmarking(store = "url")
shinyApp(ui, server)