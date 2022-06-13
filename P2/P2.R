library(ggplot2)
library(openxlsx)
library(dplyr, warn.conflicts = FALSE)
library(tidyr)

#O ficheiro EsperancaVida.xlsx não foi alteradado
df <- read.xlsx("EsperancaVida.xlsx", sheet = 1, startRow = 9, sep.names=" ")
df <- df[df$X1 %in% c(2002:2019), ]
df <- df[, (colnames(df) %in% c("X1", "EE - Estónia", "LU - Luxemburgo", "SE - Suécia"))]
df <- df %>% select(-c(2:4))
names(df) <- c("Anos", "Estónia H", "Luxemburgo H", "Suécia H", "Estónia M", "Luxemburgo M", "Suécia M") 
df[] <- df %>% lapply(as.numeric)
df_limpo <- df %>% pivot_longer(names(.)[2:7], names_to = "Grupo", values_to = "Idade")
ggplot(df_limpo, aes(group = Grupo, x = Anos, y = Idade)) + geom_line(aes(color = Grupo)) + 
  geom_point(aes(color = Grupo)) + ggtitle("Esperança de Vida")
