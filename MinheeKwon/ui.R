#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Data Analysis for Streptomycin for TB Dataset"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1")
        )
    )
))

shinyUI(navbarPage(
    "Page title",   
    tabPanel("panel 1", "one"),
    tabPanel("panel 2", "two"),
    tabPanel("panel 3", "three"),
    navbarMenu("subpanels", 
               tabPanel("panel 4a", "four-a"),
               tabPanel("panel 4b", "four-b"),
               tabPanel("panel 4c", "four-c")
    )
))
