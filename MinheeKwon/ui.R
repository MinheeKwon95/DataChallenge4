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

shinyUI(
  fluidPage(
    titlePanel("Data Analysis for Streptomycin for Tuberculosis Dataset"),  # Title of the shinyapp
    
    h6("Minhee Kwon"),   
    
    sidebarLayout(                                                
      sidebarPanel( 
        helpText(strong("Data of Streptomycin for TB")),
        helpText("This data set contains reconstructed records of 107 participants with pulmonary tuberculosis. 
                          This is the first modern report of a randomized clinical trial. Patients were treated with streptomycin and
                          control groups were controlled with placebo.
                          While patients on streptomycin often improved rapidly, streptomycin resistance developed, 
                          and many participants relapsed."),
        
        radioButtons(
          inputId = "case_control",
          label = "Streptomycin or Placebo",
          choices = c("Streyptomycin" = "Streptomycin",
                      "Placebo" = "Placebo")),
        h5("Instruction: Select the group for people with treatment (Streptomycin) and control group with Placebo.")                   
      ),
      mainPanel(
        tabsetPanel(
          tabPanel("Plot 1",                                              # Plot 1 & Description
                   plotOutput("plot_1"),
                   h6("This histogram shows the numeric rating of Chest x-ray at month 6 for both patients with treament and control groups.
                                Rating 1- 6 refers to (1_Death, 2_Considerable Deterioration, 3_Moderate_deterioration, 
                                4_No_change, 5_Moderate_improvement, 6_Considerable_improvement).
                                Patients with Streyptomycin 2 grams daily had the highest ratings for considerable improvement.
                                For the control group with placebo, many people died and rated moderate deterioration and moderate improvement.
                                In general, patients with treament with Streyptomycin experienced improvement with treatment.")), 
          
          tabPanel("Plot 2",                                              # Plot 2 & Description
                   plotlyOutput("plot_2"),
                   h6("This boxplot is filtered by case and placebo group for study outcome.
                                In order to see if gender plays an effect on study outcome, compared the outome
                                based on genders. For x-axis: 1=Death, 2=Considerable Deterioration, 3=Moderate deterioration, 
                                4=No change, 5=Moderate improvement, 6=Considerable improvement.
                                There were more variations among female for patient group with treatment than the the variation
                                among male for patient gorup with treatment. In general, both female and male patients improved with Streyptomycin. 
                                The median for male patients were little higher than female for having 6 and 5 accordingly. For the placebo group,
                                both men and women had same median as 3, moderate deterioration.")),
          
          tabPanel("Plot 3",                                              # Plot 3 & Description
                   plotlyOutput("plot_3"),
                   h6("This plot shows if there is improvement between patients with Streyptomycin and control group with placebo.
                                For the patients on streptomycin, there were twice more improvement and it was the opposite for the control group with placebo.
                                We can conclude that the treatment with Streyptomycin is effective for having patients improved with the treatment
                                while the placebo group didn't."))
        )
      )
    )
  )
)


