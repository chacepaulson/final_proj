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
small_median_income <- data.frame("country_name" = median_mixed$country_name, 
                        "median_income" = median_mixed$median_total)
