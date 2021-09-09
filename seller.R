# An alchemist' problem
# author: Takemyprocs
# author's profile: https://github.com/Takemyprocs
# Loading linear programming package
library(lpSolve)

# 1. Parameters
# 1.1. Output prices
# p1: Potion of spectral agility price
# p2: Potion of spectral stamina price
# p3: Potion of spectral stamina price
# p4: Potion of spectral intellect price
# p5: Spectral flask of stamina price
# p6: Spectral flask of power price
p1 <- 100.2
p2 <- 80
p3 <- 110.96
p4 <- 120.11
p5 <- 115.90
p6 <- 314
# 1.2. Input costs
# r1: Widowbloom price
# r2: Vigil's torch price
# r3: Rising glory price
# r4: Marrowroot price
# r5: Nightshade price
s1 <- 98
s2 <- 147
s3 <- 182
s4 <- 157
s5 <- 114

# 2. Setting objective function coefficients
f.obj <- c(p1, p2, p3, p4, p5, p6)

# 3. Setting block of constraints
# 3.1. Setting coefficients
f.con <- matrix(c(5, 0, 0, 0, 0, 4,
                  0, 5, 0, 0, 0, 4,
                  0, 0, 5, 0, 3, 4,
                  0, 0, 0, 5, 3, 4,
                  0, 0, 0, 0, 1, 3), nrow = 5, byrow = TRUE)
# 3.2. Setting inequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=",
           "<=")
# 3.3. Setting right hand side coefficients
f.rhs <- c(s1,
           s2,
           s3,
           s4,
           s5)

# Output
output <- lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:6, all.int = TRUE)
text <- c("agility_potion_sell",
          "stamina_potion_sell",
          "strengh_potion_sell",
          "intellect_potion_sell",
          "stamina_flask_sell",
          "power_flask_sell")
table <- data.frame(cbind(text,output$solution))
colnames(table) <- c("item","optimal_sell")
print(paste("Optimal profit is:",output$objval, "gold coins"))
print(table)
