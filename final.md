Computing for Scientists (CS 510)- Final
# A mathematical model of a small virus infection over discrete and continuous time models

## Why I picked this project
  I have always been interested in biology and the medical field in general. When it came to picking a project topic, I knew I wanted to do something in analyzing medical data. So I got to thinking about what is running our lives at the moment, Covid. Since there is no data on it, I picked the next best and relatively easier to handle model, a small virus. I found a paper on the research behind the math models I used and formed my code. From the paper “A Quasi-Steady-State Approximation to the Basic Target-Cell-Limited Viral Dynamics Model” researchers derived an analytic solution for the model, providing time evolution values of all three compartments of uninfected cells, infected cells and virus. In the paper, they compared the results to data collected for an anemia virus. From their three component dynamical systems model, I simplified it slightly.

  ```
  d_Utc_dt <- -p_1 * Vir * Utc
  d_Itc_dt <- p_1 * Vir * Utc - p_2 * Itc
  d_Vir_dt <- p_3 * Itc - p_4 * Vir
  ```

  - Line 1 describes the rate at which the virus infects uninfected target-cells and die
  - Line 2 describes the how the virus infects target-cells at a rate p_1 and infected cells die at a rate p_2
  - Line 3 describes how new virus particles are produced at a rate p_3 and are cleared at a rate p_4.
  
  
For the project, I Simplified the models and recreated discrete and continuous time models of a virus infection in R. First I declared the differential equations. Then I initialized the variables, and gave values to the parameters.  
  
## Plots
![Plot](https://github.com/rahapirzadeh/CS510-Midterm/blob/main/plots/Screen%20Shot%202020-12-12%20at%205.15.38%20PM.png)
![Plot](https://github.com/rahapirzadeh/CS510-Midterm/blob/main/plots/Screen%20Shot%202020-12-12%20at%205.15.53%20PM.png)
![Plot](https://github.com/rahapirzadeh/CS510-Midterm/blob/main/plots/Screen%20Shot%202020-12-12%20at%205.16.05%20PM.png)

The plots show both the discrete and continous time. For each of the plots the continous and discrete times are very similar, not having much of a difference. 

## Changes from Midterm
  From the midterm release, I fixed the code to better support the organization set forth in Wilson et al. 2014 and the Advanced R book. There were slight changes such as adding spaces to seperate everything and making sure varible names had underscores even if it was a number. I also added a Readme file. 

## Future Work 
  It was interesting to adapt a model to have a visual. The paper goes further with the math behind the differential equations and how they are derived and less so visualizing the data so it was great to add that. With my model you have the ability to see how the graph alters by changing out the variables. Something I would like to do to expand this project would be to make it executable by a command line prompt where users have the chance to input numbers instead of manually altering the values and parameters.
