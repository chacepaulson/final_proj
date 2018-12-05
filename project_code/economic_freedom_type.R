# effects of poli freedom type on success

# Load Poli Freedom -------------------------------------------------------
small_econ2 <- tibble("country_name" = econ_freedom$country_name, 
                      "econ_freedom" = econ_freedom$total_score)

# Combine with Sovereign Nations ------------------------------------------
success_econ <- merge(sovereign_nations, small_econ2, all.x = TRUE)


# Combine with Success ----------------------------------------------------
success_econ$success <- success_pct$success

# most free ---------------------------------------------------------------
success_econ <- success_econ %>% 
  arrange(desc(success))
success_econ$rank <- 1:196
