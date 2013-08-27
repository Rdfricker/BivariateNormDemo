library(shiny)
               
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Bivariate Normal Distribution"),

  # Sidebar with a slider input for number of observations
  sidebarPanel(
    "DISTRIBUTIONAL PARAMETERS",
    sliderInput("mu1", "Mean of Y1 (mu1):", min = -10, max = 10, value = 0, step=0.5),
    sliderInput("mu2", "Mean of Y2 (mu2):", min = -10, max = 10, value = 0, step=0.5),
    sliderInput("sigma1", "Standard deviation of Y1 (sigma1):", min = 0.5, max = 10, value = 1, step=0.5),
    sliderInput("sigma2", "Standard deviation of Y2 (sigma2):", min = 0.5, max = 10, value = 1, step=0.5),
    sliderInput("rho", "Rho:", min = 0, max = 0.99, value = 0, step=0.01),
    br(), 
    br(),
    "VIEWING CONTROLS",
    checkboxInput("box","Show axes",TRUE),

    sliderInput("theta", "Viewing angle:", min = 0, max = 360, value = 180, step=5),
    sliderInput("phi", "Viewing azmuth:", min = 0, max = 90, value = 45, step=5),    
    sliderInput("range", "Plotting range:", min = 1, max = 30, value = 6, step=1),
    sliderInput("smooth", "Plot smoothing factor:", min = 5, max = 30, value = 10, step=1)     
    ),

  mainPanel(plotOutput("pdf_plot",height="800px"))

))

