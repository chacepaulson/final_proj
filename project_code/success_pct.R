# check over data 
head(success_data)
colnames(success_data)

# create a new tibble for percentages 
success_pct <- tibble("country_name" = success_data$country_name, 
                      "region" = success_data$region)

# add in the economic freedom data
head(success_data$econ_freedom)
success_pct$econ_freedom <- success_data$econ_freedom / 100

# add in the political freedom data 
head(success_data$poli_freedom)
success_pct$poli_freedom <- success_data$poli_freedom / 100

# add in the gdp data 
# since gdp is not easily converted in a pct, will find the max gdp and 
# divide the rest by the max to create a pct 
head(success_data$gdp)
max_gdp <- max(success_data$gdp, na.rm = TRUE)
success_pct$gdp <- success_data$gdp / max_gdp

# add in the unemployment data 
# since high unemployment harms a country's success, we want to subtract 
# the pct by 1 to find a positive idicator (i.e. the employment rate)
head(success_data$unemployment)
success_pct$unemployment <- 1 - (success_data$unemployment / 100)

# add in the crime index data
# since high crime index harms a country's success, we want to subtract 
# the pct by 1 to find a positive idicator (i.e. the safety index)
head(success_data$crime_index)
success_pct$crime_index <- 1 - (success_data$crime_index / 100)

# add in the homicide rate data 
# subtract by 1 to find a positive indicator 
head(success_data$homicide)
success_pct$homicide <- 1 - (success_data$homicide / 100)

# add in the enrollment data 
head(success_data$enrollment)
max_enrollment <- max(success_data$enrollment, na.rm = TRUE)
success_pct$enrollment <- success_data$enrollment / max_enrollment

# add in the literacy data 
head(success_data$literacy)
success_pct$literacy <- success_data$literacy / 100

# add in the life expectancy data
head(success_data$life_expectancy)
max_life <- max(success_data$life_expectancy, na.rm = TRUE)
success_pct$life_expectancy <- success_data$life_expectancy / max_life

# add in the infant mortality data 
# subtract by 1 to find a positive indicator 
head(success_data$infant_mortality)
max_infant <- max(success_data$infant_mortality, na.rm = TRUE)
success_pct$infant_mortality <- 
  1 - (success_data$infant_mortality / max_infant)

# add in the median income data 
head(success_data$median_income)
max_income <- max(success_data$median_income, na.rm = TRUE)
success_pct$median_income <- success_data$median_income / max_income

# add in the happiness rating data 
head(success_data$happiness_rating)
max_happiness <- max(success_data$happiness_rating, na.rm = TRUE)
success_pct$happiness <- success_data$happiness_rating / max_happiness

# calculate the success rating for each country 
# since many countries have at least one NA for their data, we cannot 
# simply add the columns up and will instead need to find the mean
ncol(success_pct)
colnames(success_pct)

success_pct$success <- NA
success_pct$success <- rowMeans(success_pct[,5:14], na.rm=TRUE)

