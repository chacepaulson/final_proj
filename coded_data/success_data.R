# merge all of the small_econ and small_poli data into one data frame 
small_data <- merge(small_econ, small_poli, all.x = TRUE, all.y = TRUE)

# check if there are countrys not in our sovereign_nation data in 
# the small_data
setdiff(sovereign_nations$country_name, small_data$country_name)
setdiff(small_data$country_name, sovereign_nations$country_name)

# eliminate all countrys not in our sovereign_nation data 
success_data <- merge(sovereign_nations, small_data, all.x = TRUE)

# check that only the countrys from the soverign_nation data remain
nrow(success_data)
nrow(sovereign_nations)
setdiff(sovereign_nations$country_name, success_data$country_name)
setdiff(success_data$country_name, sovereign_nations$country_name)

# merge in the gdp data 
success_data <- merge(success_data, small_gdp, all.x = TRUE)

# merge in the unemployment data 
success_data <- merge(success_data, small_unemployment, all.x = TRUE)

# merge in crime rate data
success_data <- merge(success_data, small_crime, all.x = TRUE)

# merge in homicide data 
success_data <- merge(success_data, small_homicide, all.x = TRUE)

# merge in high school enrollment data
success_data <- merge(success_data, small_enrollment, all.x = TRUE)

# merge in the literacy data 
success_data <- merge(success_data, small_literacy2, all.x = TRUE)

# merge in the life expectancy data 
success_data <- merge(success_data, small_life, all.x = TRUE)

# merge in the infant mortality data 
success_data <- merge(success_data, small_infant, all.x = TRUE)

# merge in the median income data 
success_data <- merge(success_data, small_median_income, all.x = TRUE)

# merge in the happiness data 
success_data <- merge(success_data, happiness_mixed, all.x = TRUE)

# check to make sure all columns have been inputted
colnames(success_data)
ncol(success_data)

# ensure data is in a tibble and not a data frame
success_data <- as.tibble(success_data)

