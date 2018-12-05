# considering success on the basis of five categories: 
# 1. economic prosperity 
# 2. safety 
# 3. education 
# 4. health 
# 5. lifestyle

# each category was given two different variables 

# any country that is missing data for both variables in any of the 
# categories needs to be removed
success_na <- success_pct

colnames(success_pct)

success_na <- 
  success_na[rowSums(is.na(success_na[c("gdp", "unemployment")])) != 2, ]
success_na <- 
  success_na[rowSums(is.na(success_na[c("crime_index", "homicide")])) != 2, ]
success_na <- 
  success_na[rowSums(is.na(success_na[c("enrollment", "literacy")])) != 2, ]
success_na <- 
  success_na[rowSums(is.na(success_na[c("life_expectancy", "infant_mortality")])) != 2, ]
success_na <- 
  success_na[rowSums(is.na(success_na[c("median_income", "happiness")])) != 2, ]

# count number of remaining countries from the original 195 
nrow(success_na)
