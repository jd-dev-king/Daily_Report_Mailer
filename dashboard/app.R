library(shiny)
library(plotly)
library(DT)
library(dplyr)
library(readr)


#----------------------------------
# Load Data
#----------------------------------

production <- read_csv(
  "../dashboard_data/production_dashboard.csv"
)


#----------------------------------
# Calculations
#----------------------------------

production <- production %>%

  mutate(

    Yield =
      ((Produced_Units - Rejected_Units)
       /
         Produced_Units) * 100,


    Scrap =
      (Rejected_Units /
         Produced_Units) * 100,


    Availability =
      ((480 - Downtime_Minutes)
       /
         480) * 100,


    OEE =
      Availability *
      (Produced_Units /
         Planned_Units) *
      ((Produced_Units - Rejected_Units)
       /
         Produced_Units)

  )



#----------------------------------
# User Interface
#----------------------------------

ui <- fluidPage(

  titlePanel(
    "Manufacturing Operations Dashboard"
  ),


  sidebarLayout(

    sidebarPanel(

      selectInput(
        "line",
        "Select Production Line:",
        choices=c(
          "All",
          unique(production$Line)
        )

      )

    ),


    mainPanel(

      h3("Production KPIs"),


      fluidRow(

        column(
          3,
          h4("Total Production"),
          textOutput("production")
        ),


        column(
          3,
          h4("Average Yield"),
          textOutput("yield")
        ),


        column(
          3,
          h4("Scrap Rate"),
          textOutput("scrap")
        ),


        column(
          3,
          h4("OEE"),
          textOutput("oee")
        )

      ),


      hr(),


      plotlyOutput(
        "production_plot"
      ),


      plotlyOutput(
        "oee_plot"
      ),


      DTOutput(
        "table"
      )

    )

  )

)



#----------------------------------
# Server
#----------------------------------

server <- function(input, output){


  filtered_data <- reactive({

    if(input$line == "All"){

      production

    }else{

      production %>%
        filter(Line == input$line)

    }

  })



  output$production <- renderText({

    sum(
      filtered_data()$Produced_Units
    )

  })


  output$yield <- renderText({

    paste0(
      round(
        mean(filtered_data()$Yield),
        2
      ),
      "%"
    )

  })


  output$scrap <- renderText({

    paste0(
      round(
        mean(filtered_data()$Scrap),
        2
      ),
      "%"
    )

  })


  output$oee <- renderText({

    paste0(
      round(
        mean(filtered_data()$OEE)*100,
        2
      ),
      "%"
    )

  })



  output$production_plot <- renderPlotly({

    plot_data <-
      filtered_data()


    p <- plot_ly(
      plot_data,
      x=~Date,
      y=~Produced_Units,
      type="scatter",
      mode="lines+markers"
    )


    p

  })



  output$oee_plot <- renderPlotly({

    plot_ly(
      filtered_data(),
      x=~Date,
      y=~OEE,
      type="bar"
    )

  })



  output$table <- renderDT({

    filtered_data()

  })

}


shinyApp(
  ui,
  server
)
