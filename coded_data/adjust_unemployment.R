# import unemployment data 
library(readxl)
unemployment <- read_excel("~/Downloads/final_proj/raw_data/unemployment.xlsx")

# renaming columns 
unemployment <- unemployment %>% 
  rename(country_name = `Country`, 
         unemployment_rate = `%`, 
         date = `Date of Info`)

# create small data set with just country_name and unemployment rate
small_unemployment <- data.frame("country_name" = unemployment$country_name, 
                         "unemployment" = unemployment$unemployment_rate)
