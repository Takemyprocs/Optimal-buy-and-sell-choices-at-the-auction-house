# --------------------- #
# Alchemist's Problem 1 #
# --------------------- #

# parámetros
# precio de outputs
# p1: precio de poción de agilidad
# p2: precio de poción de aguante espectral
# p3: precio de poción de fuerza espectral
# p4: precio de poción de intelecto espectral
# p5: precio de frasco de aguante espectral
# p6: precio de frasco de poder espectral
p1 <- 100.2
p2 <- 80
p3 <- 110.96
p4 <- 120.11
p5 <- 115.90
p6 <- 314
# stock de insumos
# s1: stock de viudalia
# s2: stock de antorcha de la vigilia
# s3: stock de gloria creciente
# s4: stock de corraiz
# s5: stock de sombranoche
s1 <- 98
s2 <- 147
s3 <- 182
s4 <- 157
s5 <- 114
# coeficientes asociados a variables de decisión (x6)
# c1 <- producción de poción de agilidad
# c2 <- producción de poción de aguante
# c3 <- producción de poción de fuerza
# c4 <- producción de poción de intelecto
# c5 <- producción de frasco de aguante
# c6 <- producción de frasco de poder

# Package de programación lineal
library(lpSolve)
# Estableciendo coeficientes de la función objetivo
f.obj <- c(p1, p2, p3, p4, p5, p6)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(5, 0, 0, 0, 0, 4,
                  0, 5, 0, 0, 0, 4,
                  0, 0, 5, 0, 3, 4,
                  0, 0, 0, 5, 3, 4,
                  0, 0, 0, 0, 1, 3), nrow = 5, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=",
           "<=")

# Set right hand side coefficients
f.rhs <- c(s1,
           s2,
           s3,
           s4,
           s5)

# Final value (z)
output <- lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:6, all.int = TRUE)$solution
text <- c("x1","x2","x3","x4","x5","x6")
output <- cbind(text,output)
output
