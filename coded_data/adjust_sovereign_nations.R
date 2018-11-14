# import sovereign nations data set 

library(readxl)
sovereign_nations <- read_excel("~/Downloads/final_proj/raw_data/sovereign_nations.xlsx")
View(sovereign_nations)

sovereign_nations <- sovereign_nations %>% 
  rename(country_name = `Soverign Nations`)

