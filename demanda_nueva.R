dem1 = rnorm(21, mean = 67.81, sd= 6.781)
Demanda = matrix(dem1,ncol=21,byrow = TRUE)

dem2 = rnorm(21, mean = 77.27, sd= 7.727)
Demanda = rbind(Demanda, dem2)

dem3 = rnorm(21, mean = 44.31, sd= 4.431)
Demanda = rbind(Demanda, dem3)

dem4 = rnorm(21, mean = 55.94, sd= 5.594)
Demanda = rbind(Demanda, dem4)

dem5 = rnorm(21, mean = 39.54, sd= 3.954)
Demanda = rbind(Demanda, dem5)

dem6 = rnorm(21, mean = 51.77, sd= 5.177)
Demanda = rbind(Demanda, dem6)

dem7 = rnorm(21, mean = 25.49, sd= 2.549)
Demanda = rbind(Demanda, dem7)

dem8 = rnorm(21, mean = 87.05, sd= 8.705)
Demanda = rbind(Demanda, dem8)

dem9 = rnorm(21, mean = 92.26, sd= 9.226)
Demanda = rbind(Demanda, dem9)

dem10 = rnorm(21, mean = 17.42, sd= 1.742)
Demanda = rbind(Demanda, dem10)

dem11 = rnorm(21, mean = 36.51, sd= 3.651)
Demanda = rbind(Demanda, dem11)

dem12 = rnorm(21, mean = 38.23, sd= 3.823)
Demanda = rbind(Demanda, dem12)

Demanda
dimnames(Demanda) <- list(NULL,NULL)
Demanda
write.csv(Demanda, file="demanda_nueva.csv")
