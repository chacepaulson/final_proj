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
small_gdp <- data.frame("country_name" = gdp_mixed$country_name, 
                         "gdp" = gdp_mixed$gdp_total)
