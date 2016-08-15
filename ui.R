library(shiny)

shinyUI(fluidPage(
  headerPanel("Coursera DDP Project--Rent/price ratio by zipcode"),
  sidebarPanel(
    selectInput("select", label = h3("Select example zipcode"), 
                choices = list("10025" = "10025", "60657" = "60657", "77084" = "77084", "94109"="94109"))
  ),
  mainPanel(
    h3('The zipcode you choose is for:'),
    verbatimTextOutput("oid1"),
    p('The plot is the rent to price ratio by zipcode in May, 2016.'),
    p('Purple means high r/p ratio and yellow means low r/p ratio.'),
    p('I planned to render the blue dot on the map plot with the zip you choose.'),
    p('The difficulty is that I could not extract data from the inside of reactive function.'),
    p('Any suggestion is appreciated.'),
    plotOutput('gmap')
  )
))