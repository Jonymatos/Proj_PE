library(ggplot2)
library(openxlsx)
library(tidyr)

df <- read.xlsx("QualidadeARO3.xlsx", sheet = 1)
df <- df[, (colnames(df) %in% c("Restelo", "Laranjeiro-Almada"))]
df[] <- df %>% lapply(as.numeric)
df_limpo <- df %>% pivot_longer(names(.), names_to = "Estação", values_to = "Qualidade")
ggplot(df_limpo, aes(x = Qualidade, fill = Estação)) + geom_histogram(alpha=0.4, position = "identity", bins=30) +
  ggtitle("Qualidade do ar registada em 2020") + ylab("Nº de observações")

