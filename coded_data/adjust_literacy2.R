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

# create new tibble with only the columns of interest
fixed_literacy <- tibble("country_name" = literacy$country_name, 
                             "definition" = literacy2$definition, 
                             "total" = literacy3$total, 
                             "male" = literacy4$male, 
                             "female" = literacy5$female, 
                             "note" = literacy$note)

# remove percent sign from data 
fixed_literacy$total <- 
  substr(fixed_literacy$total, 1, 
         nchar(fixed_literacy$total)-1)

# merge with sovereign nations to keep only desired nations
literacy_mixed <- merge(sovereign_nations, fixed_literacy, all.x = TRUE)

# test for NAs 
sum(is.na(literacy_mixed$total))
literacy_mixed$country_name[is.na(literacy_mixed$total)]

# create smaller tibble keeping only country_name and literacy
small_literacy2 <- tibble("country_name" = literacy_mixed$country_name, 
                           "literacy" = literacy_mixed$total)

