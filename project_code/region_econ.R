# region data 
colnames(success_na)
unique(success_na$region)

# calculate means for each region
mean_ap <- 
  mean(success_na$econ_freedom[success_na$region == "Asia-Pacific"], na.rm = TRUE)
mean_eu <-
  mean(success_na$econ_freedom[success_na$region == "Europe"], na.rm = TRUE)
mean_mena <-
  mean(success_na$econ_freedom[success_na$region == "Middle East / North Africa"], na.rm = TRUE)
mean_ssa <-
  mean(success_na$econ_freedom[success_na$region == "Sub-Saharan Africa"], na.rm = TRUE)
mean_am <-
  mean(success_na$econ_freedom[success_na$region == "Americas"], na.rm = TRUE)
# create a tibble of values
df_region_econ <- tibble("region" = c("Asia-Pacific", "Europe", 
                                 "Middle East / North Africa", 
                                 "Sub-Saharan Africa", "Americas"), 
                    "mean" = c(mean_ap, mean_eu, mean_mena, mean_ssa, mean_am))
df_region_econ

# calculate the correlation
lm(success ~ region, data = success_na)