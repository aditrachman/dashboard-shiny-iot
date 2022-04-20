server <- function(input, output) {
  ##dashboard plot
  output$dashboard <- renderPlotly({
    mcn5 <- fg_sum %>%
      
      ggplot(mapping = aes(
        x = Bulan,
        y = total_fg,
        text = glue("Bulan = {Bulan}
                    Total Finish Good = {total_fg}"))) +
      geom_col(aes(fill = Bulan)) +
      geom_line(color = "blue") +
      theme_fivethirtyeight()
    ggplotly(mcn5, tooltip = "text")
    
  })
  
  
  output$mesin5a <- renderPlotly({
    mcn5 <- plot5a %>%
      filter(mingguke1 == input$pilih_minggu1) %>%
      ggplot(mapping = aes(
        x = waktu,
        y = tabel1,
        text = glue("Waktu = {waktu}
                    quantitas = {tabel1}"))) +
      geom_line(group = 1, linetype = "solid") +
      geom_point(color = "blue") +
      theme_fivethirtyeight()
    ggplotly(mcn5, tooltip = "text")
    
  })
  
  output$mesin5b <- renderPlotly({
    mcn5 <- plot5b %>%
      filter(mingguke2 == input$pilih_minggu2) %>%
      ggplot(mapping = aes(
        x = waktu,
        y = tabel1,
        text = glue("Waktu = {waktu}
                    quantitas = {tabel1}"))) +
      geom_line(group = 1, linetype = "solid") +
      geom_point(color = "blue") +
      theme_fivethirtyeight()
    ggplotly(mcn5, tooltip = "text")
    
  })
}