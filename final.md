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
