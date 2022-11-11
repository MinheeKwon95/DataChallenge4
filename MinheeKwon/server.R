#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)
library(medicaldata)
library(tidyverse)
library(dplyr)

## Data Wrangling

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    ## Plot 1
    output$plot_1 <- renderPlot({
        strep_1 <- strep_tb %>% 
            mutate(case_control = ifelse(arm %in% c("Streptomycin"), "Streptomycin", "Placebo")) %>%
            filter(case_control %in% input$case_control)
        
        ggplot(data = strep_1,
               aes(x = rad_num,
                   fill = case_control)) + 
            geom_bar() +
            labs(x = "Numeric Rating of Chest X-ray at month 6",
                 y = "Count",
                 title ="Numeric Rating of Chest X-ray at month 6 for Streptomycin VS Placebo") +
            guides(fill = guide_legend(title = "Streptomycin VS Placebo")) 
        
        #ggplotly(ggplot_plot_1)
        
        
    })
    
    output$plot_2 <- renderPlotly({
        
        # Plot 2
        strep_1 <- strep_tb %>% 
            mutate(case_control = ifelse(arm %in% c("Streptomycin"), "Streptomycin", "Placebo")) %>%
            filter(case_control %in% input$case_control)
        
        ggplot_plot_2 <- ggplot(data = strep_1,
                                aes(x = gender,
                                    y = rad_num,
                                    fill = case_control)) + 
            geom_boxplot() +
            labs(x = "Gender",
                 y = "Numeric Rating of Chest X-ray at month 6",
                 title ="Numeric Rating of Chest X-ray at month 6 for gender") +
            theme(plot.title = element_text(hjust = 0.5))
        ggplotly(ggplot_plot_2)
    })
    
    output$plot_3 <- renderPlotly({
        
        # Plot 3
        strep_1 <- strep_tb %>% 
            mutate(case_control = ifelse(arm %in% c("Streptomycin"), "Streptomycin", "Placebo")) %>%
            filter(case_control %in% input$case_control)
        
        ggplot_plot_3 <- ggplot(data = strep_1,
                                aes(x = improved,
                                    fill = case_control)) + 
            geom_bar() +
            labs(x = "Outcome of improved ratings",
                 y = "Count", 
                 title ="Improved Ratings between Streptomycin VS Placebo") +
            guides(fill = guide_legend(title = "Streptomycin VS Placebo")) 
        
        ggplotly(ggplot_plot_3)
    })
    
})