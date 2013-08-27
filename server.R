library(shiny)


shinyServer(function(input,output){

# Bivaraite Normal PDF Plot	
  output$pdf_plot <- renderPlot({

# Parameter definitions from ui.R
mu1 <- input$mu1
mu2 <- input$mu2
sig1 <- input$sigma1
sig2 <- input$sigma2
rho <- input$rho

# Some additional variables for y1-axis and y2-axis 
y1m <- -input$range/2
y1p <- input$range/2
y2m <- -input$range/2
y2p <- input$range/2

y1 <- seq(y1m, y1p, length= as.integer((y1p + abs(y1m)) * input$smooth))  # vector series y1
y2 <- seq(y2m, y2p, length= as.integer((y2p + abs(y2m)) * input$smooth))  # vector series y2

# Pdf function
bivariate <- function(x,y){
	term1 <- 1 / (2 * pi * sig1 * sig2 * sqrt(1 - rho^2))
	term2 <- (x - mu1)^2 / sig1^2
	term3 <- -(2 * rho * (x - mu1)*(y - mu2))/(sig1 * sig2)
	term4 <- (y - mu2)^2 / sig2^2
	z <- term2 + term3 + term4
	term5 <- term1 * exp((-z / (2 *(1 - rho^2))))
	return (term5)
}

# Computes the density values
z <- outer(y1,y2,bivariate)

# Plot it
persp(y1, y2, z, 
     main = bquote(~ bold(mu[1])==.(mu1)~", "~sigma[1]==.(sig1)~", "~mu[2]==.(mu2)~", "~sigma[2]==.(sig2)~", "~rho==.(rho)),cex.main=3,
     zlab="",col="yellow", theta = input$theta, phi = input$phi, r = 10, d = 0.1, 
     expand = 0.5,ltheta = 90, lphi = 180, shade = 0.8, ticktype = "detailed",box=input$box)

  })
  
})


