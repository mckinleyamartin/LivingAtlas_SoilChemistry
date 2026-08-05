# Load package
library(ggplot2)

# Import table
density_function <- read.csv("CIB_Soil_Chemistry_pH.csv")
head(density_function)

# Create plot
ggplot(density_function, aes(x = pH)) + 
  geom_density(fill = "lightblue", alpha = 0.5) + 
  
  geom_vline(xintercept = 5, linetype = "dashed", color = "red") + 
  geom_vline(xintercept = 7, linetype = "dashed", color = "blue") + 
  geom_vline(xintercept = 9, linetype = "dashed", color = "darkgreen") + 
  
  theme_minimal() + 
  labs(title = "Distribution of Soil pH Values", x = "Soil pH", y = "Density"
  )
