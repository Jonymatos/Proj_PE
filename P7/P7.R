set.seed(664)
amostras = 2415
dimensao = 63
n = 21
p = 0.94
dados <- vector("double", amostras)
for (i in c(1:amostras)){
  dados[i] <- mean(rbinom(dimensao, n, p))
}
t_value = mean(dados)
e_value = p * n
abs(t_value - e_value)
