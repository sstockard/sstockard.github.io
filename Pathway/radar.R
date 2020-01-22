  
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

V3=as.data.frame(read.delim('TCGA_clin_exposures.txt', header=T, sep='\t', check.names = FALSE, stringsAsFactors = FALSE))
V3 <- subset(V3, !is.na(V3$ClinicalSubtype_SCM))

data <- data.frame(V3$ClinicalSubtype_SCM,V3$S1,V3$S2,V3$S3,V3$S4,V3$S5)
colnames(data) <- c('Subtype','S1','S2','S3','S4','S5')

library(ggplot2)
library(ggradar)
library(ggiraph)
library(ggiraphExtra)

ggRadar(data=data, aes(color=Subtype), interactive = TRUE,label.gridline.max=TRUE)
