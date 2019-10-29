fluidPage(
  titlePanel("Analysis of the data set"),
  sidebarLayout(
    sidebarPanel("Side panel",
                 sliderInput("healthexp", 
                             label = h3("Health expenditure per capita "),
                             min = 0, 
                             step = 5,
                             max = 6000, 
                             value = c(0, 6000)),
                 sliderInput("schooling", 
                             label = h3("Expected number of years of schooling "),
                             min = 5, 
                             max = 21, value = c(0, 21)),
                 sliderInput("wateraccess", 
                             label = h3("Access to improved water sources (% of total population with access)"),
                             min = 40, 
                             max = 100, value = c(40, 100))
                 
                 
    ),
    mainPanel("Main panel",
              # Tutaj znajdą się elementy panelu głównego
              fluidPage(tabsetPanel(
                          tabPanel('Raw data', tableOutput('tabela')),
                          tabPanel("Status", plotOutput('wykres1')),
                          tabPanel("Life expectancy map", plotOutput('wykres2'), width = '100%'),
                          tabPanel("Water access map", plotOutput('wykres3')),
                          tabPanel("Expected years of education map", plotOutput('wykres4')),
                          tabPanel("HIV/AIDS deaths per 1000 map", plotOutput('wykres5')),
                          tabPanel("Tuberculosis deaths per 100k map", plotOutput('wykres6')),
                          tabPanel("Healthcare expenditure per capita map", plotOutput('wykres7')),
                          tabPanel("Fertility map", plotOutput('wykres8')),
                          tabPanel("CO2 emissions per capita map", plotOutput('wykres9')),
                          tabPanel("Urban population growth map", plotOutput('wykres10'))
                          
                
                          ))
    )
  )
)
