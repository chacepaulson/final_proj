# create new tibble where the two variables are combines into one for each 
# of the five categories 
success_combine <- tibble("country_name" = success_na$country_name, 
                          "region" = success_na$region, 
                          "poli_freedom" = success_na$poli_freedom, 
                          "econ_freedom" = success_na$econ_freedom)
colnames(success_na)

# economy 
success_combine$econ <- 
  rowMeans(success_na[,c("gdp", "unemployment")], na.rm=TRUE)

# safety
success_combine$safe <- 
  rowMeans(success_na[,c("crime_index", "homicide")], na.rm=TRUE)

# education 
success_combine$educ <- 
  rowMeans(success_na[,c("enrollment", "literacy")], na.rm=TRUE)

# health 
success_combine$health <- 
  rowMeans(success_na[,c("life_expectancy", "infant_mortality")], na.rm=TRUE)

# lifestyle
success_combine$life <- 
  rowMeans(success_na[,c("median_income", "happiness")], na.rm=TRUE)

# add success calculations back 
success_combine$success <- success_na$success
