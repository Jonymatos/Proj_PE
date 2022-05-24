set.seed(1804)
vector <- rexp(356, 0.22)
e_value = 1-ecdf(vector)(10)
t_value = 1-(1-exp(-0.22*10))
#0.001253
t_value-e_value