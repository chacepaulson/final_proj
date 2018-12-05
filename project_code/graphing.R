# graphing 
library(ggplot2)

ggplot(data = success_na) + 
  geom_point(mapping = aes(x = poli_freedom, y = success)) +
  geom_abline()

ggplot(data = success_na) + 
  geom_point(mapping = aes(x = econ_freedom, y = success)) +
  geom_abline()




