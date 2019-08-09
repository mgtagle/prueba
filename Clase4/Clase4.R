# Clase 4

# Correlación -------------------------------------------------------------


library(repmis)
erupciones <- source_data("https://www.dropbox.com/s/liir6sil7hkqlxs/erupciones.csv?dl=1")



plot(erupciones$waiting , erupciones$eruptions, pch=19, col="red",
     xlab = "Tiempo de espera (min)",
     ylab = "Duración (min)")


library(pastecs)
stat.desc(erupciones$eruptions,basic=FALSE, norm=TRUE )

shapiro.test(log(erupciones$eruptions))
shapiro.test(erupciones$waiting)

cor.test(erupciones$eruptions, erupciones$waiting)


# Regresión lineal --------------------------------------------------------

#  comando "lm" para realizar la regresión

lm.erup <- lm(erupciones$eruptions ~ erupciones$waiting)

plot(erupciones$waiting , erupciones$eruptions, pch=19, col="red",
     xlab = "Tiempo de espera (min)",
     ylab = "Duración (min)")
abline(lm.erup, col= "blue")
text(52, 4.5, "Y = -1.87 + 0.07 * x")
text(52, 4, "r^2 = 0.81")

lm.erup
summary(lm.erup)

length(erupciones$eruptions)

y.60 <- -1.87 + 0.07*60
y.60


# Datos de regresión ------------------------------------------------------

espera <- erupciones$waiting
duracion <- erupciones$eruptions
res <- resid(lm.erup)
pre <- fitted(lm.erup)
res.2 <- res^2

cuadro <- round(data.frame(espera, duracion, pre, res,
                     res.2),4)
SSE <- sum(cuadro$res.2)
SSE 

vari <- SSE/(length(erupciones$waiting)-2)
vari


# Prueba de hipotesis de la regresión -------------------------------------

an.erup <- anova(lm.erup)
an.erup
