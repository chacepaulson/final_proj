# effects of poli freedom type on success

# Load Poli Freedom -------------------------------------------------------

small_poli2 <- tibble("country_name" = poli_freedom$country_name, 
                     "poli_freedom" = poli_freedom$poli_freedom, 
                     "poli_status" = NA)
small_poli2$poli_status <- poli_freedom$poli_status

# Combine with Sovereign Nations ------------------------------------------
success_poli <- merge(sovereign_nations, small_poli2, all.x = TRUE)


# Combine with Success ----------------------------------------------------
success_poli$success <- success_pct$success


# calculate means by type -------------------------------------------------
unique(success_poli$poli_status)
mean_nf <- 
  mean(success_poli$success[success_poli$poli_status == "NF"], na.rm = TRUE)
mean_pf <- 
  mean(success_poli$success[success_poli$poli_status == "PF"], na.rm = TRUE)
mean_f <- 
  mean(success_poli$success[success_poli$poli_status == "F"], na.rm = TRUE)

df_poli <- tibble("type" = c("NF", "PF", "F"), 
                  "mean" = c(mean_nf, mean_pf, mean_f))


# most free ---------------------------------------------------------------
success_poli <- success_poli %>% 
  arrange(desc(success))
success_poli$rank <- 1:196

# calculate lm 
lm(success ~ poli_status, data = success_poli)


