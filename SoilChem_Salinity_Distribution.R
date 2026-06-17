# Load package
library(ggplot2)

# Import table
density_function <- read.csv("CIB_Soil_Chemistry_Salinity.csv")
density_function$Salinity_dS_m <- as.numeric(density_function$Salinity_dS_m)

# Create plot
ggplot(density_function, aes(x = Salinity_dS_m)) + 
  geom_density(fill = "lightblue", alpha = 0.5) + 
  
  geom_vline(xintercept = 0, linetype = "dashed", color = "red") + 
  geom_vline(xintercept = 23.4375, linetype = "dashed", color = "blue") + 
  geom_vline(xintercept = 46.875, linetype = "dashed", color = "darkgreen") + 
  
  theme_minimal() + 
  labs(title = "Distribution of Soil Salinity Values", x = "Soil Salinity (dS/m)", 
       y = "Density"
  )