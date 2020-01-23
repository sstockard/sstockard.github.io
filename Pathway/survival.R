  
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

##SURVIVAL##

library(ggplot2)
library(ggfortify)
library(survival)
fit <- survfit(Surv(t.event, e.event) ~ Call, data = V3)
autoplot(fit,censor=FALSE,conf.int=FALSE,surv.size = 1.4) + theme_grey()
