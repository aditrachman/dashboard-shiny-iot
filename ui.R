tags$style("@import url(https://use.fontawesome.com/releases/v5.7.2/css/all.css);")

tags$style(
  "@import url('https://fonts.googleapis.com/css2?family=Comfortaa&display=swap');"
)

dashboardPage(
  skin = "blue",
  dashboardHeader(
    title = strong("T E K N O M E D I K A", style = "font-family: 'Comfortaa', cursive;"),
    titleWidth = 235
  ),
  ##tittle
  
  dashboardSidebar(sidebarMenu(
    ##open sidebar
    menuItem(
      text = "Home",
      tabName = "home",
      icon = icon("home")
    ),
    
    menuItem(
      "MESIN",
      icon = icon("clone"),
      menuSubItem(tabName = "mesin1", "MESIN 1", icon = icon("buffer")),
      menuSubItem("MESIN 2", icon = icon("fill-drip")),
      menuSubItem("MESIN 3", icon = icon("compress")),
      menuSubItem("MESIN 4", icon = icon("grip-lines")),
      menuSubItem(tabName = "mesin5", "MESIN 5", icon = icon("expand-alt")),
      menuSubItem("MESIN 6", icon = icon("sliders-h"))
    ),
    
    menuItem(
      text = "O E E",
      tabName = "oee",
      icon = icon("cogs")
    )
  )),
  ##close sidebar
  
  dashboardBody(tabItems(
    ##body | body 1
    tabItem(
      tabName = "home",
      
      
      valueBox(
        value = 0,
        width = 3,
        subtitle = strong("RP 1011"),
        icon = icon("archive"),
        color = "red"
      ),
      
      valueBox(
        value = "21%",
        width = 3,
        subtitle = strong("RP 2011"),
        icon = icon("archive"),
        color = "blue"
      ),
      valueBox(
        value = "23%",
        width = 3,
        subtitle = strong("RP 8011"),
        icon = icon("truck-loading"),
        color = "green"
      ),
      valueBox(
        value = "90%",
        width = 3,
        subtitle = strong("AIRMED"),
        icon = icon("check-circle"),
        color = "yellow"
      ),
      
      
      fluidRow(column(
        12,
        box(
          width = 12,
          title = "Finish good",
          
          status = "primary",
          solidHeader = TRUE,
          plotlyOutput("dashboard",
                       height = "50vh",
                       width = "100%")
        )
      ))
    ),
    
    tabItem(
      ##mesin5 body
      tabName = "mesin5",
      
      valueBox(
        value = 0,
        
        subtitle = strong("FINISH GOOD"),
        icon = icon("box-open"),
        color = "green"
      ),
      valueBox(
        value = round(rata, digits = 3),
        
        subtitle = strong("PPH"),
        icon = icon("clipboard-list"),
        color = "yellow"
      ),
      valueBox(
        value = 0,
        
        subtitle = strong("REJECT"),
        icon = icon("times-circle"),
        color = "red"
      ),
      
      
      
      fluidRow(column(
        12,
        box(
          width = 12,
          title = "MESIN 5 A",
          
          status = "primary",
          solidHeader = TRUE,
          selectInput(
            inputId = "pilih_minggu1",
            label = "Pilih Minggu",
            choices = unique(plot5a$mingguke1)
          ),
          plotlyOutput("mesin5a",
                       height = "50vh",
                       width = "100%")
        )
      )),
      
      
      fluidRow(column(
        12,
        box(
          width = 12,
          title = "MESIN 5 B",
          
          status = "primary",
          solidHeader = TRUE,
          selectInput(
            inputId = "pilih_minggu2",
            label = "Pilih Minggu",
            choices = unique(plot5b$mingguke2)
          ),
          plotlyOutput("mesin5b",
                       height = "50vh",
                       width = "100%")
        )
      )),
      
    ),
    
    tabItem(
      tabName = "oee",
      ##oee body
      valueBox(
        value = "20%",
        width = 3,
        subtitle = strong("Overall OEE"),
        icon = icon("box-open"),
        color = "red"
      ),
      valueBox(
        value = "21%",
        width = 3,
        subtitle = strong("Availability"),
        icon = icon("archive"),
        color = "blue"
      ),
      valueBox(
        value = "23%",
        width = 3,
        subtitle = strong("Performance"),
        icon = icon("truck-loading"),
        color = "green"
      ),
      valueBox(
        value = "90%",
        width = 3,
        subtitle = strong("Quality"),
        icon = icon("check-circle"),
        color = "yellow"
      ),
      fluidRow(column(4, box(width = 15)),
               column(4, box(width = 15)),
               column(4, box(width = 15))),
      
      
      fluidRow(column(12)),
    ),
    
    
    
    tabItem(
      tabName = "mesin1",
      ##oee body
      valueBox(
        tags$p(style = "font-size: 100%", style =
                 "font-weight: bold"),
        
        subtitle = div(img(
          src = "logo.png",
          height = "38",
          width = "38",
          
        ), style = "text-align: right;"),
        color = "blue",
        width = 3,
        
      )
    )
    
  ))
)
