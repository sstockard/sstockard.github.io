##MERGE CLINICAL##

tcga=as.data.frame(read.delim('TCGA_Clin.txt', header=T, sep='\t', check.names = FALSE, stringsAsFactors = FALSE))

exposure=as.data.frame(read.delim('TCGA-Test_sigExposureMatrix.txt', header=T, sep='\t', check.names = FALSE, stringsAsFactors = FALSE))

exposure$merge <- rownames(exposure)

x <- merge(tcga,exposure,by.x='merge',by.y='merge')

x$Call <- ifelse((x$S1 > x$S2 & x$S1 > x$S3 & x$S1 > x$S4 & x$S1 & x$S1 > x$S5), "S1",
                 ifelse((x$S2 > x$S1 & x$S2 > x$S3 & x$S2 > x$S4 & x$S2 > x$S5), "S2",
                        ifelse((x$S3 > x$S1 & x$S3 > x$S2 & x$S3 > x$S4 & x$S3 > x$S5), "S3",
                               ifelse((x$S4 > x$S1 & x$S4 > x$S2 & x$S4 > x$S3 & x$S4 > x$S5), "S4",
                                      ifelse((x$S5 > x$S1 & x$S5 > x$S2 & x$S5 > x$S3 & x$S5 > x$S4), "S5", "error")))))

write.table(x, file='TCGA_clin_exposures.txt', sep='\t', row.names=F)

###

##VISUAL##

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
