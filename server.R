# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
        
        # Return the requested dataset ----
        # By declaring datasetInput as a reactive expression we ensure
        
        datasetInput <- reactive({
                switch(input$dataset,
                       "mtcars" = mtcars,
                       "pressure" = pressure,
                       "cars" = cars)
        })
        
       
        
        # Generate a summary of the dataset ----
        # The output$summary depends on the datasetInput reactive
        # expression, so will be re-executed whenever datasetInput is
        # invalidated, i.e. whenever the input$dataset changes
        output$str <- renderPrint({
                dataset <- datasetInput()
                str(dataset)
        })
        
        # Show the first "n" observations ----
        # The output$view depends on both the databaseInput reactive
        # expression and input$obs, so it will be re-executed whenever
        # input$dataset or input$obs is changed
        output$view <- renderTable({
                head(datasetInput(), n = input$obs)
        })
        
}

