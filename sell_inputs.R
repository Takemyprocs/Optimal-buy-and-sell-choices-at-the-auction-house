# An alchemist' problem - extension: inputs can be sold
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
# p5: Spiritual healing potion price
# p6: Spectral flask of stamina price
# p7: Spectral flask of power price
# p8: Widowbloom price
# p9: Vigil's torch price
# p10: Rising glory price
# p11: Marrowroot price
# p12: Nightshade price
# p13: Death blossom price
p1 <- 155.95
p2 <- 72.14
p3 <- 107.99
p4 <- 114.99
p5 <- 14
p6 <- 160
p7 <- 320
p8 <- 18
p9 <- 10.3
p10 <- 17.75
p11 <- 20
p12 <- 10.93
p13 <- 3.48
# 1.2. Input stock
# s1: Widowbloom stock
# s2: Vigil's torch stock
# s3: Rising glory stock
# s4: Marrowroot stock
# s5: Nightshade stock
# s6: Death blossom stock
s1 <- 150
s2 <- 195
s3 <- 253
s4 <- 132
s5 <- 96
s6 <- 596

# 2. Setting objective function coefficients
f.obj <- c(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)

# 3. Setting block of constraints
# 3.1. Setting coefficients
f.con <- matrix(c(5, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, 0, 0,
                  0, 5, 0, 0, 0, 0, 4, 0, 1, 0, 0, 0, 0,
                  0, 0, 5, 0, 0, 3, 4, 0, 0, 1, 0, 0, 0,
                  0, 0, 0, 5, 0, 3, 4, 0, 0, 0, 1, 0, 0,
                  0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 1, 0,
                  0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1), nrow = 6, byrow = TRUE)
# 3.2. Setting inequality signs
f.dir <- c("<=",
           "<=",
           "<=",
           "<=",
           "<=",
           "<=")
# 3.3. Setting right hand side coefficients
f.rhs <- c(s1,
           s2,
           s3,
           s4,
           s5,
           s6)

# Output
output <- lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:13, all.int = TRUE)
text <- c("agility_potion",
          "stamina_potion",
          "strengh_potion",
          "intellect_potion",
          "healing_potion",
          "stamina_flask",
          "power_flask",
          "widowbloom",
          "vigil_torch",
          "rising_glory",
          "marrowroot",
          "nightshade",
          "death_blossom")
table <- data.frame(cbind(text,output$solution))
colnames(table) <- c("item","optimal_sell")
print(paste("Optimal profit is:",output$objval, "gold coins"))
print(table)
