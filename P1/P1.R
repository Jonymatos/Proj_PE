library(ggplot2)
library(openxlsx)
library(tidyr)


df <- read.xlsx("ResiduosPerCapita.xlsx", sheet = 1, startRow = 12, cols = c(1,2,3))
colnames(df) <- c("Paises", 2004, 2018)
df <- df[df$Paises == "SE - Suécia" | df$Paises == "GR - Grécia" | df$Paises == "RO - Roménia", ]
df_ano <- df %>% pivot_longer(c("2004", "2018"), names_to = "ano", values_to = "residuos")
ggplot(df_ano, aes(fill=ano, y=residuos, x=Paises)) + geom_bar(position="dodge", stat="identity")
