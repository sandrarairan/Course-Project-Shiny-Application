library(shiny)

# Define UI for dataset viewer app ----
ui <- fluidPage(
        
        # App title ----
        titlePanel("Course Project: Shiny Application and Reproducible Pitch"),
        
        # Sidebar layout with input and output definitions ----
        sidebarLayout(
                
                # Sidebar panel for inputs ----
                sidebarPanel(
                        
                      
                        
                        # Input: Selector for choosing dataset ----
                        selectInput(inputId = "dataset",
                                    label = "Choose a dataset:",
                                    choices = c("mtcars", "pressure", "cars")),
                        
                        # Input: Numeric entry for number of obs to view ----
                        numericInput(inputId = "obs",
                                     label = "Number of observations to view:",
                                     value = 5)
                        
                ),
                
                # Main panel for displaying outputs ----
                mainPanel(
                        
                 tabsetPanel(
                                tabPanel("Documentation", tags$h1("How to use the application"),
                                         tags$i("Selector for choosing dataset and Numeric entry for number of observation to view"),
                                         tags$h3("Select tabPanel View"),
                                         tags$i("Select tabPanel View and return the requested dataset, declaring datasetInput as a reactive expression"),
                                         tags$h3("Select tabPanel Str"),
                                         tags$i("Select tabPanel Str, information about dataset"),
                                         tags$h2("Presentation"),
                                         tags$a(href="https://sandrarairan.github.io/PresentationShinyApplication/#1", "View Prentation!")),
                                     
                                tabPanel("Str", verbatimTextOutput("str")),
                                tabPanel("View", tableOutput("view"))
                        )         
            
                )
        )
)