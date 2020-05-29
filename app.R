#################################################################################
# Script is used to generate a shiny app showing google analytics for 
# the website bidamia.ca
# 
#
# Scripted created by Chris Selig June 2020
#
#################################################################################

# 0.1 Libraries ----
# 0.1.1 Shiny Libraries ----
library(shiny)
library(shinyWidgets)
library(shinythemes)
library(shinyjs)

# 0.1.2 Data manipulation libraries
library(tidyverse)
library(lubridate)
library(scales)

# 0.1.3 Plotting/Plot Formatting Libraries ----
library(ggthemes)
library(plotly)

# UI Section ----
ui <- 
    tagList(
        # * CSS ----
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
            tags$link(href="https://fonts.googleapis.com/css?family=Old+Standard+TT:400,700&display=swap", rel="stylesheet")
        ),
        
        # * JS ----
        shinyjs::useShinyjs(),
        
    navbarPage(

        # Title
        title = "Google Analytics Results for bidamia.ca",
        
        collapsible = TRUE,
        
        theme = shinytheme("flatly"),
        
        tabPanel(
            class = "tabPanel",
            "User Geographics"
        ),
        tabPanel(
            class = 'tabPanel',
            "Session Statistics"
        )
    )
)

# SERVER Section ----
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
