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
    
    h3(strong("Introduction of dataset")),
    p(
        strong("Summary:"),
        
        "This data set contains reconstructed records of 107 participants with pulmonary tuberculosis. 
        In 1948, collapse therapy (collapsing the lung by puncturing it with a needle) and bedrest in 
        sanitariums were the standard of care. This is the first modern report of a randomized clinical trial. 
        While patients on streptomycin often improved rapidly, streptomycin resistance developed, 
        and many participants relapsed. There was still a significant difference in the death rate between the two arms. 
        A similar effect was seen with PAS, another new therapy for tuberculosis, and the authors rapidly figured out that combination therapy was needed, 
        which was tested in two subsequent trials, which were published in 1952."
    ),
    p(strong("Study Design:"),
      "Prospective, Randomized, Multicenter Placebo-Controlled Clinical Trial"),
    
    p(strong("Codebook:")),
    p(code("patient_id"), "Participant ID"),
    p(code("arm"), "Study Arm, (Streptomycin, Control)"),
    p(code("dose_strep_g"),"Dose of Streptomycin in Grams"),
    p(code("dose_PAS_g"),"Dose of Para-Amino-Salicylate in Grams"),
    p(code("gender"),"Gender (M = Male, F = Female)"),
    p(code("baseline_condition"),"Condition of the Patient at Baseline (1_Good, 2_Fair, 3_Poor)"),
    p(code("baseline_temp"),"Oral Temperature at Baseline (1_98-98.9F, 2_99-99.9F, 3_100-100.9F, 4_100F+)"),
    p(code("baseline_esr"),"Erythrocyte Sedimentation Rate at baseline (1_1-10, 2_11-20, 3_21-50, 4_51+)"),
    p(code("baseline_cavitation"), "Cavitation of the Lungs on chest X-ray at baseline (yes, no)"),
    p(code("strep_resistance"), "Resistance to Streptomycin at 6m (1_sens_0-8, 2_mod_8-99, 3_resist_100+)"),
    p(code("radiologic_6m"),"Radiologic outcome at 6m (1_Death, 2_Considerable Deterioration, 3_Moderate_deterioration, 4_No_change, 5_Moderate_improvement, 6_Considerable_improvement)"),
    p(code("radnum"),"Numeric Rating of Chest X-ray at month 6 (1-6)"),
    p(code("improved"), "Dichotomous Outcome of Improved (TRUE, FALSE)"),
    

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

