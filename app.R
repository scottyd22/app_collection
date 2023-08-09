library(tidyverse)
library(shiny)

ui <- fluidPage(
  title = "Scott Davis App Collection", 
  
# css ----
  tags$style(
  'body {
     max-width: 70% !important;
     margin-left: 15%;
     margin-right: auto;
     background-color: #F9F8F8;
   }

   * {font-family: Source Sans Pro;}

   .card {
     /* Add shadows to create the "card" effect */
     box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
     transition: 0.3s;
     padding: 5px 16px;
     background-color: #FFF;
   }

    /* On mouse-over, add a deeper shadow */
    .card:hover {
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.7);
      transform: scale(1.025); 
    }'
  ),
  
  # google font ----
  HTML("<style>
        @import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap');
        </style>"
  ),
  
  # font awesome icons ----
  HTML('<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" 
  rel="stylesheet"  type="text/css">'),
  
  br(),
  br(),
  uiOutput('header'),
  br(), 
  uiOutput('gif'),
  fluidRow(
    column(6, style = 'padding-top: 10px;',
           uiOutput('rlately')),
    column(6, style = 'padding-top: 10px;',
           uiOutput('dreamteam'))
    ),
  fluidRow(
    column(6, style = 'padding-top: 10px;',
           uiOutput('theoffice')),
    column(6, style = 'padding-top: 10px;',
           uiOutput('nbafinals'))
  ),
  br(),
  br(),
  br(),
  br(),
  br(),
  br()
  
)

server <- function(input, output, session) {
  
  # header ----
  output$header = renderUI({
    
    # headshot = '<img src = "headshot2.png" width = "150px" style="border-radius: 50%;">'
    headshot = '<img src = "headshot_2023_color.jpg" width = "150px" style="border-radius: 5%;">'
    
    welcome = "<h1><b>Scott Davis' App Collection</b></h1><h4><br>Thanks for stopping by to check out my collection of Shiny apps!<br>All are hosted on <a href='https://www.shinyapps.io/' target='_blank'>shinyapps.io <i class='fa fa-external-link'></i></a>.<br>
    <br>Click on a link below to launch the app or its associated GitHub repo.<br>
    </h4>"
    
    social = '<a href="https://twitter.com/scottyd22" target="_blank" style="font-size: 180%;"><i class="fa fa-twitter"></i></a> 
          &nbsp;&nbsp;<a href="https://www.linkedin.com/in/sadavis05/" target="_blank" style="font-size: 180%;"><i class="fa fa-linkedin"></i></a> 
          &nbsp;&nbsp;<a href="https://github.com/scottyd22" target="_blank" style="font-size: 180%;"><i class="fa fa-github"></i></a> 
          &nbsp;&nbsp;<a href="https://datascott.com/" target="_blank" style="font-size: 180%;"><i class="fa fa-globe"></i></a>'
    
    HTML(paste0('<div style="display: inline-block; vertical-align: top; margin-right: 10px;">', headshot, '<br><span style="margin-left: 20px;">', social, '</span></div>',
                '<div style="display: inline-block; vertical-align: top;">', welcome, '<br>', '</div>'
                ))
    
  })
  
  # show gif ----
  output$gif = renderUI({
    checkboxInput('gif', 'Show GIFs', value = F)
  })
  
  # r lately ----
  output$rlately = renderUI({
    
    title = 'R Lately'
    message = 'Consolidates some of my favorite resources for new R content into one location.'
    
    if(input$gif == T) {
      image = 'https://user-images.githubusercontent.com/16120874/178642745-56947340-b1e6-483f-a6a7-155a76e652c8.gif'
    } else {
      image = 'https://github.com/scottyd22/app_collection/blob/main/www/rlately_static.PNG?raw=true'
    }
    
    HTML(
      paste0(
        '<div class="card">',
        '<a href="https://sdavis.shinyapps.io/r_lately" target="_blank"><h3 style="display: inline-block;"><b>', title, '</b></h3> <i class="fa fa-external-link" style="display: inline-block;"></i></a>',
        '<p>', message, '</p>',
        '<center>',
        '<img src="', image, '" width="100%">',
        '<br><br>',
        '<a href="https://github.com/scottyd22/r-lately" target="_blank"><i class="fa fa-github" style="font-size: 150%;"></i> <p style="display: inline-block;">scottyd22/r_lately </p> &nbsp;<i class="fa fa-external-link" style="display: inline-block;"></i></a>',
        '</center>',
        '<br>',
        '</div>'
      )
    )
    
  })
  
  # dream team ----
  output$dreamteam = renderUI({
    
    title = 'Dream Team'
    message = 'A scrollytelling article about the 1992 Dream Team.'
    
    if(input$gif == T) {
      image = 'https://raw.githubusercontent.com/scottyd22/dream_team/master/www/Scrollytell%20GIF-downsized_large.gif'
    } else {
      image = 'https://github.com/scottyd22/app_collection/blob/main/www/dreamteam_static.PNG?raw=true'
    }
    
    HTML(
      paste0(
        '<div class="card">',
        '<a href="https://sdavis.shinyapps.io/dream_team/" target="_blank"><h3 style="display: inline-block;"><b>', title, '</b></h3> <i class="fa fa-external-link" style="display: inline-block;"></i></a>',
        '<p>', message, '</p>',
        '<center>',
        '<img src="', image, '" width="100%">',
        '<br><br>',
        '<a href="https://github.com/scottyd22/dream_team" target="_blank"><i class="fa fa-github" style="font-size: 150%;"></i> <p style="display: inline-block;">scottyd22/dream_team </p> &nbsp;<i class="fa fa-external-link" style="display: inline-block;"></i></a>',
        '</center>',
        '<br>',
        '</div>'
      )
    )
    
  })
  
  # the office ----
  output$theoffice = renderUI({
    
    title = 'The Office Trivia'
    message = 'Test your knowledge of the popular TV series <i>The Office</i> (U.S. version) with this mobile-friendly trivia app.'
    
    if(input$gif == T) {
      image = 'https://media.giphy.com/media/f4knVmpNNtlhykXUlF/giphy.gif'
    } else {
      image = 'https://github.com/scottyd22/the_office/blob/master/www/iphone.PNG?raw=true'
    }
    
    HTML(
      paste0(
        '<div class="card">',
        '<a href="https://sdavis.shinyapps.io/the_office/" target="_blank"><h3 style="display: inline-block;"><b>', title, '</b></h3> <i class="fa fa-external-link" style="display: inline-block;"></i></a>',
        '<p>', message, '</p>',
        '<center>',
        '<img src="', image, '" width="23%">',
        '<br><br>',
        '<a href="https://github.com/scottyd22/the_office" target="_blank"><i class="fa fa-github" style="font-size: 150%;"></i> <p style="display: inline-block;">scottyd22/the_office </p> &nbsp;<i class="fa fa-external-link" style="display: inline-block;"></i></a>',
        '</center>',
        '<br>',
        '</div>'
      )
    )
    
  })
  
  # nba finals ----
  output$nbafinals = renderUI({
    
    title = '2018 NBA Finals'
    message = 'Interactively explore all four games of the 2018 NBA Finals.'
    
    if(input$gif == T) {
      image = 'https://media.giphy.com/media/Ru8JbDNZXtyN2o2RpA/giphy.gif'
    } else {
      image = 'https://github.com/scottyd22/app_collection/blob/main/www/nbafinals_static.PNG?raw=true'
    }
    
    HTML(
      paste0(
        '<div class="card">',
        '<a href="https://sdavis.shinyapps.io/nba_finals/" target="_blank"><h3 style="display: inline-block;"><b>', title, '</b></h3> <i class="fa fa-external-link" style="display: inline-block;"></i></a>',
        '<p>', message, '</p>',
        '<center>',
        '<img src="', image, '" width="100%">',
        '<br><br>',
        '</center>',
        '<br><br><br>',
        '</div>'
      )
    )
    
  })
  
}

shinyApp(ui, server)