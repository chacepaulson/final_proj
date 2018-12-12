# calculating success without economic indicators 

# in order to ensure that success was not biased towards economic freedom 
# as gdp and unemployment were both in the calculations of economic freedom 
# and the success variables, need to calculate success removing the economic 
# category to see if it has an effect on the linear regression 

# check over data 
head(success_data)
colnames(success_data)

# create a new tibble for percentages 
success_four <- tibble("country_name" = success_data$country_name, 
                      "region" = success_data$region)

# add in the economic freedom data
head(success_data$econ_freedom)
success_four$econ_freedom <- success_data$econ_freedom / 100

# add in the political freedom data 
head(success_data$poli_freedom)
success_four$poli_freedom <- success_data$poli_freedom / 100

# add in the crime index data
# since high crime index harms a country's success, we want to subtract 
# the pct by 1 to find a positive idicator (i.e. the safety index)
head(success_data$crime_index)
success_four$crime_index <- 1 - (success_data$crime_index / 100)

# add in the homicide rate data 
# subtract by 1 to find a positive indicator 
head(success_data$homicide)
success_four$homicide <- 1 - (success_data$homicide / 100)

# add in the enrollment data 
head(success_data$enrollment)
max_enrollment <- max(success_data$enrollment, na.rm = TRUE)
success_four$enrollment <- success_data$enrollment / max_enrollment

# add in the literacy data 
head(success_data$literacy)
success_four$literacy <- success_data$literacy / 100

# add in the life expectancy data
head(success_data$life_expectancy)
max_life <- max(success_data$life_expectancy, na.rm = TRUE)
success_four$life_expectancy <- success_data$life_expectancy / max_life

# add in the infant mortality data 
# subtract by 1 to find a positive indicator 
head(success_data$infant_mortality)
max_infant <- max(success_data$infant_mortality, na.rm = TRUE)
success_four$infant_mortality <- 
  1 - (success_data$infant_mortality / max_infant)

# add in the median income data 
head(success_data$median_income)
max_income <- max(success_data$median_income, na.rm = TRUE)
success_four$median_income <- success_data$median_income / max_income

# add in the happiness rating data 
head(success_data$happiness_rating)
max_happiness <- max(success_data$happiness_rating, na.rm = TRUE)
success_four$happiness <- success_data$happiness_rating / max_happiness

# calculate the success rating for each country 
# since many countries have at least one NA for their data, we cannot 
# simply add the columns up and will instead need to find the mean
ncol(success_four)
colnames(success_four)

success_four$success <- NA
success_four$success <- rowMeans(success_four[,5:12], na.rm=TRUE)

# remove rows that have NA for both variables in one category 

# any country that is missing data for both variables in any of the 
# categories needs to be removed
success_four <- success_pct

colnames(success_pct)

success_four <- 
  success_four[rowSums(is.na(success_four[c("gdp", "unemployment")])) != 2, ]
success_four <- 
  success_four[rowSums(is.na(success_four[c("crime_index", "homicide")])) != 2, ]
success_four <- 
  success_four[rowSums(is.na(success_four[c("enrollment", "literacy")])) != 2, ]
success_four <- 
  success_four[rowSums(is.na(success_four[c("life_expectancy", "infant_mortality")])) != 2, ]
success_four <- 
  success_four[rowSums(is.na(success_four[c("median_income", "happiness")])) != 2, ]

# count number of remaining countries from the original 195 
nrow(success_four)

# run a new linear regression with only the four categories factored into 
# the success score 

lm_both_four <- lm(success ~ econ_freedom + poli_freedom, data = success_four)
lm_both_four
