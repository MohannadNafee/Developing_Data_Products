library(shiny)

shinyUI(fluidPage(
        titlePanel(h4("Body Mass Index Calculator")),
        sidebarLayout(
                sidebarPanel(
                        helpText("BMI Index is common measure for health, this application helps you find it out"),
                        br(),
                        numericInput("weight_kg",label = h4("How much do you weight (KG)"),"", min=40, max=300),
                        br(),
                        numericInput("height_cm",label = h4("What is your height (CM)"),"", min=50, max=250),
                        br(),
                        br(),
                        actionButton("FindBMI", label = "Calculate my BMI")
                ),
                mainPanel(
                        tabsetPanel(
                                tabPanel("Find out you BMI",
                                         p(h4("Here are your current measures:")),
                                         textOutput("current_height"),
                                         textOutput("current_weight"),
                                         br(),
                                         br(),
                                         p(h4("Your BMI is displayed below:")),
                                         textOutput("BMI_result"),
                                         p(h4("Your BMI classification is:")),
                                         textOutput("status_indicator")
                                ),
                                tabPanel("Important to Know",
                                         
                                         p(h4("Body Mass Index Application")),
                                         br(),
                                         helpText("This simple application calculates a person BMI based on current weight and height"),
                                         p(h3("Why is BMI important?")),
                                         helpText("BMI tells you if you weight is normal, underweight or overweight is a common measure                                           used by doctor to have a parameter about a person health")
                                )
                        )
                )
        )
))