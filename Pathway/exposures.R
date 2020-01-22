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

library(ggplot)

V3=as.data.frame(read.delim('TCGA_clin_exposures.txt', header=T, sep='\t', check.names = FALSE, stringsAsFactors = FALSE))

exposure1 = data.frame(V3$merge,V3$S1,V3$S2,V3$S3,V3$S4,V3$S5,V3$Call)
colnames(exposure1) <- c('Patient','S1','S2','S3','S4','S5','Call')
exposure2 <- exposure1[order(exposure1$Call),] 
exposure = data.frame(exposure2$Patient,exposure2$S1,exposure2$S2,exposure2$S3,exposure2$S4, exposure2$S5)
rownames(exposure) <- exposure[,1]
exposure <- exposure[,-c(1)]
colnames(exposure) <- c('S1','S2','S3','S4','S5')

t_exposure <- t(exposure) #transpose

write.table(t_exposure, file='exposure.txt', sep='\t') #write transposed table

exposure2=as.data.frame(read.table('exposure.txt', header=T, sep='\t')) #read in transpose table

library(reshape)
melt <- melt(cbind(exposure2, ind = rownames(exposure2)), id.vars = c('ind'))

library(scales)
ggplot(melt,aes(x = variable, y = value,fill = ind)) + 
  geom_bar(position = "fill",stat = "identity") +
  scale_y_continuous(labels = percent_format()) +
  theme_grey()
