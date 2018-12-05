# loading country code data 
library(readxl)
country_code <- read_excel("~/Downloads/final_proj/raw_data/country_code.xlsx")

library(tidyverse)
country_code <- as_tibble(country_code)
colnames(country_code)

# clean up data
country_code <- str_split_fixed(country_code$code, " ", 2)
country_code <- as.tibble(country_code)
colnames(country_code)
country_code <- country_code %>% 
  rename(code = `V1`, 
         country = `V2`)
colnames(country_code)

# trim the leading white spaces off of the columns
head(infant2)
country_code$country <- trimws(country_code$country)
country_code$code <- trimws(country_code$code)

# merge country_code with countries from study 
my_countries <- tibble("country" = success_na$country_name)
my_countries$country <- trimws(my_countries$country)

my_countries <- merge(my_countries, country_code, all.x = TRUE)

# merge my_countries with success data
success_code <- success_na
success_code <- success_code %>% 
  rename(country = country_name)

success_code <- merge(success_code, my_countries, all.x = TRUE)

# create map --------------------------------------------------------------
library(rworldmap)

# countries data frame 
theCountries <- success_code$code

# data frame with success and country code
sDF <- data.frame(country = success_code$code, 
                    success = success_code$success)

# join data frame to map
sMap <- joinCountryData2Map(sDF, joinCode = "ISO3",
                              nameJoinColumn = "country")

# create map
mapCountryData(malMap, nameColumnToPlot="success", catMethod = "quantiles",
               missingCountryCol = gray(.8), mapTitle = "Success of Nations")


# repeat for poli freedom  ------------------------------------------------

# data frame with success and country code
pDF <- data.frame(country = success_code$code, 
                  success = success_code$poli_freedom)

# join data frame to map
pMap <- joinCountryData2Map(pDF, joinCode = "ISO3",
                            nameJoinColumn = "country")

# create map
mapCountryData(malMap, nameColumnToPlot="success", catMethod = "quantiles",
               missingCountryCol = gray(.8), mapTitle = "Poli Freedom of Nations")


# repeat for econ freedom -------------------------------------------------

# data frame with success and country code
eDF <- data.frame(country = success_code$code, 
                  success = success_code$econ_freedom)

# join data frame to map
eMap <- joinCountryData2Map(eDF, joinCode = "ISO3",
                            nameJoinColumn = "country")

# create map
mapCountryData(malMap, nameColumnToPlot="success", catMethod = "quantiles",
               missingCountryCol = gray(.8), mapTitle = "Econ Freedom of Nations")


