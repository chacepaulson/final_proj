# graphing 
library(ggplot2)

ggplot(data = success_na) + 
  geom_point(mapping = aes(x = poli_freedom, y = success)) +
  geom_abline()

?geom_point

ggplot(data = success_na) + 
  geom_point(mapping = aes(x = econ_freedom, y = success)) +
  geom_abline()

barplot(df_region$mean, main = "sucess by regions", xlab = "region", 
        ylab = "mean", names.arg = df_region$region)




