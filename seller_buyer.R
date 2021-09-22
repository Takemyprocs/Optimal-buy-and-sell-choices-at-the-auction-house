# An alchemist' problem - extension: inputs can be bought but not sold
# author: Takemyprocs
# author's profile: https://github.com/Takemyprocs
# Loading linear programming package
library(lpSolve)

# 1. Parameters
# 1.1. Output prices
# p1: Potion of spectral agility price
# p2: Potion of spectral stamina price
# p3: Potion of spectral strength price
# p4: Potion of spectral intellect price
# p5: Spectral flask of stamina price
# p6: Spectral flask of power price
p1 <- 116.91
p2 <- 72.14
p3 <- 107.98
p4 <- 114.98
p5 <- 140
p6 <- 299.99
# 1.2. Input costs
# r1: Widowbloom price
# r2: Vigil's torch price
# r3: Rising glory price
# r4: Marrowroot price
# r5: Nightshade price
r1 <- 17.99
r2 <- 9
r3 <- 17.49
r4 <- 19.88
r5 <- 8.55
# 1.3. Capital budget
K <- 35823

# 2. Setting objective function coefficients
f.obj <- c(p1, p2, p3, p4, p5, p6, (-1)*r1, (-1)*r2, (-1)*r3, (-1)*r4, (-1)*r5)

# 3. Setting block of constraints
# 3.1. Setting coefficients
f.con <- matrix(c(5, 0, 0, 0, 0, 4, -1, 0, 0, 0, 0,
                  0, 5, 0, 0, 0, 4, 0, -1, 0, 0, 0,
                  0, 0, 5, 0, 3, 4, 0, 0, -1, 0, 0,
                  0, 0, 0, 5, 3, 4, 0, 0, 0, -1, 0,
                  0, 0, 0, 0, 1, 3, 0, 0, 0, 0, -1,
                  0, 0, 0, 0, 0, 0, r1, r2, r3, r4, r5), nrow = 6, byrow = TRUE)
# 3.2. Setting inequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=",
           "<=",
           "<=")
# 3.3. Setting right hand side coefficients
f.rhs <- c(0,
           0,
           0,
           0,
           0,
           K)

# Output
output <- lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:11, all.int = TRUE)
text <- c("agility_potion_sell",
          "stamina_potion_sell",
          "strengh_potion_sell",
          "intellect_potion_sell",
          "stamina_flask_sell",
          "power_flask_sell",
          "widowbloom_buy",
          "vigil_torch_buy",
          "rising_glory_buy",
          "marrowroot_buy",
          "nightshade_buy")
table <- data.frame(cbind(text,output$solution))
colnames(table) <- c("item","optimal_sell")
print(paste("Optimal profit is:",output$objval, "gold coins"))
print(table)