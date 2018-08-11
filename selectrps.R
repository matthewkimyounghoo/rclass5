library(shiny)
RPS <- function(myVal){
  comVal <- sample(c("가위",'바위','보'),1,replace=TRUE)
  res <- if(myVal==comVal)'비김'else
    if(myVal=='가위'& comVal=='바위')'짐'else
      if(myVal=='가위'& comVal=='보')'이김'else
        if(myVal=='바위'& comVal=='가위')'이김'else
          if(myVal=='바위'& comVal=='보') '짐'else
            if(myVal=='보' & comVal=='주먹') '이김'else
              if(myVal=='보'& comVal=='가위') '짐'
  return(res)
}

ui <- fluidPage(
  titlePanel("가위바위보"),
  sidebarLayout(
    sidebarPanel(
      helpText("셀렉트박스에서 선택하세요"),
      selectInput("myVal", 
                  label = "가위바위보 게임",
                  choices = c("가위", 
                              "바위",
                              "보"),
                  selected = "가위")
    ),
    mainPanel(
      textOutput("selected_var")
    )
  )
)
server <- function(input, output) {
  output$selected_var <- renderText({ 
    paste("경기결과 :: ", RPS(input$myVal))
  })
}
if (interactive()) {
  shiny::shinyApp(ui,server)
}
