#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

Average_Factor<-function(Society_Information, Database, Foreign_Language, Accounting) {(Society_Information + Database + Foreign_Language + Accounting)/4}

diagnostic_f<-function(Society_Information, Database, Foreign_Language, Accounting){
    Average_value<-(Society_Information + Database + Foreign_Language + Accounting)/4
    ifelse(Average_value<50,"Failed", ifelse(Average_value >=50 & Average_value<60,"Junior Association Participate Position",ifelse(Average_value >= 60 & Average_value < 70 ,"Association Participate Position",ifelse(Average_value>=70 ,"Association Specialist Position", ifelse(Average_value >= 70 & Average_value < 80, "Association Manager Trainee Position", ifelse(Average_value >= 80 & Average_value < 90, "Association Manager Position" )))))
    )}

shinyServer(
    function(input, output) {
        
        output$inputsocietyinformationmark <- renderPrint({input$Society_Information})
        output$inputdatabasesmark <- renderPrint({input$Database})
        output$inputforeignlanguagemark <- renderPrint({input$Foreign_Language})
        output$inputaccountingmark <- renderPrint({input$Accounting})
        output$estimation <- renderPrint({Average_Factor(input$Society_Information,input$Database,input$Foreign_Language,input$Accounting)})
        output$diagnostic <- renderPrint({diagnostic_f(input$Society_Information,input$Database,input$Foreign_Language,input$Accounting)})
    } 
)
