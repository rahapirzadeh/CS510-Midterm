# Raha Pirzadeh
# CS 510 midterm project
# A mathematical model of a small virus infection over discrete and continuous time models

# package installer
if (!require ("deSolve")) {
  install.packages("deSolve")
  library(deSolve)
}

# ODE = Ordinary Differential Equations
ode_equations <- function (t, y, parameters) 
{ 
  # uninfected target cells, infected target cells, virus
  Utc <- y[1] 
  Itc <- y[2] 
  Vir <- y[3]
  
  # parameters
  p_1 <- parameters[1]
  p_2 <- parameters[2] 
  p_3 <- parameters[3]
  p_4 <- parameters[4]
  
  # differential equations
  d_Utc_dt <- -p_1 * Vir * Utc
  d_Itc_dt <- p_1 * Vir * Utc - p_2 * Itc
  d_Vir_dt <- p_3 * Itc - p_4 * Vir

  return(list(c(d_Utc_dt, d_Itc_dt, d_Vir_dt)))
} 

# main

# initial number of uninfected target cells 
Utc_0 <- 1e8
# initial number of infected target cells
Itc_0 <- 0
# initial condition for free virus V
Vir_0 <- 10

Y_0 <- c(Utc_0, Itc_0, Vir_0)

# values for model parameters
p_1 <- 1e-8
p_2 <- 2
p_3 <- 1e2
p_4 <- 10
parameters <- c(p_1, p_2, p_3, p_4)

# vector of times for which integration is evaluated from 0 to 10 days in steps of .1
time_vec <- seq(0, 20, .1) 

ode_output <- lsoda(Y0, time_vec, ode_equations, parameters)
head(ode_output)

# discrete time model
dt <- .05
t_discrete <- seq(0, 20, by = dt)
Uvec <- rep(0, length(t_discrete))
Ivec <- Uvec
Vvec <- Uvec

Uvec[1] <- Utc_0
Ivec[1] <- Itc_0
Vvec[1] <- Vir_0

# time(in days) loop for the discrete time model
for(n in 1: (length (t_discrete) - 1)) 
{
  Uvec[n + 1] <- Uvec[n] - dt * p_1 * Uvec[n] * Vvec[n]
  Ivec[n + 1] <- Ivec[n] + dt * (p_1 * Uvec[n] * Vvec[n] - p_2 * Ivec[n])
  Vvec[n + 1] <- Vvec[n] + dt * (p_3 * Ivec[n] - p_4 * Vvec[n])
}


# Plots

# Uninfected plot
# plot shows Uninfected target cells over discrete and continuous time period
plot(ode_output[,1], ode_output[,2], type = "l", lwd = 2,
     xlab = "Time (days)", ylab = "Number of Cells", main = "Uninfected", sub = "Continous vs. Discrete",
     log = "y", xlim = c(0, 20) , ylim = c(1, 1e9), 
     col = "green", col.main = "deeppink", cex.main = 2)
lines(t.discrete, Uvec, col = "darkgreen", lwd = 2, lty = 2)
legend("topright", c("Uninfected", "Uninfected - discrete"),col = c("green", "darkgreen"), lwd = 2, lty = c(1,2))

# Infected plot
# plot shows infected target cells over discrete and continuous time period
plot(ode_output[,1], ode_output[,3], type = "l", lwd = 2,
     xlab = "Time (days)", ylab = "Number of Cells", main = "Infected", sub = "Continous vs. Discrete",
     log = "y", xlim = c(0, 20), ylim = c(1, 1e9),
     col = "red", col.main = "deeppink", cex.main = 2)
lines(t.discrete, Ivec, type = "l", col = "darkred", lwd = 2,lty = 2)
legend("topright", c("Infected", "Infected - discrete"), col = c("red", "darkred"), lwd = 2, lty = c(1, 2))

# Virus plot
# plot shows the virus over discrete and continuous time period
plot(ode_output[,1], ode_output[,4], type = "l", lwd = 2,
     xlab = "Time (days)", ylab = "Number of Virus", main = "Virus", sub = "Continous vs. Discrete",
     log = "y", xlim = c(0, 20), ylim = c(1, 1e9),
     col = "blue", col.main = "deeppink", cex.main = 2)
lines(t.discrete, Vvec, type = "l", col = "darkblue", lwd = 2, lty = 2)
legend("topright", c("Virus", "Virus - discrete"), col = c("blue", "darkblue"), lwd =2, lty = c(1, 2))



