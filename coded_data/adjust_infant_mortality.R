# import infant mortality rates data set 
library(readxl)
infant_mortality <- read_excel("~/Downloads/final_proj/raw_data/infant_mortality.xlsx")

library(tidyverse)
infant_mortality <- as_tibble(infant_mortality)

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
small_infant <- data.frame("country_name" = infant_mixed$country_name, 
                           "infant_mortality" = infant_mixed$infant_mortality)
