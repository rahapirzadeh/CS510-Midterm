Computing for Scientists (CS 510)
# A mathematical model of a small virus infection over discrete and continuous time models

## Background 
 Using the three component dynamical systems model from the paper "A Quasi-Steady-State Approximation to the Basic Target-Cell-Limited Viral Dynamics Model”, I modified the equations and recreated discrete and continuous time models of a virus infection. 
  
## To Run 
 - File: [midterm.R](https://github.com/rahapirzadeh/CS510-Midterm/blob/main/midterm.R)
 
 - To Execute: In Rstudio terminal run
   ```
   Rscript midterm.R
   ```
   
## The Code 
 - Ordinary Differential Equations (Continous time model)
   ```
   d_Utc_dt <- -p_1 * Vir * Utc
   d_Itc_dt <- p_1 * Vir * Utc - p_2 * Itc
   d_Vir_dt <- p_3 * Itc - p_4 * Vir
   ```
- Discrete Time Model
  ```
  Uvec[n + 1] <- Uvec[n] - dt * p_1 * Uvec[n] * Vvec[n]
  Ivec[n + 1] <- Ivec[n] + dt * (p_1 * Uvec[n] * Vvec[n] - p_2 * Ivec[n])
  Vvec[n + 1] <- Vvec[n] + dt * (p_3 * Ivec[n] - p_4 * Vvec[n])
  ```

![Plot](https://github.com/rahapirzadeh/CS510-Midterm/blob/main/plots/Screen%20Shot%202020-12-12%20at%205.15.38%20PM.png)
![Plot](https://github.com/rahapirzadeh/CS510-Midterm/blob/main/plots/Screen%20Shot%202020-12-12%20at%205.15.53%20PM.png)
![Plot](https://github.com/rahapirzadeh/CS510-Midterm/blob/main/plots/Screen%20Shot%202020-12-12%20at%205.16.05%20PM.png)

