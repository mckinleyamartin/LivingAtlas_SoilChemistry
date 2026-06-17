library(ggplot2)

plot_data <- read.csv("SoilChem_NMDS.csv")
plot_data$pH <- as.numeric(plot_data$pH)
plot_data$Salinity_dS_m <- as.numeric(plot_data$Salinity_dS_m)
plot_data <- na.omit(plot_data)

ggplot(plot_data, aes(x = pH, y = Salinity_dS_m)) + 
  geom_point(size = 3, alpha = 0.7) + 
  
  geom_vline(xintercept = 5, linetype = "dashed", color = "red") + 
  geom_vline(xintercept = 7, linetype = "dashed", color = "blue") + 
  geom_vline(xintercept = 9, linetype = "dashed", color = "darkgreen") +
  
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") + 
  geom_hline(yintercept = 23.4375, linetype = "dashed", color = "blue") + 
  geom_hline(yintercept = 46.875, linetype = "dashed", color = "darkgreen") + 
  
  theme_minimal() + 
  labs(
    title = "Relationship Between Soil pH and Salinity", 
    x = "Soil pH",
    y = "Salinity (dS/m)"
  )