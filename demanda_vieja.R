dem1 = rnorm(42, mean = 30.51, sd= 3.051)
Demanda = matrix(dem1,ncol=42,byrow = TRUE)

dem2 = rnorm(42, mean = 27.4, sd= 2.74)
Demanda = rbind(Demanda, dem2)

dem3 = rnorm(42, mean = 15.13, sd= 1.513)
Demanda = rbind(Demanda, dem3)

dem4 = rnorm(42, mean = 17.9, sd= 1.79)
Demanda = rbind(Demanda, dem4)

dem5 = rnorm(42, mean = 14.63, sd= 1.463)
Demanda = rbind(Demanda, dem5)

dem6 = rnorm(42, mean = 20.71, sd= 2.071)
Demanda = rbind(Demanda, dem6)

dem7 = rnorm(42, mean = 10.16, sd= 1.016)
Demanda = rbind(Demanda, dem7)

dem8 = rnorm(42, mean = 30.47, sd= 3.047)
Demanda = rbind(Demanda, dem8)

dem9 = rnorm(42, mean = 36.9, sd= 3.69)
Demanda = rbind(Demanda, dem9)

dem10 = rnorm(42, mean = 6.97, sd= 0.697)
Demanda = rbind(Demanda, dem10)

dem11 = rnorm(42, mean = 7.3, sd= 0.73)
Demanda = rbind(Demanda, dem11)

dem12 = rnorm(42, mean = 16.21, sd= 1.621)
Demanda = rbind(Demanda, dem12)

Demanda
dimnames(Demanda) <- list(NULL,NULL)
Demanda
write.csv(Demanda, file="demanda_vieja.csv")

