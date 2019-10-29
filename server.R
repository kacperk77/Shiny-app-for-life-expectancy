################################################################################
# A file including backend code (server) 
################################################################################

shinyServer(function(input, output, session) {
  output$wykres1 <- renderPlot({ 
  
  data <- data %>% 
    filter(healthexppercapita > input$healthexp[1] &
             healthexppercapita < input$healthexp[2] & 
             Schooling > input$schooling[1] &
             Schooling < input$schooling[2] &
             wateraccess > input$wateraccess[1] &
             wateraccess < input$wateraccess[2]) 
    
    ggplot(data = data)+
    geom_bar(aes(x = Status, fill = Status))


    
  })
  output$wykres2 <- renderPlot({
    ggplot(datajoin, aes(x = long, y = lat,
                         group = group, fill = lifeexp))+
      geom_polygon(colour = "black")+
      scale_fill_continuous(low = 'black',
                            high = 'green',
                            guide = 'colorbar')
    
  })
  output$tabela <- renderTable({ data <- data %>% 
    filter(healthexppercapita > input$healthexp[1] &
             healthexppercapita < input$healthexp[2] & 
             Schooling > input$schooling[1] &
             Schooling < input$schooling[2] &
             wateraccess > input$wateraccess[1] &
             wateraccess < input$wateraccess[2]) 
  
  })
  output$wykres3 <- renderPlot({
    ggplot(datajoin, aes(x = long, y = lat,
                         group = group, fill = wateraccess))+
      geom_polygon(colour = "black")+
      scale_fill_continuous(low = 'black',
                            high = 'dodgerblue',
                            guide = 'colorbar')
    
  })
  output$wykres4 <- renderPlot({
    ggplot(datajoin, aes(x = long, y = lat,
                         group = group, fill = Schooling))+
      geom_polygon(colour = "black")+
      scale_fill_continuous(low = 'black',
                            high = 'purple',
                            guide = 'colorbar')
    
  })
  output$wykres5 <- renderPlot({
    ggplot(datajoin, aes(x = long, y = lat,
                         group = group, fill = HIV.AIDS))+
      geom_polygon(colour = "black")+
      scale_fill_continuous(low = 'orange',
                            high = 'black',
                            guide = 'colorbar')
    
  })
  output$wykres6 <- renderPlot({
    ggplot(datajoin, aes(x = long, y = lat,
                         group = group, fill = tuberculosis))+
      geom_polygon(colour = "black")+
      scale_fill_continuous(low = 'firebrick1',
                            high = 'black',
                            guide = 'colorbar')
    
  })
  output$wykres7 <- renderPlot({
    ggplot(datajoin, aes(x = long, y = lat,
                         group = group, fill = healthexppercapita))+
      geom_polygon(colour = "black")+
      scale_fill_continuous(low = 'black',
                            high = 'slateblue1',
                            guide = 'colorbar')
    
  })
  output$wykres8 <- renderPlot({
    ggplot(datajoin, aes(x = long, y = lat,
                         group = group, fill = fertilityrate))+
      geom_polygon(colour = "black")+
      scale_fill_continuous(low = 'lightsalmon',
                            high = 'black',
                            guide = 'colorbar')
    
  })
  output$wykres9 <- renderPlot({
    ggplot(datajoin, aes(x = long, y = lat,
                         group = group, fill = CO2))+
      geom_polygon(colour = "black")+
      scale_fill_continuous(low = 'lawngreen',
                            high = 'black',
                            guide = 'colorbar')
})
  output$wykres10 <- renderPlot({
    ggplot(datajoin, aes(x = long, y = lat,
                         group = group, fill = urbanpopgrowth))+
      geom_polygon(colour = "black")+
      scale_fill_continuous(low = 'lawngreen',
                            high = 'black',
                            guide = 'colorbar')
  })
  
})
