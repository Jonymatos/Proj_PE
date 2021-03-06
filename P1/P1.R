library(ggplot2)
library(openxlsx)
library(tidyr)


df <- read.xlsx("ResiduosPerCapita.xlsx", sheet = 1, startRow = 12, cols = c(1,2,3))
colnames(df) <- c("Pa�ses", "2004", "2018")
df <- df[df$Pa�ses == "SE - Su�cia" | df$Pa�ses == "GR - Gr�cia" | df$Pa�ses == "RO - Rom�nia", ]
df_ano <- df %>% pivot_longer(c("2004", "2018"), names_to = "Ano", values_to = "Res�duos")
df_ano <- transform(df_ano, Res�duos = as.numeric(Res�duos))
ggplot(df_ano, aes(fill=Ano, y=Res�duos, x=Pa�ses)) + geom_bar(position="dodge", stat="identity") + 
  ggtitle("Res�duos per Capita")

