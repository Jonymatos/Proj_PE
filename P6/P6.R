library(ggplot2)
library(patchwork)


processa<-function(n){
  dados <- data.frame(matrix(ncol=2, nrow=0))
  colnames(dados)<-c("Amostra_Media")
  dados[] <- lapply(dados, as.numeric)
  for (i in c(1:1010)){
    amostra <- runif(n, 9, 13)
    dados[i,] <- mean(amostra)
  }

  grafico <- ggplot(dados, aes(x=Amostra_Media)) +
    stat_function(fun = dnorm, colour = "red", args = list(mean = 11, sd = sqrt((4/3)/n))) +
    geom_histogram(aes(y = after_stat(count / sum(count))), bins = 30, fill = "lightblue", colour = "black")
  return(grafico)
}

set.seed(628)
n4 <- processa(4)
n21 <- processa(21)
n94 <- processa(94)
n4 + n21 + n94 + plot_layout(ncol = 1)



