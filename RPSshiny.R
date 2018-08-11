library("shiny")
library("shinyjs")
library("shinydashboard")
rps <- function(myVal){
  comVal <- sample(1:3,1,replace=TRUE)
  #경우의 수 
  #가위=1 바위=2 보=3
  #res=myVal - comVal
  #myVal=1일 경우 -1 패 , -2 승리, 0 무승부
  #myVal=2일 경우 1 승리, 0 무승부, -1 패
  #myVal=3일 경우 2 패배, 1 승리, 0 무승부
  # 가능한 숫자 -2,-1,0,1,2
  res<-if(myVal-comVal==0)'비김'else
    if (myVal-comVal==1|myVal-comVal==-2) '이김'else
      if (myVal-comVal==-1|myVal-comVal==2) '짐'
  return(res)
}

ui <- fluidPage(
  useShinyjs(),
  numericInput("myVal","가위바위보",1,min=0,max=2),
  #verbatimTextOutput("value")
  shiny::actionButton("btn","클릭")
)
server=function(input,output,session){
  onclick("btn",info({rps(input$myVal)}))
}

if (interactive()){
  shiny::shinyApp(ui,server)
}
