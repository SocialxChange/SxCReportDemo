function(input, output) {
# Definimos valores de los botones con total donantes y total donaciones  
  output$cuantas <- renderValueBox({
    valueBox(
      value = sum(Proyectos2016$nDonaciones),
      subtitle = "Total donantes",
      icon = icon("users")
    )
  })
# Valor del total de donaciones  
  output$cuanto <- renderValueBox({
    valueBox(
      value = round(sum(Proyectos2016$total),digits=0),
      subtitle = "Total donaciones (Millones)",
      icon = icon("hand-holding-usd", lib = "font-awesome")
    )
  })
# Definimos el grafico de burbujas  
  output$burbujas <- renderBubbles({
    df<-filter(MetricasComuna[,c(1,3)], MetricasComuna$comuna %in% input$comunas)
    
    bubbles(df$pobrezaMult, df$comuna, color=rainbow(nrow(df), alpha = NULL), textColor = "#FFFFFF")
  })
# Definimos la tabla del home  
  output$tabla <- renderDataTable(filter(Proyectos2016[,c(1,4,7:10)], Proyectos2016$Comuna %in% input$comunas & Proyectos2016$categoria %in% input$categorias))
# Definimos la tabla del comparador que es llamada igual que el tab donde está
  output$comparador<-renderDataTable(Proyectos2016)
                                     
  }