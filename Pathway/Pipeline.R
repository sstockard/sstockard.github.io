########## FILE GENERATION ###########

#import signature exposures#
exposures=as.data.frame(read.delim('MB_sample_exposure.txt', header=T, sep='\t', check.names = FALSE, stringsAsFactors = FALSE))
exposures$merge <- rownames(exposures)

#import expression data#
data =as.data.frame(read.delim('Metabric_ExpressionSymbol_Final.txt', header=T, sep='\t', check.names = FALSE, stringsAsFactors = FALSE)) 

#transform tables#
t_data <- t(data)
t_data <- as.data.frame(t_data)
t_data$merge <- rownames(t_data)
data2 <- merge(t_data, exposures, by.x='merge',by.y='merge')
data2 <- t(data2)
data2 <- as.data.frame(data2)
write.table(data2, file='data2.txt', sep='\t') 
data2=as.data.frame(read.table('data2.txt', header=T, sep='\t',stringsAsFactors = F))
colnames(data2) <- data2[1,]
data2 <- data2[-c(1),]
data2[is.na(data2)] <- 0

expression = data2[-c(1:4),]

#generate .cls files#
S1 <- as.numeric(data2[19305,])
S2 <- as.numeric(data2[19306,])
S3 <- as.numeric(data2[19307,])
S4 <- as.numeric(data2[19308,])
S5 <- as.numeric(data2[19309,])

########## VISUALIZATION ###########

##make empty data frames##

mat_ES <- data.frame(S1=double(),
                     S2=double(),
                     S3=double(),
                     S4=double(),
                     S5=double(),
                     S6=double())

mat_pval <- data.frame(S1=double(),
                       S2=double(),
                       S3=double(),
                       S4=double(),
                       S5=double(),
                       S6=double())

##S1##

setwd('/Users/sincl/OneDrive/Desktop/Sigs/CNSig Results/CNSig Results/2020-01-06_TCGA-Test/Sig1_Hallmark')

S1neg <- as.data.frame(read.table('gsea_report_for_Sig1_neg_1579114699323.xls', header=T, sep='\t',stringsAsFactors = FALSE))
S1pos <- as.data.frame(read.table('gsea_report_for_Sig1_pos_1579114699323.xls', header=T, sep='\t',stringsAsFactors = FALSE))
all <- rbind(S1neg,S1pos)
rownames(all) <- all[,1]

mat_ES[1,1] <- all[grepl('IL6',rownames(all)),6]
mat_ES[2,1] <- all[grepl('IL2',rownames(all)),6]
mat_ES[3,1] <- all[grepl('INFLAMMATORY',rownames(all)),6]
mat_ES[4,1] <- all[grepl('COMPLEMENT',rownames(all)),6]
mat_ES[5,1] <- all[grepl('ALPHA',rownames(all)),6]
mat_ES[6,1] <- all[grepl('GAMMA',rownames(all)),6]
mat_ES[7,1] <- all[grepl('ADIPOGENESIS',rownames(all)),6]
mat_ES[8,1] <- all[grepl('FATTY',rownames(all)),6]
mat_ES[9,1] <- all[grepl('XENOBIOTIC',rownames(all)),6]
mat_ES[10,1] <- all[grepl('PEROXISOME',rownames(all)),6]
mat_ES[11,1] <- all[grepl('REACTIVE',rownames(all)),6]
mat_ES[12,1] <- all[grepl('HYPOXIA',rownames(all)),6]
mat_ES[13,1] <- all[grepl('ANGIOGENESIS',rownames(all)),6]
mat_ES[14,1] <- all[grepl('NOTCH',rownames(all)),6]
mat_ES[15,1] <- all[grepl('SECRETION',rownames(all)),6]
mat_ES[16,1] <- all[grepl('ANDROGEN',rownames(all)),6]
mat_ES[17,1] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),6]
mat_ES[18,1] <- all[grepl('HEDGEHOG',rownames(all)),6]
mat_ES[19,1] <- all[grepl('TRANSITION',rownames(all)),6]
mat_ES[20,1] <- all[grepl('REPAIR',rownames(all)),6]

mat_pval[1,1] <- all[grepl('IL6',rownames(all)),8]
mat_pval[2,1] <- all[grepl('IL2',rownames(all)),8]
mat_pval[3,1] <- all[grepl('INFLAMMATORY',rownames(all)),8]
mat_pval[4,1] <- all[grepl('COMPLEMENT',rownames(all)),8]
mat_pval[5,1] <- all[grepl('ALPHA',rownames(all)),8]
mat_pval[6,1] <- all[grepl('GAMMA',rownames(all)),8]
mat_pval[7,1] <- all[grepl('ADIPOGENESIS',rownames(all)),8]
mat_pval[8,1] <- all[grepl('FATTY',rownames(all)),8]
mat_pval[9,1] <- all[grepl('XENOBIOTIC',rownames(all)),8]
mat_pval[10,1] <- all[grepl('PEROXISOME',rownames(all)),8]
mat_pval[11,1] <- all[grepl('REACTIVE',rownames(all)),8]
mat_pval[12,1] <- all[grepl('HYPOXIA',rownames(all)),8]
mat_pval[13,1] <- all[grepl('ANGIOGENESIS',rownames(all)),8]
mat_pval[14,1] <- all[grepl('NOTCH',rownames(all)),8]
mat_pval[15,1] <- all[grepl('SECRETION',rownames(all)),8]
mat_pval[16,1] <- all[grepl('ANDROGEN',rownames(all)),8]
mat_pval[17,1] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),8]
mat_pval[18,1] <- all[grepl('HEDGEHOG',rownames(all)),8]
mat_pval[19,1] <- all[grepl('TRANSITION',rownames(all)),8]
mat_pval[20,1] <- all[grepl('REPAIR',rownames(all)),8]

##S2##

setwd('/Users/sincl/OneDrive/Desktop/Sigs/CNSig Results/CNSig Results/2020-01-06_TCGA-Test/Sig2_Hallmark')

S2neg <- as.data.frame(read.table('gsea_report_for_Sig2_neg_1579114860157.xls', header=T, sep='\t',stringsAsFactors = FALSE))
S2pos <- as.data.frame(read.table('gsea_report_for_Sig2_pos_1579114860157.xls', header=T, sep='\t',stringsAsFactors = FALSE))
all <- rbind(S2neg,S2pos)
rownames(all) <- all[,1]

mat_ES[1,2] <- all[grepl('IL6',rownames(all)),6]
mat_ES[2,2] <- all[grepl('IL2',rownames(all)),6]
mat_ES[3,2] <- all[grepl('INFLAMMATORY',rownames(all)),6]
mat_ES[4,2] <- all[grepl('COMPLEMENT',rownames(all)),6]
mat_ES[5,2] <- all[grepl('ALPHA',rownames(all)),6]
mat_ES[6,2] <- all[grepl('GAMMA',rownames(all)),6]
mat_ES[7,2] <- all[grepl('ADIPOGENESIS',rownames(all)),6]
mat_ES[8,2] <- all[grepl('FATTY',rownames(all)),6]
mat_ES[9,2] <- all[grepl('XENOBIOTIC',rownames(all)),6]
mat_ES[10,2] <- all[grepl('PEROXISOME',rownames(all)),6]
mat_ES[11,2] <- all[grepl('REACTIVE',rownames(all)),6]
mat_ES[12,2] <- all[grepl('HYPOXIA',rownames(all)),6]
mat_ES[13,2] <- all[grepl('ANGIOGENESIS',rownames(all)),6]
mat_ES[14,2] <- all[grepl('NOTCH',rownames(all)),6]
mat_ES[15,2] <- all[grepl('SECRETION',rownames(all)),6]
mat_ES[16,2] <- all[grepl('ANDROGEN',rownames(all)),6]
mat_ES[17,2] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),6]
mat_ES[18,2] <- all[grepl('HEDGEHOG',rownames(all)),6]
mat_ES[19,2] <- all[grepl('TRANSITION',rownames(all)),6]
mat_ES[20,2] <- all[grepl('REPAIR',rownames(all)),6]

mat_pval[1,2] <- all[grepl('IL6',rownames(all)),8]
mat_pval[2,2] <- all[grepl('IL2',rownames(all)),8]
mat_pval[3,2] <- all[grepl('INFLAMMATORY',rownames(all)),8]
mat_pval[4,2] <- all[grepl('COMPLEMENT',rownames(all)),8]
mat_pval[5,2] <- all[grepl('ALPHA',rownames(all)),8]
mat_pval[6,2] <- all[grepl('GAMMA',rownames(all)),8]
mat_pval[7,2] <- all[grepl('ADIPOGENESIS',rownames(all)),8]
mat_pval[8,2] <- all[grepl('FATTY',rownames(all)),8]
mat_pval[9,2] <- all[grepl('XENOBIOTIC',rownames(all)),8]
mat_pval[10,2] <- all[grepl('PEROXISOME',rownames(all)),8]
mat_pval[11,2] <- all[grepl('REACTIVE',rownames(all)),8]
mat_pval[12,2] <- all[grepl('HYPOXIA',rownames(all)),8]
mat_pval[13,2] <- all[grepl('ANGIOGENESIS',rownames(all)),8]
mat_pval[14,2] <- all[grepl('NOTCH',rownames(all)),8]
mat_pval[15,2] <- all[grepl('SECRETION',rownames(all)),8]
mat_pval[16,2] <- all[grepl('ANDROGEN',rownames(all)),8]
mat_pval[17,2] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),8]
mat_pval[18,2] <- all[grepl('HEDGEHOG',rownames(all)),8]
mat_pval[19,2] <- all[grepl('TRANSITION',rownames(all)),8]
mat_pval[20,2] <- all[grepl('REPAIR',rownames(all)),8]

##S3##

setwd('/Users/sincl/OneDrive/Desktop/Sigs/CNSig Results/CNSig Results/2020-01-06_TCGA-Test/Sig3_Hallmark')

S3neg <- as.data.frame(read.table('gsea_report_for_Sig3_neg_1579115169846.xls', header=T, sep='\t',stringsAsFactors = FALSE))
S3pos <- as.data.frame(read.table('gsea_report_for_Sig3_pos_1579115169846.xls', header=T, sep='\t',stringsAsFactors = FALSE))
all <- rbind(S3neg,S3pos)
rownames(all) <- all[,1]

mat_ES[1,3] <- all[grepl('IL6',rownames(all)),6]
mat_ES[2,3] <- all[grepl('IL2',rownames(all)),6]
mat_ES[3,3] <- all[grepl('INFLAMMATORY',rownames(all)),6]
mat_ES[4,3] <- all[grepl('COMPLEMENT',rownames(all)),6]
mat_ES[5,3] <- all[grepl('ALPHA',rownames(all)),6]
mat_ES[6,3] <- all[grepl('GAMMA',rownames(all)),6]
mat_ES[7,3] <- all[grepl('ADIPOGENESIS',rownames(all)),6]
mat_ES[8,3] <- all[grepl('FATTY',rownames(all)),6]
mat_ES[9,3] <- all[grepl('XENOBIOTIC',rownames(all)),6]
mat_ES[10,3] <- all[grepl('PEROXISOME',rownames(all)),6]
mat_ES[11,3] <- all[grepl('REACTIVE',rownames(all)),6]
mat_ES[12,3] <- all[grepl('HYPOXIA',rownames(all)),6]
mat_ES[13,3] <- all[grepl('ANGIOGENESIS',rownames(all)),6]
mat_ES[14,3] <- all[grepl('NOTCH',rownames(all)),6]
mat_ES[15,3] <- all[grepl('SECRETION',rownames(all)),6]
mat_ES[16,3] <- all[grepl('ANDROGEN',rownames(all)),6]
mat_ES[17,3] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),6]
mat_ES[18,3] <- all[grepl('HEDGEHOG',rownames(all)),6]
mat_ES[19,3] <- all[grepl('TRANSITION',rownames(all)),6]
mat_ES[20,3] <- all[grepl('REPAIR',rownames(all)),6]

mat_pval[1,3] <- all[grepl('IL6',rownames(all)),8]
mat_pval[2,3] <- all[grepl('IL2',rownames(all)),8]
mat_pval[3,3] <- all[grepl('INFLAMMATORY',rownames(all)),8]
mat_pval[4,3] <- all[grepl('COMPLEMENT',rownames(all)),8]
mat_pval[5,3] <- all[grepl('ALPHA',rownames(all)),8]
mat_pval[6,3] <- all[grepl('GAMMA',rownames(all)),8]
mat_pval[7,3] <- all[grepl('ADIPOGENESIS',rownames(all)),8]
mat_pval[8,3] <- all[grepl('FATTY',rownames(all)),8]
mat_pval[9,3] <- all[grepl('XENOBIOTIC',rownames(all)),8]
mat_pval[10,3] <- all[grepl('PEROXISOME',rownames(all)),8]
mat_pval[11,3] <- all[grepl('REACTIVE',rownames(all)),8]
mat_pval[12,3] <- all[grepl('HYPOXIA',rownames(all)),8]
mat_pval[13,3] <- all[grepl('ANGIOGENESIS',rownames(all)),8]
mat_pval[14,3] <- all[grepl('NOTCH',rownames(all)),8]
mat_pval[15,3] <- all[grepl('SECRETION',rownames(all)),8]
mat_pval[16,3] <- all[grepl('ANDROGEN',rownames(all)),8]
mat_pval[17,3] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),8]
mat_pval[18,3] <- all[grepl('HEDGEHOG',rownames(all)),8]
mat_pval[19,3] <- all[grepl('TRANSITION',rownames(all)),8]
mat_pval[20,3] <- all[grepl('REPAIR',rownames(all)),8]

##S4##

setwd('/Users/sincl/OneDrive/Desktop/Sigs/CNSig Results/CNSig Results/2020-01-06_TCGA-Test/Sig4_Hallmark')

S4neg <- as.data.frame(read.table('gsea_report_for_Sig4_neg_1579115429123.xls', header=T, sep='\t',stringsAsFactors = FALSE))
S4pos <- as.data.frame(read.table('gsea_report_for_Sig4_pos_1579115429123.xls', header=T, sep='\t',stringsAsFactors = FALSE))
all <- rbind(S4neg,S4pos)
rownames(all) <- all[,1]

mat_ES[1,4] <- all[grepl('IL6',rownames(all)),6]
mat_ES[2,4] <- all[grepl('IL2',rownames(all)),6]
mat_ES[3,4] <- all[grepl('INFLAMMATORY',rownames(all)),6]
mat_ES[4,4] <- all[grepl('COMPLEMENT',rownames(all)),6]
mat_ES[5,4] <- all[grepl('ALPHA',rownames(all)),6]
mat_ES[6,4] <- all[grepl('GAMMA',rownames(all)),6]
mat_ES[7,4] <- all[grepl('ADIPOGENESIS',rownames(all)),6]
mat_ES[8,4] <- all[grepl('FATTY',rownames(all)),6]
mat_ES[9,4] <- all[grepl('XENOBIOTIC',rownames(all)),6]
mat_ES[10,4] <- all[grepl('PEROXISOME',rownames(all)),6]
mat_ES[11,4] <- all[grepl('REACTIVE',rownames(all)),6]
mat_ES[12,4] <- all[grepl('HYPOXIA',rownames(all)),6]
mat_ES[13,4] <- all[grepl('ANGIOGENESIS',rownames(all)),6]
mat_ES[14,4] <- all[grepl('NOTCH',rownames(all)),6]
mat_ES[15,4] <- all[grepl('SECRETION',rownames(all)),6]
mat_ES[16,4] <- all[grepl('ANDROGEN',rownames(all)),6]
mat_ES[17,4] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),6]
mat_ES[18,4] <- all[grepl('HEDGEHOG',rownames(all)),6]
mat_ES[19,4] <- all[grepl('TRANSITION',rownames(all)),6]
mat_ES[20,4] <- all[grepl('REPAIR',rownames(all)),6]

mat_pval[1,4] <- all[grepl('IL6',rownames(all)),8]
mat_pval[2,4] <- all[grepl('IL2',rownames(all)),8]
mat_pval[3,4] <- all[grepl('INFLAMMATORY',rownames(all)),8]
mat_pval[4,4] <- all[grepl('COMPLEMENT',rownames(all)),8]
mat_pval[5,4] <- all[grepl('ALPHA',rownames(all)),8]
mat_pval[6,4] <- all[grepl('GAMMA',rownames(all)),8]
mat_pval[7,4] <- all[grepl('ADIPOGENESIS',rownames(all)),8]
mat_pval[8,4] <- all[grepl('FATTY',rownames(all)),8]
mat_pval[9,4] <- all[grepl('XENOBIOTIC',rownames(all)),8]
mat_pval[10,4] <- all[grepl('PEROXISOME',rownames(all)),8]
mat_pval[11,4] <- all[grepl('REACTIVE',rownames(all)),8]
mat_pval[12,4] <- all[grepl('HYPOXIA',rownames(all)),8]
mat_pval[13,4] <- all[grepl('ANGIOGENESIS',rownames(all)),8]
mat_pval[14,4] <- all[grepl('NOTCH',rownames(all)),8]
mat_pval[15,4] <- all[grepl('SECRETION',rownames(all)),8]
mat_pval[16,4] <- all[grepl('ANDROGEN',rownames(all)),8]
mat_pval[17,4] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),8]
mat_pval[18,4] <- all[grepl('HEDGEHOG',rownames(all)),8]
mat_pval[19,4] <- all[grepl('TRANSITION',rownames(all)),8]
mat_pval[20,4] <- all[grepl('REPAIR',rownames(all)),8]

##S5##

setwd('/Users/sincl/OneDrive/Desktop/Sigs/CNSig Results/CNSig Results/2020-01-06_TCGA-Test/Sig5_Hallmark')

S5neg <- as.data.frame(read.table('gsea_report_for_Sig5_neg_1579115691722.xls', header=T, sep='\t',stringsAsFactors = FALSE))
S5pos <- as.data.frame(read.table('gsea_report_for_Sig5_pos_1579115691722.xls', header=T, sep='\t',stringsAsFactors = FALSE))
all <- rbind(S5neg,S5pos)
rownames(all) <- all[,1]

mat_ES[1,5] <- all[grepl('IL6',rownames(all)),6]
mat_ES[2,5] <- all[grepl('IL2',rownames(all)),6]
mat_ES[3,5] <- all[grepl('INFLAMMATORY',rownames(all)),6]
mat_ES[4,5] <- all[grepl('COMPLEMENT',rownames(all)),6]
mat_ES[5,5] <- all[grepl('ALPHA',rownames(all)),6]
mat_ES[6,5] <- all[grepl('GAMMA',rownames(all)),6]
mat_ES[7,5] <- all[grepl('ADIPOGENESIS',rownames(all)),6]
mat_ES[8,5] <- all[grepl('FATTY',rownames(all)),6]
mat_ES[9,5] <- all[grepl('XENOBIOTIC',rownames(all)),6]
mat_ES[10,5] <- all[grepl('PEROXISOME',rownames(all)),6]
mat_ES[11,5] <- all[grepl('REACTIVE',rownames(all)),6]
mat_ES[12,5] <- all[grepl('HYPOXIA',rownames(all)),6]
mat_ES[13,5] <- all[grepl('ANGIOGENESIS',rownames(all)),6]
mat_ES[14,5] <- all[grepl('NOTCH',rownames(all)),6]
mat_ES[15,5] <- all[grepl('SECRETION',rownames(all)),6]
mat_ES[16,5] <- all[grepl('ANDROGEN',rownames(all)),6]
mat_ES[17,5] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),6]
mat_ES[18,5] <- all[grepl('HEDGEHOG',rownames(all)),6]
mat_ES[19,5] <- all[grepl('TRANSITION',rownames(all)),6]
mat_ES[20,5] <- all[grepl('REPAIR',rownames(all)),6]

mat_pval[1,5] <- all[grepl('IL6',rownames(all)),8]
mat_pval[2,5] <- all[grepl('IL2',rownames(all)),8]
mat_pval[3,5] <- all[grepl('INFLAMMATORY',rownames(all)),8]
mat_pval[4,5] <- all[grepl('COMPLEMENT',rownames(all)),8]
mat_pval[5,5] <- all[grepl('ALPHA',rownames(all)),8]
mat_pval[6,5] <- all[grepl('GAMMA',rownames(all)),8]
mat_pval[7,5] <- all[grepl('ADIPOGENESIS',rownames(all)),8]
mat_pval[8,5] <- all[grepl('FATTY',rownames(all)),8]
mat_pval[9,5] <- all[grepl('XENOBIOTIC',rownames(all)),8]
mat_pval[10,5] <- all[grepl('PEROXISOME',rownames(all)),8]
mat_pval[11,5] <- all[grepl('REACTIVE',rownames(all)),8]
mat_pval[12,5] <- all[grepl('HYPOXIA',rownames(all)),8]
mat_pval[13,5] <- all[grepl('ANGIOGENESIS',rownames(all)),8]
mat_pval[14,5] <- all[grepl('NOTCH',rownames(all)),8]
mat_pval[15,5] <- all[grepl('SECRETION',rownames(all)),8]
mat_pval[16,5] <- all[grepl('ANDROGEN',rownames(all)),8]
mat_pval[17,5] <- all[grepl('KRAS_SIGNALING_UP',rownames(all)),8]
mat_pval[18,5] <- all[grepl('HEDGEHOG',rownames(all)),8]
mat_pval[19,5] <- all[grepl('TRANSITION',rownames(all)),8]
mat_pval[20,5] <- all[grepl('REPAIR',rownames(all)),8]

mat_ES_order <- data.frame(mat_ES$S1,mat_ES$S2,mat_ES$S3,mat_ES$S4,mat_ES$S5)
mat_pval_order <- data.frame(mat_pval$S1,mat_pval$S2,mat_pval$S3,mat_pval$S4,mat_pval$S5)

rownames(mat_ES_order) <- c('IL6_JAKSTAT3','IL2_STAT5','INFLAMMATORY RESPONSE','COMPLEMENT','IFN-A','IFN-G','ADIPOGENESIS','FATTY ACID METABOLISM','XENOBIOTiC METABOLISM','PEROXISOME','REACTIVE OXYGEN SPECIES','HYPOXIA','ANGIOGENESIS','NOTCH SIGNALING','PROTEIN SECRETION','ANDROGEN RESPONSE','KRAS','HEDGEHOG','EMT','DNA REPAIR')
colnames(mat_ES_order) <- c('S1','S2','S3','S4','S5')
rownames(mat_pval_order) <- c('IL6_JAKSTAT3','IL2_STAT5','INFLAMMATORY RESPONSE','COMPLEMENT','IFN-A','IFN-G','ADIPOGENESIS','FATTY ACID METABOLISM','XENOBIOTiC METABOLISM','PEROXISOME','REACTIVE OXYGEN SPECIES','HYPOXIA','ANGIOGENESIS','NOTCH SIGNALING','PROTEIN SECRETION','ANDROGEN RESPONSE','KRAS','HEDGEHOG','EMT','DNA REPAIR')
colnames(mat_pval_order) <- c('S1','S2','S3','S4','S5')


library(corrplot)

corrplot(e_matrix, is.corr = FALSE, method = "color", p.mat = p_matrix, insig = "label_sig", sig.level = .05, pch.cex = 3, pch.col = "white",tl.col="black", cl.length=3,cl.lim=c(-3.3,3.3),cl.align.text = "l",cl.offset=.8)
