library(vegan)

NMDS_data <- read.csv("SoilChem_NMDS.csv")

NMDS_data$pH <- as.numeric(NMDS_data$pH)
NMDS_data$Salinity_dS_m <- as.numeric(NMDS_data$Salinity_dS_m)

env <- NMDS_data[, c("pH", "Salinity_dS_m")]
env <- na.omit(env)

nmds <- metaMDS(env)
plot(nmds)