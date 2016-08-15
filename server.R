library(shiny)
library(zipcode)
library(ggmap)
data(zipcode)
zip_price_rent <- read.csv(file="Zip_PriceToRentRatio_AllHomes052016.csv")
map<-get_map(location='united states', zoom=4, maptype = "toner", source='google',color='color')
zipmerge <- merge(zip_price_rent, zipcode, by.x="RegionName", by.y="zip")
g <- ggmap(map) + geom_point(aes(x=longitude, y=latitude, show_guide = TRUE, colour=log(as.numeric(1/X2016.05))), data=zipmerge, na.rm=TRUE) +  scale_color_gradient(low="yellow", high="purple")

shinyServer(
  function(input, output) {
    dataInput <- reactive({zipcode[zipcode$zip==input$select,]
    })
    lon <- reactive({zipcode[zipcode$zip==input$select,]$longitude[1]})
    lat <- reactive({zipcode[zipcode$zip==input$select,]$latitude[1]})
    output$oid1 <- renderPrint({dataInput()})
    output$gmap <- renderPlot( {
      #zcor <- dataInput()
      #p <- g + geom_point(aes(x=zcor$longitude[1], y=zcor$latitude[1], size=15), colour=20)
      print(g)
    })
  }
)