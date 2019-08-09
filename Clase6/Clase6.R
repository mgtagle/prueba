# MAGT
# Clase 6

library(repmis)
edad <- source_data("https://www.dropbox.com/s/nxoijhgmutuho0s/datos_control_Rascon.csv?dl=1")

head(edad)
str(edad)

# Idnetificar columna SP como factor
edad$SP <-factor(edad$SP)
str(edad)



# Separar factor ----------------------------------------------------------

ariz <-subset(edad, SP == "arizonica")

ariz.lm <- lm(ariz$EDAD ~ ariz$DAP)
summary(ariz.lm)
dura <-subset(edad, SP == "durangensis")


# Regresion dos factores --------------------------------------------------

cov.edad <- lm(edad$EDAD ~ edad$DAP + edad$SP)
summary(cov.edad)

plot(edad$DAP[edad$SP == "arizonica"], edad$EDAD[edad$SP == "arizonica"],
     col= "red", pch =16, xlim=c(0,50), ylim=c(0,130))
abline(cov.edad$coefficients[1], cov.edad$coefficients[2], col="red")
text(30, 20, "Ya = -7.65 + 1.98 * x")
points(edad$DAP[edad$SP == "durangensis"], edad$EDAD[edad$SP == "durangensis"],
       col= "blue", pch =16)
abline(cov.edad$coefficients[1] + cov.edad$coefficients[3], 
       cov.edad$coefficients[2], col="blue", lty ="dashed")
text(19, 100, "Yd = 11.41 + 1.98* x ")
