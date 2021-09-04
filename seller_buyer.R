# --------------------------------------- #
# algoritmo de maximización de beneficios #
# --------------------------------------- #

# parámetros
# precio de outputs
# p1: precio de poción de agilidad
# p2: precio de poción de aguante espectral
# p3: precio de poción de fuerza espectral
# p4: precio de poción de intelecto espectral
# p5: precio de frasco de aguante espectral
# p6: precio de frasco de poder espectral
p1 <- 105.44
p2 <- 97
p3 <- 111
p4 <- 120.11
p5 <- 119.99
p6 <- 313.9
# costo de insumos
# r1: precio de viudalia
# r2: precio de antorcha de la vigilia
# r3: precio de gloria creciente
# r4: precio de corraiz
# r5: precio de sombranoche
r1 <- 16.35
r2 <- 7.15
r3 <- 20.97
r4 <- 19
r5 <- 9.25
# capital disponible para invertir en insumos
# C: capital
C <- 29784
# coeficientes asociados a variables de decisión (x11)
# c1 <- producción de poción de agilidad
# c2 <- producción de poción de aguante
# c3 <- producción de poción de fuerza
# c4 <- producción de poción de intelecto
# c5 <- producción de frasco de aguante
# c6 <- producción de frasco de poder
# c7 <- compra de viudalia
# c8 <- compra de antorcha de la vigilia
# c9 <- compra de gloria creciente
# c10 <- compra de corraiz
# c11 <- compra de sombranoche

# Package de programación lineal
library(lpSolve)
# Estableciendo coeficientes de la función objetivo
f.obj <- c(p1, p2, p3, p4, p5, p6, (-1)*r1, (-1)*r2, (-1)*r3, (-1)*r4, (-1)*r5)

# Set matrix corresponding to coefficients of constraints by rows
# Do not consider the non-negative constraint; it is automatically assumed
f.con <- matrix(c(5, 0, 0, 0, 0, 4, -1, 0, 0, 0, 0,
                  0, 5, 0, 0, 0, 4, 0, -1, 0, 0, 0,
                  0, 0, 5, 0, 3, 4, 0, 0, -1, 0, 0,
                  0, 0, 0, 5, 3, 4, 0, 0, 0, -1, 0,
                  0, 0, 0, 0, 1, 3, 0, 0, 0, 0, -1,
                  0, 0, 0, 0, 0, 0, r1, r2, r3, r4, r5), nrow = 6, byrow = TRUE)

# Set unequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=",
           "<=",
           "<=")

# Set right hand side coefficients
f.rhs <- c(0,
           0,
           0,
           0,
           0,
           C)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:11, all.int = TRUE)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:11, all.int = TRUE)$solution