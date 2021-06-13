options(knitr.graphics.auto_pdf = TRUE)
knitr::opts_chunk$set(
  echo = FALSE,
  message = FALSE,
  warning = FALSE,
  fig.align = 'center',
  out.width = '100%',
  fig.pos = "!ht")

require('jmv')
require('jmvconnect')
require('jmvReadWrite')
require('kableExtra')

jlogo <- function(){
  if(knitr::is_latex_output()){
    x<-'\\jlogo{}'
  } else {
    x<-'<jamovi></jamovi>'
  }
  return(x)
}

infig <- function(img){
  if(knitr::is_latex_output()){
    x<-paste('\\infig{',img,'.pdf}',sep='')
  } else {
    x<-paste('![inline](images/assets/',img,'.svg)',sep='')
  }
  return(x)
}

blueback <- function(txt){
  if(knitr::is_latex_output()){
    x<-paste('\\colorbox{ao}{\\textcolor{white}{',txt,'}}',sep='')
  } else {
    x<-paste('<span class="blueback">',txt,"</span>",sep='')
  }
  return(x)
}

groupbar <-function(txt){
  if(knitr::is_latex_output()){
    x<-paste('\\fcolorbox{gline2}{bar}{\\raisebox{-.25\\zh}{\\includegraphics[height=1\\zh]{images/assets/modules-analyses-arrow-r}}\\textcolor{gmoji2}{| ',txt,'}}',sep='')
  } else {
    x<-paste('<span class="groupbar"><img src="images/assets/modules-analyses-arrow-r.svg" width=10pt/>| ',txt,"</span>",sep='')
  }
  return(x)
}

bgcolor<-'#E6E6E5'

d.cohen<-data.frame(
  'dの値'=c(0.8,0.5,0.2),
  '効果の大きさ' = c('大','中','小')
)

eta.es<-data.frame(
  x=c(0.14,0.06,0.01),
  y = c('大','中','小')
)
names(eta.es)<-c('$\\eta^2$の値','効果の大きさ')

epsilon.es <-eta.es
names(epsilon.es)<-c('$\\varepsilon^2$の値','効果の大きさ')

r.pearson<-data.frame(
  '相関係数の絶対値'=c('0.7 〜 1.0','0.4 〜 0.7','0.2 〜 0.4','0.0 〜 0.2'),
  '相関の強さ' = c('強い相関','中程度の相関','弱い相関','ほぼ相関なし')
)

auc<-data.frame(
  'AUCの値'=c('0.9 〜 1.0','0.7 〜 0.9','0.5 〜 0.7'),
  '判定精度' = c('高','中','低')
)

bayes.bf10 <-data.frame(
  'ベイズ因子'=c('150〜','20〜150','3〜20','1〜3'),
  '根拠としての強さ'=c('非常に強い','強い','肯定的','取るに足りない')
)

alpha.cronbach <-data.frame(
  'アルファの値'=c('0.9〜1.0','0.8〜0.9','0.7〜0.8','0.6〜0.7','0.5〜0.6','0.0〜0.5'),
  '内的一貫性'=c('非常に高い','高い','許容レベル','疑わしい','低い','著しく低い')
)

KMO.interpretation <-data.frame(
  'KMOの値'=c('0.9〜1.0','0.8〜0.9','0.7〜0.8','0.6〜0.7','0.5〜0.6','0.0〜0.5'),
  '解釈'=c('非常に高い','高い','許容レベル','疑わしい','低い','著しく低い')
)
