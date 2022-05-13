library(ggplot2)
library(openxlsx)
library(tidyr)


df <- read.xlsx("ResiduosPerCapita.xlsx", sheet = 1, startRow = 12, cols = c(1,2,3))
colnames(df) <- c("Países", "ano_2004", "ano_2018")
df <- df[df$Países == "SE - Suécia" | df$Países == "GR - Grécia" | df$Países == "RO - Roménia", ]
df <- transform(df, "ano_2004" = as.numeric(ano_2004), "ano_2018" = as.numeric(ano_2018))
df_ano <- df %>% pivot_longer(c("ano_2004", "ano_2018"), names_to = "ano", values_to = "Resíduos")
ggplot(df_ano, aes(fill=ano, y=Resíduos, x=Países)) + geom_bar(position="dodge", stat="identity") + 
  ggtitle("Resíduos per Capita")
