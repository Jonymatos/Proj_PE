set.seed(655)
n = 1289
p = 1.28
amostras = 650
alpha = 0.07
dados <- vector("double", amostras)

for (m in c(1:amostras)){
  lambda = 1/mean(rexp(n, p))
  baixo = lambda * (1 - (qnorm(1-(alpha/2), mean=0, sd=1)) / sqrt(n))
  alto = lambda * (1 + (qnorm(1-(alpha/2), mean=0, sd=1)) / sqrt(n))
  dados[m] <- (alto - baixo)
}

mean(dados)