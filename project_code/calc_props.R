# calculate means of proportions ------------------------------------------
success_calc <- success_order

# find success rates for each proportions
suc0 <- success_calc$poli_freedom[success_calc$success == 0]
suc1 <- success_calc$poli_freedom[success_calc$success < .1]
suc2 <- success_calc$poli_freedom[success_calc$success < .2]
suc3 <- success_calc$poli_freedom[success_calc$success < .3]
suc4 <- success_calc$poli_freedom[success_calc$success < .4]
suc5 <- success_calc$poli_freedom[(success_calc$success > .5)&(success_calc$success< .6)]
suc6 <- success_calc$poli_freedom[(success_calc$success > .6)&(success_calc$success< .7)]
suc7 <- success_calc$poli_freedom[(success_calc$success > .7)&(success_calc$success< .8)]
suc8 <- success_calc$poli_freedom[(success_calc$success > .8)&(success_calc$success< .9)]
suc9 <- success_calc$poli_freedom[(success_calc$success > .9)&(success_calc$success< 1.0)]

# calculate means
calc_mean <- c(mean(suc0), mean(suc1), mean(suc2), mean(suc3), mean(suc4),
               mean(suc5), mean(suc6), mean(suc7), mean(suc8), 
               mean(suc9)) 
calc_mean

# create tibbles with proportions
mean_poli_prop <- 
  tibble("prop_success" = c("0 - 0.1", "0.1 - 0.2", "0.2 - 0.3", 
                            "0.3 - 0.4", "0.4 - 0.5", "0.5 - 0.6",
                            "0.6 - 0.7", "0.7 - 0.8", "0.8 - 0.9",
                            "0.9 - 1.0"),
         "mean_success" = calc_mean)
mean_poli_prop


# calculate means of proportions ------------------------------------------
success_calc <- success_order

# find success rates for each proportions
xsuc1 <- success_calc$econ_freedom[(success_calc$success > .7)&(success_calc$success< .75)]
xsuc2 <- success_calc$econ_freedom[(success_calc$success > .75)&(success_calc$success< .8)]
xsuc3 <- success_calc$econ_freedom[(success_calc$success > .8)&(success_calc$success< .85)]
xsuc4 <- success_calc$econ_freedom[(success_calc$success > .85)&(success_calc$success< .9)]
xsuc5 <- success_calc$econ_freedom[(success_calc$success > .9)&(success_calc$success< .95)]
xsuc6 <- success_calc$econ_freedom[(success_calc$success > .95)&(success_calc$success< 1.0)]

# calculate means
calc_mean <- c(mean(xsuc1), mean(xsuc2), mean(xsuc3), 
               mean(xsuc4),mean(xsuc5), mean(xsuc6)) 
calc_mean

# create tibbles with proportions
mean_econ_prop <- 
  tibble("prop_success" = c("0.70 - 0.75", "0.75 - 0.80", "0.80 - 0.85", 
                            "0.85 - 0.90", "0.90 - 0.95", "0.95 - 1.0"),
         "mean_success" = calc_mean)
mean_econ_prop


