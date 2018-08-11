library("shiny")
library("shinyjs")
library("shinydashboard")

gender <- function(x){
  return(switch(substr(x,8,8),
                "1"="남",
                "3"="남",
                "2"="여",
                "4"="여",
                "5"="외",
                "6"="외",
                "잘못된값"
  ))
}

ui <- fluidPage(
  useShinyjs(),
  textInput("text",label = h3("SSN입력"),value="(예시)900101-2"),
  #verbatimTextOutput("value")
  shiny::actionButton("btn","클릭")
)

server=function(input,output,session){
  onclick("btn",info({gender(input$text)}))
}

if (interactive()){
  shiny::shinyApp(ui,server)
}
