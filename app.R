#
#
#
# Script is used to build an online resume using Shiny for Chris Selig
#
# 
#
#

# Libraries ----
# Shiny libraries
library(shiny)
library(shinyjs)
library(shinythemes)
library(shinyWidgets)

# Data manipulation libraries
library(tidyverse)

# Plotting libraries
library(plotly)
library(ggthemes)
library(fmsb)

# Read in Data
tools_df <- read_rds("../ShinyResume/02_data/tools_df.rds")
skills_df <- read_rds("02_data/skills_df.rds")
personality_tbl <- read_rds("02_data/personality_tbl.rds")

# Source Scripts
source("01_scripts/scripts.R")


# UI
ui <- fluidPage(

    title = "Shiny Resume for Chris Selig",
    inverse = FALSE,
    collapsible = TRUE,
    
    theme = shinytheme("flatly"),
    
        # CSS ----
        tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
        ),
        
        # JS ----
        shinyjs::useShinyjs(),
    
    # Application UI ----
    fluidRow(
        id = "title_bar",
        titlePanel(title = "Shiny Resume for Chris Selig")
    ),
    

    div(
        # Text Section ----
        column(
            width = 6,
            
            # Description ----
            h3("About Me"),
            p(
                "Broke into the data ninja field through my business intelligence (BI) work with extensive experience gathering requirements and building automated reports and dashboards for multiple industries, including education, insurance, airport security and oil and gas and many different departments, including information technology, finance, vendor management, procurement, health/safety and environment."
            ),
            
            p(
               "Loved that work but wanted to do more so now I have transitioned into advanced analytics and data science where my true passions lie." 
            ),
            
            p(
                "My greatest strength is being a strong communicator and can speak “IT” as well as “business” which is extremely helpful when I need to communicate highly technical material to non-technical audiences."
            ),
            
            br(),
            h3(id = "experience",
                "Experience"),
            
            # Most recent experience ----
            h4("BIDAMIA INC., Calgary, AB	2018 - Present"),
            
            p("Business Intelligence & Advanced Analytics Consultant"),
            p("Development of both Spotfire and Power BI dashboards/reports for clients, provided training to end users, and developed ETL processes using KNIME"),
            
            p(
                class = "subheader",
                "Client: Husky Energy"),
                
            tags$ul(
                tags$li("Using R, completed a text mining analysis of software vendor responses to aid in the selection of an Information Technology Financial Management (ITFM tool)."),
                tags$li("Using R, developed a machine learning model (using XGBoost algorithm) to predict monthly Information Services (IS) expenses"),
                tags$li("Developed a time series forecasting model using seasonal naïve algorithm to quickly forecast Information Service expenses."),
                tags$li("Developed a show back report, using R and Spotfire, that for the first time, enabled the organization for the first time to delve deep into IS IS costs for the business units and to begin rationalizing the environment"),
                tags$li("Created an automated ETL process using KNIME that combined forecast/budget files and loaded to a SQL Server database."),
                tags$li("Using SQL Server, developed a database as a single source of truth for Planning and Controls team. Database provides significant reduction in reporting time as endless spreadsheets no longer need to be compiled for reporting requests from management."),
                tags$li("Development of Spotfire reports, using HTML/CSS to track the costs and status of the project portfolio. Reports used by upper management and CIO."),
            ), 
            
            p(
                class = "subheader",
                "Client: Devon Energy"),
            
            tags$ul(
                tags$li("Provided training sessions for Power BI to various groups within Canada and the US"),
                tags$li("Used R programming language to develop custom visuals within Power BI"),
                tags$li("Provided training sessions on Visualization theory and best practices"),
                tags$li("Facilitated gathering requirements meetings with stakeholders so I could develop Power BI reports")  
            ),
            
            hr(),
            # Second experience ----
            h4("WESTERN FINANCIAL GROUP, Calgary, AB	2017 - 2017"),
            
            p("Business Intelligence Analyst"),
            p("Develop self-service business intelligence and analytics solutions for branches and executive leadership.  Software used:  Cognos Report Studio/Query Studio, Excel, R, Spotfire"),
            
            tags$ul(
                tags$li("Developed an analysis report in Spotfire that allowed management to understand the change in active policies versus the change in revenue for the brokerage."),
                tags$li("Developed an automated Excel/VBA/SQL based model to forecast both revenues and expenses for the branch offices.  The model used a weighted average method to forecast revenue, and significantly reduced time to forecast."),
                tags$li("Developed a Tibco Spotfire based analysis dashboard for executives to show how changes in policy counts related to changes in revenue."),
                tags$li("Developed Cognos Report Studio report to help transition and track 14,000 customers as they move to a new product.  Report also ensured key customers were being contacted about product changes.")  
            ),
            
            hr(),
            # Third experience ----
            h4("GARDAWORLD, Calgary, AB	2016 - 2017"),
            
            p("Data Analyst"),
            p("Tasked to develop more efficient processes, and a database so data analysis and visualization can be performed to gather insights into the business.  Software used:  Excel, Power BI, R"),
            
            tags$ul(
                tags$li("Developed a Power BI training analysis dashboard that visualized various metrics and analytics on the training completed in the region, airports and individual screening officers.  As well, for the first time, visualized the statistics for each training specialist including time spent training, what training was provided and when"),
                tags$li("Through R statistical software, developed an analysis to quantify, and visualize the errors related to data submission from the divisions.  Information was never quantified nor visualized before, and helped focus training initiatives."),
            )
            
        ),
    
        
        # Skill Chart ----
        column(
            width = 3,
            
            # Personality ----
            h4("Personality"),
            div(
                plotOutput(outputId = "personality_plot")
            ),
            
            # Motivators ----
            hr(),
            h4("Motivators"),
            tags$ul(
                tags$li("Cool colleagues that can laugh at/with me"),
                tags$li("Environments where I learn everyday"),
                tags$li("Complex problems to solve")
            ),
            
            # Top Tools ----
            hr(),
            h4("Top Skills"),
            div(
                plotlyOutput(outputId = "skills_plot")
            ),
            
            # Top Skills ----
            hr(),
            h4("Top Tools"),
            div(
                plotlyOutput(outputId = "tools_plot")
            )

        ),
        # Contact Info and Links ----
        column(
            width = 3,
            wellPanel(
                img(class = "img-responsive",src = "me.jpg"),
                br(),
                
                # Contact Links ----
                div(
                    class = "social",
                    a(href = "https://www.linkedin.com/in/chris-selig/",target="_blank", icon('linkedin','fab fa-linkedin social_icons'), style = "color: #2c3e50;"),
                    a(href = "https://github.com/chrisselig",target="_blank", icon("fab fa-github","fab fa-github social_icons"), style = "color: #2c3e50;"),
                    a(href = "mailto:chris.selig@bidamia.ca",target="_blank", icon("envelope","fal fa-envelope float-right social_icons"), style = "color: #2c3e50;")
                ),
                
                # Education
                hr(),
                h4(id = "Education","Education"),  
                
                tags$ul(
                    tags$li('Certificate in Analytics for Data Science, 2020,
                            Institute for Statistics Education'),
                    tags$li('Certificate in Business Intelligence and Analytics, 
                            University of Calgary, AB'),
                    tags$li('Masters of Business Administration (MBA), Finance, 
                            Dalhousie University, Halifax, NS'),
                    tags$li('Bachelor of Arts (BA), Economics, 
                            Acadia University, Wolfville, NS')
                    ),
                
                # Professional Development ----
                hr(),
                h4(id = "prof_development","Professional Development"),  
                
                tags$ul(
                    tags$li('Predictive Web Applications For Business with R, Business Science University, 2019'),
                    tags$li('Business Analysis With R, Business Science University, 2019'),
                    tags$li('Data Science For Business With R: HR Analytics, Business Science University, 2018'),
                    tags$li('Fundamentals of Visualization with Tableau, Coursera, 2017'),
                    tags$li('Intro to Python for Data Science, DataCamp, 2016'),
                    tags$li('Analyzing and Visualizing Data with Power BI, edX, 2016'),
                    tags$li('Excel Modelling Excellence Course, ConocoPhillips, 2015')
                ),
                
                # Blog Posts ----
                hr(),
                h4("Blog Posts"),
                tags$ul(
                    tags$li(a(href = "https://bidamia.ca/post/texas-death-row-inmate-analysis/",'Texas Death Row Inmate Analysis')),
                    tags$li(a(href = "https://bidamia.ca/post/market-basket-analysis/","Market Basket Analysis")),
                    tags$li(a(href = "https://bidamia.ca/post/city-of-toronto-expenditures/", "City of Toronto Expenditures Power BI Dashboard")),
                    tags$li(a(href = "https://bidamia.ca/post/obdurate-movie-review-sentiment-analysis-r/", "Movie Review Sentiment Analysis"))
                )
            )
        )
    )

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    # Plotly Tools Plot ----
    output$tools_plot <- renderPlotly({
        tools_df %>% plot_function()
    })
    
    # Plotly Skills Plot ----
    output$skills_plot <- renderPlotly({
        skills_df %>% plot_function()
    })
    
    # Personality Plot ----
    output$personality_plot <- renderPlot({
        personality_tbl %>% radar_plot()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
