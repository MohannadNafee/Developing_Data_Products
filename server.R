library(shiny)
shinyServer(function(input,output){
        results<- reactiveValues()
        observe({
                input$FindBMI
                results$bmi <- isolate({
                input$weight_kg/(input$height_cm/100 * input$height_cm/100)
                })
        })
        output$current_height<- renderText({
                if(input$FindBMI == 0) ""
                else{
                input$FindBMI
                paste("Current Height in CM: ", isolate(input$height_cm))
                }
        })        
        output$current_weight<- renderText({
                if(input$FindBMI == 0) ""
                else{
                        input$FindBMI
                        paste("Current Weight in KG : ", isolate(input$weight_kg))
                }
        })
        output$BMI_result<- renderText({
                if(input$FindBMI == 0) ""
                else{
                        paste("Your current BMI is:",round(results$bmi,2))
                }
        })
        output$status_indicator<- renderText({
                if(input$FindBMI == 0) ""
                else {
                        if (results$bmi < 18.5) {
                                results$status_indicator = "Underweight"
                        }
                        else if (results$bmi < 24.9) {
                                results$status_indicator="Normal weight"
                        }
                        else if (results$bmi < 29.9) {
                                results$status_indicator="Overweight"
                        }
                                else {
                                        results$status_indicator="Obesity"
                        }
                        paste("Classification according to BMI: ", results$status_indicator)
                } 
        })
})