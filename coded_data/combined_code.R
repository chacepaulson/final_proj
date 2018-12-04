# Sovereign Nations -------------------------------------------------------

# import sovereign nations data set 
library(readxl)
sovereign_nations <- read_excel("~/Downloads/final_proj/raw_data/sovereign_nations.xlsx")

library(tidyverse)
sovereign_nations <- as_tibble(sovereign_nations)

# rename columns
library(magrittr)
sovereign_nations <- sovereign_nations %>% 
  rename(country_name = `Soverign Nations`)

# Political Freedom -------------------------------------------------------

# load political freedom data 
library(readxl)
poli_freedom <- read_excel("~/Downloads/final_proj/raw_data/poli_freedom.xlsx")

library(tidyverse)
poli_freedom <- as_tibble(poli_freedom)

# rename columns in political freedom data 
colnames(poli_freedom)
poli_freedom <- poli_freedom %>% 
  rename(country_name = `Country/Territory`, 
         poli_status = Status, 
         poli_rights_rating = `PR Rating`, 
         civil_lib_rating = `CL Rating`, 
         poli_freedom = Total
  )

# create second data set only with columns we care about 
small_poli <- tibble("country_name" = poli_freedom$country_name, 
                         "poli_freedom" = poli_freedom$poli_freedom)

# Economic Freedom --------------------------------------------------------

# Load economic freedom data 
library(readxl)
econ_freedom <- read_excel("~/Downloads/final_proj/raw_data/econ_freedom.xls")

library(tidyverse)
econ_freedom <- as_tibble(econ_freedom)
colnames(econ_freedom)

# Rename columns in economic freedom data 
econ_freedom <- econ_freedom %>% 
  rename(
    countryID = `CountryID`, 
    country_name = `Country Name`,
    webname = WEBNAME, 
    region = Region, 
    world_rank = `World Rank`, 
    region_rank = `Region Rank`, 
    total_score = `2018 Score`, 
    property_rights = `Property Rights`, 
    judical_effectiveness = `Judical Effectiveness`, 
    govt_integrity = `Government Integrity`, 
    tax_burden = `Tax Burden`, 
    govt_spending = `Gov't Spending`, 
    fiscal_health = `Fiscal Health`, 
    bis_freedom = `Business Freedom`, 
    labor_freedom = `Labor Freedom`, 
    monetary_freedom = `Monetary Freedom`, 
    trade_freedom = `Trade Freedom`, 
    invest_freedom = `Investment Freedom`, 
    finance_freedom = `Financial Freedom`, 
    tariff_rate_perc = `Tariff Rate (%)`, 
    income_tax_rate_per = `Income Tax Rate (%)`, 
    corporate_tax_rate_per = `Corporate Tax Rate (%)`, 
    tax_burden_per_of_gdp = `Tax Burden % of GDP`, 
    govt_expenditure_per_of_gdp = `Gov't Expenditure % of GDP`, 
    country = Country, 
    pop_in_mil = `Population (Millions)`, 
    gdp_bill_ppp = `GDP (Billions, PPP)`, 
    gdp_growth_rate_perc = `GDP Growth Rate (%)`, 
    five_year_gdp_growth_rate_per = `5 Year GDP Growth Rate (%)`, 
    gdp_per_capita = `GDP per Capita (PPP)`, 
    unemployment_per = `Unemployment (%)`, 
    inflation_per = `Inflation (%)`, 
    fdi_inflow_mil = `FDI Inflow (Millions)`, 
    public_debt_per_of_gdp = `Public Debt (% of GDP)`
  )

colnames(econ_freedom)

# create second data set only with columns we care about 

small_econ <- tibble("country_name" = econ_freedom$country_name,
                         "region" = econ_freedom$region,
                         "econ_freedom" = econ_freedom$total_score)

# GDP ---------------------------------------------------------------------

# loading gdp data 
library(readxl)
gdp <- read_excel("~/Downloads/final_proj/raw_data/gdp.xlsx")

library(tidyverse)
gdp <- as_tibble(gdp)

# renaming columns in gdp data 
colnames(gdp)
gdp <- gdp %>% 
  rename(country_name = `Country Name`, 
         country_code = `Country Code`, 
         indicator_name = `Indicator Name`, 
         indicator_code = `Indicator Code`)
colnames(gdp)

# finding out if there is any missing data from the 2017 set 
sum(is.na(gdp$`2017`))

# merge with sovereign nations to keep only desired nations
gdp_mixed <- merge(sovereign_nations, gdp, all.x = TRUE)

# find out if there is still missing data from 2017 set now that we only 
# have the nations we are interested in 
sum(is.na(gdp_mixed$`2017`))
gdp_mixed$country_name[is.na(gdp_mixed$`2017`)]

# create a column of gdp_total to combine other years in to 
gdp_mixed$gdp_total <- gdp_mixed$`2017`

# for the countries with NAs for 2017, we will take data from 2016 instead
gdp_mixed$gdp_total[is.na(gdp_mixed$gdp_total)] <- 
  as.character(gdp_mixed$`2016`[is.na(gdp_mixed$gdp_total)]) 

# test for number of remaining NAs
sum(is.na(gdp_mixed$gdp_total))

# repeat but using 2015 data 
gdp_mixed$gdp_total[is.na(gdp_mixed$`gdp_total`)] <- 
  as.character(gdp_mixed$`2015`[is.na(gdp_mixed$gdp_total)]) 
sum(is.na(gdp_mixed$gdp_total))

# repeat using 2014 data 
gdp_mixed$gdp_total[is.na(gdp_mixed$`gdp_total`)] <- 
  as.character(gdp_mixed$`2014`[is.na(gdp_mixed$gdp_total)]) 
sum(is.na(gdp_mixed$gdp_total))

# repeat using 2013 data 
gdp_mixed$gdp_total[is.na(gdp_mixed$`gdp_total`)] <- 
  as.character(gdp_mixed$`2013`[is.na(gdp_mixed$gdp_total)]) 
sum(is.na(gdp_mixed$gdp_total))

# repeat using 2013 data 
gdp_mixed$gdp_total[is.na(gdp_mixed$`gdp_total`)] <- 
  as.character(gdp_mixed$`2012`[is.na(gdp_mixed$gdp_total)]) 
sum(is.na(gdp_mixed$gdp_total))

# since we continue to having a total of 6 NAs, we will stop here

# find out what countries are still missing gdp data
gdp_mixed$country_name[is.na(gdp_mixed$gdp_total)]

# create smaller data set with only the gdp_total and country_names columns
small_gdp <- tibble("country_name" = gdp_mixed$country_name, 
                        "gdp" = gdp_mixed$gdp_total)

# Unemployment Rate -------------------------------------------------------

# import unemployment data 
library(readxl)
unemployment <- read_excel("~/Downloads/final_proj/raw_data/unemployment.xlsx")

# renaming columns 
unemployment <- unemployment %>% 
  rename(country_name = `Country`, 
         unemployment_rate = `%`, 
         date = `Date of Info`)

# create small data set with just country_name and unemployment rate
small_unemployment <- tibble("country_name" = unemployment$country_name, 
                                 "unemployment" = unemployment$unemployment_rate)

# Crime Index -------------------------------------------------------------

# loading crime index data 
library(readxl)
crime_index <- read_excel("~/Downloads/final_proj/raw_data/crime_index.xlsx")

library(tidyverse)
crime_index <- as_tibble(crime_index)

# renaming columns in crime index data 
colnames(crime_index)
crime_index <- crime_index %>% 
  rename(rank = `Rank`,
         country_name = `Country Name`, 
         crime_index = `Crime Index`, 
         safety_index = `Safety Index`)
colnames(crime_index)

# merge with sovereign nations to keep only desired nations
crime_mixed <- merge(sovereign_nations, crime_index, all.x = TRUE)

# test for NAs 
sum(is.na(crime_mixed$crime_index))
crime_mixed$country_name[is.na(crime_mixed$crime_index)]

# create smaller tibble keeping only country_name and literacy
small_crime <- tibble("country_name" = crime_mixed$country_name, 
                          "crime_index" = crime_mixed$crime_index)

# Homicide Rate -----------------------------------------------------------

# loading homicide data 
library(readxl)
homicide <- read_excel("~/Downloads/final_proj/raw_data/homicide_rates.xlsx")

library(tidyverse)
homicide <- as_tibble(homicide)

# renaming columns in homicide data 
colnames(homicide)
homicide <- homicide %>% 
  rename(country_name = `Country Name`)
colnames(homicide)

# finding out if there is any missing data from the 2016 set 
sum(is.na(homicide$`2016`))

# merge with sovereign nations to keep only desired nations
homicide_mixed <- merge(sovereign_nations, homicide, all.x = TRUE)

# find out if there is still missing data from 2016 set now that we only 
# have the nations we are interested in 
sum(is.na(homicide_mixed$`2016`))
homicide_mixed$country_name[is.na(homicide_mixed$`2016`)]

# create a column of median_total to combine other years in to 
homicide_mixed$homicide_total <- homicide_mixed$`2016`

# for the countries with NAs for 2016, we will take data from 2015 instead
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2015`[is.na(homicide_mixed$homicide_total)]) 

# test for number of remaining NAs
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2014 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2014`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2013 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2013`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2012 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2012`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2011 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2011`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2010 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2010`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2009 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2009`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2008 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2008`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2007 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2007`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2006 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2006`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2005 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2005`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2004 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2004`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# since we continue to having a total of 3 NAs, we will stop here

# find out what countries are still missing homicide data
homicide_mixed$country_name[is.na(homicide_mixed$homicide_total)]

# create smaller data set with only the homicide_total and country_names columns
small_homicide <- tibble("country_name" = homicide_mixed$country_name, 
                             "homicide" = homicide_mixed$homicide_total)

# Secondary School Enrollment Rate ----------------------------------------

# loading enrollment data 
library(readxl)
enrollment <- read_excel("~/Downloads/final_proj/raw_data/secondary_enrollment.xlsx")

library(tidyverse)
enrollment <- as_tibble(enrollment)

# renaming columns in enrollment data 
colnames(enrollment)
enrollment <- enrollment %>% 
  rename(country_name = `Country Name`)
colnames(enrollment)

# finding out if there is any missing data from the 2016 set 
sum(is.na(enrollment$`2016`))

# merge with sovereign nations to keep only desired nations
enrollment_mixed <- merge(sovereign_nations, enrollment, all.x = TRUE)

# find out if there is still missing data from 2016 set now that we only 
# have the nations we are interested in 
sum(is.na(enrollment_mixed$`2016`))
enrollment_mixed$country_name[is.na(enrollment_mixed$`2016`)]

# create a column of median_total to combine other years in to 
enrollment_mixed$enrollment_total <- enrollment_mixed$`2016`

# for the countries with NAs for 2016, we will take data from 2015 instead
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2015`[is.na(enrollment_mixed$enrollment_total)]) 

# test for number of remaining NAs
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2014 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2014`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2013 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2013`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2012 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2012`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2011 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2011`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2010 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2010`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2009 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2009`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2008 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2008`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2007 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2007`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2006 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2006`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2005 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2005`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2004 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2004`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2003 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2003`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2002 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2002`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2001 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2001`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2000 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2000`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# since we continue to having a total of 11 NAs, we will stop here

# merge with sovereign nations to keep only desired nations
enrollment_mixed <- merge(sovereign_nations, enrollment_mixed, all.x = TRUE)

# find out what countries are still missing enrollment data
sum(is.na(enrollment_mixed$enrollment_total))
enrollment_mixed$country_name[is.na(enrollment_mixed$enrollment_total)]

# create smaller data set with only the enrollment_total and country_names columns
small_enrollment <- tibble("country_name" = enrollment_mixed$country_name, 
                               "enrollment" = enrollment_mixed$enrollment_total)

# Literacy Rate -----------------------------------------------------------

# import literacy rates data set 
library(readxl)
literacy <- read_excel("~/Downloads/final_proj/raw_data/literacy_rates2.xlsx")

library(tidyverse)
literacy <- as_tibble(literacy)

# rename columns in the data set
library(magrittr)
colnames(literacy)
literacy <- literacy %>% 
  rename(country_name = `COUNTRY`, 
         definition = `DEFINITION`, 
         total = `TOTAL POPULATION`, 
         male = `MALE`, 
         female = `FEMALE`, 
         note = `NOTE`)
colnames(literacy)
head(literacy)

# split the strings to start removing repetition
literacy2 <- str_split_fixed(literacy$definition, ": ", n = 2)
literacy3 <- str_split_fixed(literacy$total, ": ", n = 2)
literacy4 <- str_split_fixed(literacy$male, ": ", n = 2)
literacy5 <- str_split_fixed(literacy$female, ": ", n = 2)

# convert to tibbles
literacy2 <- as.tibble(literacy2)
literacy3 <- as.tibble(literacy3)
literacy4 <- as.tibble(literacy4)
literacy5 <- as.tibble(literacy5)

# rename column names
literacy2 %<>% 
  rename(definition = `V2`)
literacy3 %<>% 
  rename(total = `V2`)
literacy4 %<>% 
  rename(male = `V2`)
literacy5 %<>% 
  rename(female = `V2`)

# create new data frame with only the columns of interest
fixed_literacy <- tibble("country_name" = literacy$country_name, 
                             "definition" = literacy2$definition, 
                             "total" = literacy3$total, 
                             "male" = literacy4$male, 
                             "female" = literacy5$female, 
                             "note" = literacy$note)
fixed_literacy <- as.tibble(fixed_literacy)

# merge with sovereign nations to keep only desired nations
literacy_mixed <- merge(sovereign_nations, fixed_literacy, all.x = TRUE)

# test for NAs 
sum(is.na(literacy_mixed$total))
literacy_mixed$country_name[is.na(literacy_mixed$total)]

# create smaller tibble keeping only country_name and literacy
small_literacy2 <- tibble("country_name" = literacy_mixed$country_name, 
                              "literacy" = literacy_mixed$total)

# Life Expectancy Rate ----------------------------------------------------

# import life expectancy rates data set 
library(readxl)
life_expectancy <- read_excel("~/Downloads/final_proj/raw_data/life_expectancy.xlsx")

library(tidyverse)
life_expectancy <- as_tibble(life_expectancy)

# rename columns in the data set
library(magrittr)
colnames(life_expectancy)
life_expectancy <- life_expectancy %>% 
  rename(country_name = `Country Name`, 
         life_expectancy = `Life Expectancy`)
colnames(life_expectancy)

# split the string in column 1 to put the country_name in the second column
life2 <- NA
life2 <- str_split_fixed(life_expectancy$country_name, " ", n = 2)

# convert to tibble and rename columns
life2 <- as.tibble(life2)
life2 <- life2 %>% 
  rename(country_id = `V1`, 
         country_name = `V2`) 
life2$life_expectancy <- NA

# trim the leading white spaces off of the country_name column
head(life2)
life2$country_name <- trimws(life2$country_name)

# put the life_expectancy rates into third column
library(dplyr)
life2 <- life2 %>% 
  separate(country_name, into = c("country_name", "life_expectancy"), 
           sep = "(?<=[a-zA-Z])\\s*(?=[0-9])")
head(life2)

# merge with sovereign nations to keep only desired nations
life_mixed <- merge(sovereign_nations, life2, all.x = TRUE)

# test for NAs 
sum(is.na(life_mixed$life_expectancy))
life_mixed$country_name[is.na(life_mixed$life_expectancy)]

# create smaller tibble keeping only country_name and life_expectancy 
small_life <- tibble("country_name" = life_mixed$country_name, 
                         "life_expectancy" = life_mixed$life_expectancy)

# Infant Mortality Rate ---------------------------------------------------

# import infant mortality rates data set 
library(readxl)
infant_mortality <- read_excel("~/Downloads/final_proj/raw_data/infant_mortality.xlsx")

library(tidyverse)
infant_mortality <- as_tibble(infant_mortality)

# rename columns in the data set
library(magrittr)
colnames(infant_mortality)
infant_mortality <- infant_mortality %>% 
  rename(country_name = `Country Name`, 
         infant_mortality = `Infant Mortality Rate`)
colnames(infant_mortality)

# split the string in column 1 to put the country_name in the second column
infant2 <- NA
infant2 <- str_split_fixed(infant_mortality$country_name, " ", n = 2)

# convert to tibble and rename columns
infant2 <- as.tibble(infant2)
infant2 <- infant2 %>% 
  rename(country_id = `V1`, 
         country_name = `V2`) 
infant2$infant_mortality <- NA

# trim the leading white spaces off of the country_name column
head(infant2)
infant2$country_name <- trimws(infant2$country_name)

# put the infant_mortality rates into third column
library(dplyr)
infant2 <- infant2 %>% 
  separate(country_name, into = c("country_name", "infant_mortality"), 
           sep = "(?<=[a-zA-Z])\\s*(?=[0-9])")
head(infant2)

# merge with sovereign nations to keep only desired nations
infant_mixed <- merge(sovereign_nations, infant2, all.x = TRUE)

# test for NAs 
sum(is.na(infant_mixed$infant_mortality))
infant_mixed$country_name[is.na(infant_mixed$infant_mortality)]

# create smaller tibble keeping only country_name and infant_mortality 
small_infant <- tibble("country_name" = infant_mixed$country_name, 
                           "infant_mortality" = infant_mixed$infant_mortality)

# Median Income -----------------------------------------------------------

# loading median income data 
library(readxl)
median_income <- read_excel("~/Downloads/final_proj/raw_data/median_income.xlsx")

library(tidyverse)
median_income <- as_tibble(median_income)

# renaming columns in median income data 
colnames(median_income)
median_income <- median_income %>% 
  rename(country_name = `Country Name`)
colnames(median_income)

# finding out if there is any missing data from the 2016 set 
sum(is.na(median_income$`2016`))

# merge with sovereign nations to keep only desired nations
median_mixed <- merge(sovereign_nations, median_income, all.x = TRUE)

# find out if there is still missing data from 2016 set now that we only 
# have the nations we are interested in 
sum(is.na(median_mixed$`2016`))
median_mixed$country_name[is.na(median_mixed$`2016`)]

# create a column of median_total to combine other years in to 
median_mixed$median_total <- median_mixed$`2016`

# for the countries with NAs for 2016, we will take data from 2015 instead
median_mixed$median_total[is.na(median_mixed$median_total)] <- 
  as.character(median_mixed$`2015`[is.na(median_mixed$median_total)]) 

# test for number of remaining NAs
sum(is.na(median_mixed$median_total))

# repeat but using 2014 data 
median_mixed$median_total[is.na(median_mixed$median_total)] <- 
  as.character(median_mixed$`2014`[is.na(median_mixed$median_total)]) 
sum(is.na(median_mixed$median_total))

# repeat but using 2013 data 
median_mixed$median_total[is.na(median_mixed$median_total)] <- 
  as.character(median_mixed$`2013`[is.na(median_mixed$median_total)]) 
sum(is.na(median_mixed$median_total))

# repeat but using 2012 data 
median_mixed$median_total[is.na(median_mixed$median_total)] <- 
  as.character(median_mixed$`2012`[is.na(median_mixed$median_total)]) 
sum(is.na(median_mixed$median_total))

# repeat but using 2011 data 
median_mixed$median_total[is.na(median_mixed$median_total)] <- 
  as.character(median_mixed$`2011`[is.na(median_mixed$median_total)]) 
sum(is.na(median_mixed$median_total))

# repeat but using 2010 data 
median_mixed$median_total[is.na(median_mixed$median_total)] <- 
  as.character(median_mixed$`2010`[is.na(median_mixed$median_total)]) 
sum(is.na(median_mixed$median_total))

# repeat but using 2009 data 
median_mixed$median_total[is.na(median_mixed$median_total)] <- 
  as.character(median_mixed$`2009`[is.na(median_mixed$median_total)]) 
sum(is.na(median_mixed$median_total))

# repeat but using 2008 data 
median_mixed$median_total[is.na(median_mixed$median_total)] <- 
  as.character(median_mixed$`2008`[is.na(median_mixed$median_total)]) 
sum(is.na(median_mixed$median_total))

# since we continue to having a total of 20 NAs, we will stop here

# find out what countries are still missing median income data
median_mixed$country_name[is.na(median_mixed$median_total)]

# create smaller data set with only the median_total and country_names columns
small_median_income <- tibble("country_name" = median_mixed$country_name, 
                                  "median_income" = median_mixed$median_total)

# World Happiness Rating --------------------------------------------------

# import happiness data set 
library(readxl)
happiness <- read_excel("~/Downloads/final_proj/raw_data/world_happiness_rating.xlsx")

library(tidyverse)
happiness <- as_tibble(happiness)

# rename columns in the data set
library(magrittr)
colnames(happiness)
happiness <- happiness %>% 
  rename(country_name = `Country Name`, 
         happiness_rating = `World Happiness Rating`)
colnames(happiness)

# split the string in column 1 to put the ratings in the second column
happiness <- happiness %>% 
  separate(country_name, into = c("country_name", "happiness_rating"), sep = "\\(")

# removing the white space at the end of the country name
happiness$country_name <- trimws(happiness$country_name)

# removing the parentheses at the end of the happiness rating
happiness$happiness_rating <- 
  substr(happiness$happiness_rating, 1, 
         nchar(happiness$happiness_rating)-1)

# merge with sovereign nations to keep only desired nations
happiness_mixed <- merge(sovereign_nations, happiness, all.x = TRUE)

# test for NAs 
sum(is.na(happiness_mixed))
happiness_mixed$country_name[is.na(happiness_mixed$happiness_rating)]

# Success Data ------------------------------------------------------------

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

# turn data frame into tibble
success_data <- as.tibble(success_data)




