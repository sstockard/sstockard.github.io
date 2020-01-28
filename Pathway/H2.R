#H2 NORM

library(ggplot2)
library(gridExtra)
library(cowplot)
library(reshape)

source("http://peterhaschke.com/Code/multiplot.R")

exmelt1 <- data.frame(V3$H2.norm, V3$S1, V3$S2, V3$S3, V3$S4, V3$S5)
colnames(exmelt1) <- c('H2.norm','S1','S2','S3','S4','S5')
melt1 <- melt(exmelt1, id.vars="H2.norm")


p1 <-ggplot(data= melt1, aes(x=value, y=H2.norm, group = variable, colour = variable)) +
  ggtitle("H2.norm") +
  geom_smooth(method = lm, fullrange = TRUE, alpha = .15, size=2) +
  xlab("H2.norm") +
  ylab("Exposure") +
  labs(color='Signature') +
  theme_grey()

ggsave("p1.png", plot = p1, dpi = 300)
