library(ggplot2)
library(openxlsx)
library(tidyr)


df <- read.xlsx("ResiduosPerCapita.xlsx", sheet = 1, startRow = 12, cols = c(1,2,3))
colnames(df) <- c("Países", "2004", "2018")
df <- df[df$Países == "SE - Suécia" | df$Países == "GR - Grécia" | df$Países == "RO - Roménia", ]
df_ano <- df %>% pivot_longer(c("2004", "2018"), names_to = "Ano", values_to = "Resíduos")
df_ano <- transform(df_ano, Resíduos = as.numeric(Resíduos))
ggplot(df_ano, aes(fill=Ano, y=Resíduos, x=Países)) + geom_bar(position="dodge", stat="identity") + 
  ggtitle("Resíduos per Capita")

