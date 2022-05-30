library(ggplot2)
library(openxlsx)

df <- read.xlsx("Utentes.xlsx", sheet = 1)
ggplot(df, aes(x=TAD, y=Idade)) + geom_point() + geom_smooth(method = "loess", formula = "y ~ x") +
  ggtitle("Gráfico dispersão de Utentes")
 
