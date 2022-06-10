library(ggplot2)

set.seed(471)
dimensoes = seq(from = 100, to = 2500, by = 100)
p = 4.85
pc = 0.01
amostras = 1050
alpha = 0.07
percentagem = 0.2

dados <- data.frame(matrix(ncol=3, nrow=0))
colnames(dados)<-c("Dimensao","Grupo", "MA")

count = 1
for (n in dimensoes){
  buffer <- vector("double", amostras)
  for (m in c(1:amostras)){
    lambda = mean(rexp(n, p))
    baixo = 1/(lambda * (1 + (qnorm(1-(alpha/2), mean=0, sd=1)) / sqrt(n)))
    alto = 1/(lambda * (1 - (qnorm(1-(alpha/2), mean=0, sd=1)) / sqrt(n)))
    buffer[m] <- (alto - baixo)
  }
  
  dados[count,] <- c(n, "Normal", mean(buffer))
  count=count+1
  for(m in c(1:amostras*percentagem)){
    lambda = mean(rexp(n, pc))
    baixo = 1/(lambda * (1 + (qnorm(1-(alpha/2), mean=0, sd=1)) / sqrt(n)))
    alto = 1/(lambda * (1 - (qnorm(1-(alpha/2), mean=0, sd=1)) / sqrt(n)))
    buffer[m] <- (alto - baixo)
  }
  
  dados[count,] <- c(n, "Contaminado", mean(buffer))
  count=count+1
}
dados <- transform(dados, MA = as.numeric(MA), Dimensao = as.numeric(Dimensao))
ggplot(dados, aes(group=Grupo, x=Dimensao, y=MA)) + geom_point(aes(color=Grupo)) +
  geom_line(aes(color=Grupo)) + ggtitle("Gráfico de MAs")

