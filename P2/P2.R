library(ggplot2)
library(openxlsx)
library(dplyr, warn.conflicts = FALSE)
library(tidyr)

#O ficheiro EsperancaVida.xlsx n�o foi alteradado
df <- read.xlsx("EsperancaVida.xlsx", sheet = 1, startRow = 9, sep.names=" ")
df <- df[df$X1 %in% c(2002:2019), ]
df <- df[, (colnames(df) %in% c("X1", "EE - Est�nia", "LU - Luxemburgo", "SE - Su�cia"))]
df <- df %>% select(-c(2:4))
names(df) <- c("Anos", "Est�nia H", "Luxemburgo H", "Su�cia H", "Est�nia M", "Luxemburgo M", "Su�cia M") 
df[] <- df %>% lapply(as.numeric)
df_limpo <- df %>% pivot_longer(names(.)[2:7], names_to = "Grupo", values_to = "Idade")
ggplot(df_limpo, aes(group = Grupo, x = Anos, y = Idade)) + geom_line(aes(color = Grupo)) + 
  geom_point(aes(color = Grupo)) + ggtitle("Esperan�a de Vida")
