#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Exam Marks Calculation and Interpretation"),
        
        sidebarPanel(
            numericInput('Society Information', 'Insert your Society Information mark in percent', 80,min = 0, max = 100, step = 0.1) ,
            numericInput('Database', 'Insert your Database mark in percent', 97, min = 0, max = 100, step = 0.1),
            numericInput('Foreign Language', 'Insert your Foreign Language mark in percent', 64, min = 0, max = 100, step = 0.1),
            numericInput('Accounting', 'Insert your Accounting mark in percent', 70, min = 0, max = 100, step = 0.1)
        ), 
        mainPanel(
            p('An organization is recruiting for three positions and interested individuals were asked to write four exams in Society Information, Database, Foreign Language and Accounting.'),
            p('The outcome of the four exams was interpreted as follows:'),
            tags$div(
                tags$ul(
                    tags$li('Average <50,       : Failed'),
                    tags$li('Average [50-59] , : Considered for the junior association participateposition'),
                    tags$li('Average [60-69] , : Considered for the association participate position'),
                    tags$li('Average [70-79] , : Considered for the association specialist position'),
                    tags$li('Average [80-89] ,   :Considered for the association manager trainee position'),
                    tags$li('Average >= 90 : Considered for the association manager position')
                )
            ),
            
            h4('Taking into account the values entered by you:'), 
            p('Databases:'), verbatimTextOutput("inputdatabasesmark"),
            p('Data analytics:'), verbatimTextOutput("inputdataAnalyticsmark"),
            p('Project Management:'), verbatimTextOutput("inputprojectmanagementmark"),h4('Your calulated AVERAGE RESULT is:'),
            verbatimTextOutput("estimation"),
            p('It means that you have:'),strong(verbatimTextOutput("diagnostic"))
            
        )
        
    )   
)