# basic statistics --------------------------------------------------------
mean(success_na$success) 
# 0.6117207

min(success_na$success) 
# 0.3012778

success_na %>% top_n(-1) 
# South Sudan

max(success_na$success) 
# 0.9071793

success_na %>% top_n(1) 
# Tawain 

# find rank ---------------------------------------------------------------

# arrange data by success
success_order <- success_na %>% 
  arrange(desc(success))
nrow(success_order)
success_order$rank <- 1:179

# find the least successful countries
success_bot <- success_na %>% top_n(-10)

# find the most successful countries
success_top <- success_na %>% top_n(10)

# create tibbles keeping only countries and success scores
success_bot2 <- tibble("country" = success_bot$country_name, 
                       "success" = success_bot$success)
success_top2 <- tibble("country" = success_top$country_name, 
                       "success" = success_top$success)


