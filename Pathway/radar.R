V3=as.data.frame(read.delim('TCGA_clin_exposures.txt', header=T, sep='\t', check.names = FALSE, stringsAsFactors = FALSE))
V3 <- subset(V3, !is.na(V3$ClinicalSubtype_SCM))

data <- data.frame(V3$ClinicalSubtype_SCM,V3$S1,V3$S2,V3$S3,V3$S4,V3$S5)
colnames(data) <- c('Subtype','S1','S2','S3','S4','S5')

library(ggplot2)
library(ggradar)
library(ggiraph)
library(ggiraphExtra)

ggRadar(data=data, aes(color=Subtype), interactive = TRUE,label.gridline.max=TRUE)
