
library(tidyverse)
library(haven)

# tabla de casen 2020 con selección de variables y filtrada por jefatura de hogar
casen2020 = read_dta("C:/Users/Adm-Ignacio/Documents/Proyectos/clases-abiertas-r/reproducibilidad/data/casen_2020_small.dta")

# Preparar datos para visualización
tabla = casen2020 %>% 
  group_by(region) %>% 
  summarise(frecuencia = sum(expr))

# Plot de hogares según región
ggplot(data = tabla, aes(x = as.factor(region), y = frecuencia)) + 
  geom_bar(stat = "identity") + 
  geom_hline(aes(yintercept = mean(frecuencia))) +
  labs(title="Hogares según región en Casen 2020",
       x ="Región numérica", y = "Frecuencia") +
  theme(plot.title = element_text(hjust = 0.5))

# sessionInfo()