# import literacy rates data set 
library(readxl)
happiness <- read_excel("~/Downloads/final_proj/raw_data/world_happiness_rating.xlsx")

library(tidyverse)
happiness <- as_tibble(happiness)

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

