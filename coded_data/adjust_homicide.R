# loading homicide data 
library(readxl)
homicide <- read_excel("~/Downloads/final_proj/raw_data/homicide_rates.xlsx")

library(tidyverse)
homicide <- as_tibble(homicide)

# renaming columns in homicide data 
colnames(homicide)
homicide <- homicide %>% 
  rename(country_name = `Country Name`)
colnames(homicide)

# finding out if there is any missing data from the 2016 set 
sum(is.na(homicide$`2016`))

# merge with sovereign nations to keep only desired nations
homicide_mixed <- merge(sovereign_nations, homicide, all.x = TRUE)

# find out if there is still missing data from 2016 set now that we only 
# have the nations we are interested in 
sum(is.na(homicide_mixed$`2016`))
homicide_mixed$country_name[is.na(homicide_mixed$`2016`)]

# create a column of median_total to combine other years in to 
homicide_mixed$homicide_total <- homicide_mixed$`2016`

# for the countries with NAs for 2016, we will take data from 2015 instead
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2015`[is.na(homicide_mixed$homicide_total)]) 

# test for number of remaining NAs
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2014 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2014`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2013 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2013`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2012 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2012`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2011 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2011`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2010 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2010`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2009 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2009`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2008 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2008`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2007 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2007`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2006 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2006`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2005 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2005`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# repeat but using 2004 data
homicide_mixed$homicide_total[is.na(homicide_mixed$homicide_total)] <- 
  as.character(homicide_mixed$`2004`[is.na(homicide_mixed$homicide_total)]) 
sum(is.na(homicide_mixed$homicide_total))

# since we continue to having a total of 3 NAs, we will stop here

# find out what countries are still missing median income data
homicide_mixed$country_name[is.na(homicide_mixed$homicide_total)]

# create smaller data set with only the median_total and country_names columns
small_homicide <- data.frame("country_name" = homicide_mixed$country_name, 
                             "homicide" = homicide_mixed$homicide_total)
