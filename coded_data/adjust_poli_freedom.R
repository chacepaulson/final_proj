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
small_poli <- data.frame("country_name" = poli_freedom$country_name, 
                         "poli_freedom" = poli_freedom$poli_freedom)

