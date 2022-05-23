library(ggplot2)
library(openxlsx)

df <- read.xlsx("Utentes.xlsx", sheet = 1)
ggplot(df, aes(x=Idade, y=TAD)) + geom_point() + 
  ggtitle("Gráfico dispersão de Utentes")
 
