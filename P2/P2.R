library(ggplot2)
library(openxlsx)
library(dplyr, warn.conflicts = FALSE)
library(tidyr)

df <- read.xlsx("EsperancaVida.xlsx", sheet = 1, startRow = 9, sep.names=" ")
df <- df[df$X1 %in% c(2002:2019), ]
df <- df[, (colnames(df) %in% c("X1", "EE - Estónia", "LU - Luxemburgo", "SE - Suécia"))]
df <- select(df, -c(2:4))
names(df) <- c("Anos", "Estónia M", "Luxemburgo M", "Suécia M", "Estónia F", "Luxemburgo F", "Suécia F") 
df[] <- lapply(df, as.numeric)
df_limpo <- df %>% pivot_longer(c("Estónia M", "Luxemburgo M", "Suécia M", "Estónia F", "Luxemburgo F", "Suécia F"), names_to = "Grupo", values_to = "Esperança")
ggplot(df_limpo, aes(group = Grupo, x = Anos, y = Esperança)) + geom_line(aes(color = Grupo)) +
  ggtitle("Esperança de Vida")
