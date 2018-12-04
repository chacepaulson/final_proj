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
