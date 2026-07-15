# load vegan package and read csv file
install.packages("vegan")
library(vegan)
pc = read.csv("NMDS_data_updated.csv", header = TRUE)

# make community matrix; extract columns with abundance information
com = pc[,4:ncol(pc)]
m_com = as.matrix(com)

# create NMDS
set.seed(123)
nmds = metaMDS(m_com, distance = "bray")
nmds

# extract NMDS scores
data.scores = as.data.frame(scores(nmds))
data.scores$Sample = pc$Sample
data.scores$Salinity = pc[['Soil_Salinity_dS/m']]
data.scores$pH = pc$pH_Units
head(data.scores)

# plot NMDS in ggplot2
library(ggplot2)
nmds_plot = ggplot(data.scores, aes(x = NMDS1, y = NMDS2)) + 
  geom_point(size = 4, aes( shape = Salinity, colour = pH)) + 
  theme(axis.text.y = element_text(colour = "black", size = 12, face = "bold"),
        axis.text.x = element_text(colour = "black", face = "bold", size = 12), 
        legend.text = element_text(size = 12, face ="bold", colour ="black"), 
        legend.position = "right", axis.title.y = element_text(face = "bold", size = 14), 
        axis.title.x = element_text(face = "bold", size = 14, colour = "black"), 
        legend.title = element_text(size = 14, colour = "black", face = "bold"), 
        panel.background = element_blank(), 
        panel.border = element_rect(colour = "black", fill = NA, size = 1.2),
        legend.key=element_blank()) + 
  labs(x = "NMDS1", colour = "pH", y = "NMDS2", shape = "Salinity")  + 
  scale_colour_manual(values = c("#009E73", "#E69F00")) 

nmds_plot
ggsave("NMDS.svg")