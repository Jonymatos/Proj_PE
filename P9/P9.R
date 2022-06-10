library(ggplot2)

set.seed(208)
dimensoes = seq(from = 100, to = 5000, by = 100)
p = 0.73
amostras = 550
alpha = 0.1

dados <- data.frame(matrix(ncol=2, nrow=0))
colnames(dados)<-c("Dimensao","MA")
dados[] <- lapply(dados, as.numeric)

count = 0
for (n in dimensoes){
  buffer <- vector("double", amostras)
  for (m in c(1:amostras)){
    lambda = 1/mean(rexp(n, p))
    baixo = lambda * (1 - (qnorm(1-(alpha/2), mean=0, sd=1)) / sqrt(n))
    alto = lambda * (1 + (qnorm(1-(alpha/2), mean=0, sd=1)) / sqrt(n))
    buffer[m] <- (alto - baixo)
  }
  dados[count,] <- c(n, mean(buffer))
  count=count+1
}

ggplot(dados, aes(x=Dimensao, y=MA)) + geom_point() +
  ggtitle("Gráfico de MA")