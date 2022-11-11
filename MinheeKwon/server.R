#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(rsconnect)
library(dplyr)
library(ggplot2)
library(readr)
library(medicaldata)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot1 <- renderPlotly({
        strep_1 <- strep_tb %>%
            mutate(case_control = ifelse(arm %in% c("Streptomycin"), "Streptomycin", "Placebo")) %>%
            filter(case_control == input$case_control)
        
        # create bar plot
        p1 <- ggplot(data = strep_1,
                     aes(x = rad_num, fill = case_control)) +
            geom_bar() +
            labs(x = "Numeric Rating of Chest X-ray at month 6 (1-6)",
                 y = "Count") +
            guides(fill = guide_legend(title = "Streptomycin VS Placebo")) 

        ggplotly(p1)
    })
    
    output$plot2 <- renderPlotly({
        p2 <- ggplot(data = strep_1,
                     aes(x = gender, fill = case_control)) +
            geom_boxplot() +
            labs(x = "Gender",
                 y = "",
                 title = "Boxplot of numeric rating of Chest X-ray between women and male")
        
        ggplotly(p2)
    })
    
})

