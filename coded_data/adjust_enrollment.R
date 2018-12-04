# loading enrollment data 
library(readxl)
enrollment <- read_excel("~/Downloads/final_proj/raw_data/secondary_enrollment.xlsx")

library(tidyverse)
enrollment <- as_tibble(enrollment)

# renaming columns in enrollment data 
colnames(enrollment)
enrollment <- enrollment %>% 
  rename(country_name = `Country Name`)
colnames(enrollment)

# finding out if there is any missing data from the 2016 set 
sum(is.na(enrollment$`2016`))

# merge with sovereign nations to keep only desired nations
enrollment_mixed <- merge(sovereign_nations, enrollment, all.x = TRUE)

# find out if there is still missing data from 2016 set now that we only 
# have the nations we are interested in 
sum(is.na(enrollment_mixed$`2016`))
enrollment_mixed$country_name[is.na(enrollment_mixed$`2016`)]

# create a column of median_total to combine other years in to 
enrollment_mixed$enrollment_total <- enrollment_mixed$`2016`

# for the countries with NAs for 2016, we will take data from 2015 instead
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2015`[is.na(enrollment_mixed$enrollment_total)]) 

# test for number of remaining NAs
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2014 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2014`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2013 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2013`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2012 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2012`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2011 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2011`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2010 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2010`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2009 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2009`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2008 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2008`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2007 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2007`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2006 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2006`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2005 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2005`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2004 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2004`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2003 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2003`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2002 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2002`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2001 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2001`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# repeat but using 2000 data
enrollment_mixed$enrollment_total[is.na(enrollment_mixed$enrollment_total)] <- 
  as.character(enrollment_mixed$`2000`[is.na(enrollment_mixed$enrollment_total)]) 
sum(is.na(enrollment_mixed$enrollment_total))

# since we continue to having a total of 11 NAs, we will stop here

# find out what countries are still missing median income data
enrollment_mixed$country_name[is.na(enrollment_mixed$enrollment_total)]

# create smaller data set with only the median_total and country_names columns
small_enrollment <- data.frame("country_name" = enrollment_mixed$country_name, 
                             "enrollment" = enrollment_mixed$enrollment_total)


