# Marco A González
# 06/08/2019
# Clase 2


# Importar datos vivero ---------------------------------------------------

vivero <- read.csv("C:/MCF202-2019/prueba/Datos/Tvivero.csv", header = T)
summary(vivero)


# Prueba de t una muestra -------------------------------------------------
par(mfrow=c(1,1))
boxplot(vivero$IE)
t.test(vivero$IE, mu = 0.85)
# La media observada no es diferente estadísticamente ya que el valor de p
# es mayor que el alfa establecido (0.05). Además la media teorética se
# encuentra dentro del rango de los valores de intervalos de confianza.

t.test(vivero$IE, mu = 0.9)
# La media observada es diferente a la media teorética, por lo cual aceptamos
# la H1. l valor de p (0.01) es menor que el valor de alfa establecido (0.05).


# pruebas d t muestras independientes -------------------------------------

boxplot(vivero$IE ~ vivero$Tratamiento, col= "green", xlab = "Tratamiento",
        ylab = "IE")
shapiro.test(vivero$IE)

var.test(vivero$IE ~ vivero$Tratamiento)
# Las varianzas de ambos tratamientos son iguales así lo prueba el valor de p
# obtenido mediante una prueba de varianzas (var.test).

t.test(vivero$IE ~ vivero$Tratamiento, var.equal =T)

# Existe una diferencia significativa antre el IE de las plántulas fertilizadas.
# El valor de p (0.004) comprueba nuestra hipótesis de que el fertilizante 
# "Power" mejora el IE. 
