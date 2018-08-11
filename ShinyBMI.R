library(shiny)
bmi <- function(t,w){
  res <- w%/%((t/100)^2)
  return(if (res>=18.5 & res<=22.9) '정상' else
    if (res>=35) '고도비만' else
      if (res>=30 & res<35) '중증도 비만' else
        if (res>=25 & res<30) '경도 비만' else
          if (res>=23 & res<=24.9) '과체중' else
            if (res<18.5) '저체중')
}

server <- function(inout,output){
  output$val <- bmi(input$t,input$w)
}
ui <- pageWithSidebar(
  headerPanel("BMI 계산기"),
  sidebarPanel(),
  mainPanel()
)
shinyApp(ui,server)