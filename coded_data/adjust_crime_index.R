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
small_crime <- data.frame("country_name" = crime_mixed$country_name, 
                          "crime_index" = crime_mixed$crime_index)

