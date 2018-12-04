# import literacy rates data set 
library(readxl)
literacy <- read_excel("~/Downloads/final_proj/raw_data/literacy_rates.xlsx")

library(tidyverse)
literacy <- as_tibble(literacy)

library(magrittr)
colnames(literacy)
literacy <- literacy %>% 
  rename(country_name = `Country Name`)

# finding out if there is any missing data from the 2016 set 
sum(is.na(literacy$`2016`))

# merge with sovereign nations to keep only desired nations
literacy_mixed <- merge(sovereign_nations, literacy, all.x = TRUE)

# find out if there is still missing data from 2016 set now that we only 
# have the nations we are interested in 
sum(is.na(literacy_mixed$`2016`))
literacy_mixed$country_name[is.na(literacy_mixed$`2016`)]
literacy_mixed$country_name[is.na(literacy_mixed$literacy_total)]

# create a column of literacy_total to combine other years in to 
literacy_mixed$literacy_total <- literacy_mixed$`2016`

# for the countries with NAs for 2016, we will take data from 2015 instead
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2015`[is.na(literacy_mixed$literacy_total)]) 

# test for number of remaining NAs
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2014 data 
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2014`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2013 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2013`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2012 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2012`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2011 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2011`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2010 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2010`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2009 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2009`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2008 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2008`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2007 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2007`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2006 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2006`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2005 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2005`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2004 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2004`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2003 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2003`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2002 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2002`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2001 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2001`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# repeat but using 2000 data
literacy_mixed$literacy_total[is.na(literacy_mixed$literacy_total)] <- 
  as.character(literacy_mixed$`2000`[is.na(literacy_mixed$literacy_total)])
sum(is.na(literacy_mixed$literacy_total))

# find out what countries are still missing literacy data
literacy_mixed$country_name[is.na(literacy_mixed$literacy_total)]

# create smaller data set with only the literacy_total and country_names columns
small_literacy <- data.frame("country_name" = literacy_mixed$country_name, 
                        "literacy" = literacy_mixed$literacy_total)


