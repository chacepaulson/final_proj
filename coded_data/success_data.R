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

# find the types for each column 
typeof(success_data$econ_freedom)
typeof(success_data$poli_freedom)
typeof(success_data$gdp)
typeof(success_data$unemployment)
typeof(success_data$crime_index)
typeof(success_data$homicide)
typeof(success_data$enrollment)
typeof(success_data$literacy)
typeof(success_data$life_expectancy)
typeof(success_data$infant_mortality)
typeof(success_data$median_income)
typeof(success_data$happiness_rating)

# convert the character strings into numeric 
success_data$econ_freedom <- 
  as.numeric(as.character(success_data$econ_freedom))
success_data$gdp <- 
  as.numeric(as.character(success_data$gdp))
success_data$homicide <- 
  as.numeric(as.character(success_data$homicide))
success_data$enrollment <- 
  as.numeric(as.character(success_data$enrollment))
success_data$literacy <- 
  as.numeric(as.character(success_data$literacy))
success_data$life_expectancy <- 
  as.numeric(as.character(success_data$life_expectancy))
success_data$infant_mortality <- 
  as.numeric(as.character(success_data$infant_mortality))
success_data$median_income <- 
  as.numeric(as.character(success_data$median_income))
success_data$happiness_rating <- 
  as.numeric(as.character(success_data$happiness_rating))

# check to ensure that all columns are now doubles
typeof(success_data$econ_freedom)
typeof(success_data$poli_freedom)
typeof(success_data$gdp)
typeof(success_data$unemployment)
typeof(success_data$crime_index)
typeof(success_data$homicide)
typeof(success_data$enrollment)
typeof(success_data$literacy)
typeof(success_data$life_expectancy)
typeof(success_data$infant_mortality)
typeof(success_data$median_income)
typeof(success_data$happiness_rating)
