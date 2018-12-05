# overview data 
success_na
colnames(success_na)

# linear regression on the two measures
lm_poli_f <- lm(success ~ poli_freedom, data = success_na)
lm_econ_f <- lm(success ~ econ_freedom, data = success_na)

lm_poli_f
lm_econ_f

# multiple linear regression on the two measures
lm_both <- lm(success ~ econ_freedom + poli_freedom, data = success_na)
lm_both

# calculate for the five categories
lm_econ <- lm(success ~ gdp + unemployment, data = success_na)
lm_safe <- lm(success ~ crime_index + homicide, data = success_na)
lm_educ <- lm(success ~ enrollment + literacy, data = success_na)
lm_health <- lm(success ~ life_expectancy + infant_mortality, data = success_na)
lm_life <- lm(success ~ median_income + happiness, data = success_na)

# multiple linear regression on the five categories
lm_five <- lm(success ~ econ + safe + educ + health + life, 
              data = success_combine)
lm_five






