library(limma)

dat=as.data.frame(read.csv('Zscore.primary.TCGA.BRCA.csv', header=T, check.names = FALSE, stringsAsFactors = FALSE)) 

#Reverse log transform and make an integer

rawdata <- dat[1:16622,]

sigs <- read.delim("SS.txt", check.names=FALSE, stringsAsFactors=FALSE) ##Samples and group calls in ascending order by sig
sigs_set <- subset(sigs, Call %in% c('S1','S2','S3','S4','S5','S6')) ##Name sigs in order

library(data.table)
t_rawdata <- t(rawdata)
addcols <- t_rawdata[1,]
t_rawdata <- as.data.frame(t_rawdata)
t_rawdata$merge <- rownames(t_rawdata)

rawdata <- merge(t_rawdata, sigs_set, by.x = 'merge', by.y = 'Patient')
rawdata <- rawdata[order(rawdata$Call),]

S1 <- which(rawdata$Call == "S1")
S1 <- max(S1)-(min(S1)-1)

S2 <- which(rawdata$Call == "S2")
S2 <- max(S2)-(min(S2)-1)

S3 <- which(rawdata$Call == "S3")
S3 <- max(S3)-(min(S3)-1)

S4 <- which(rawdata$Call == "S4")
S4 <- max(S4)-(min(S4)-1)

S5 <- which(rawdata$Call == "S5")
S5 <- max(S5)-(min(S5)-1)

S6 <- which(rawdata$Call == "S6")
S6 <- max(S6)-(min(S6)-1)

for(i in 1:length(rownames(rawdata)))
{
  rawdata[i,1] = paste(rawdata[i,1], rawdata$Call[i], sep = "-")
  
}
rawdata <- rawdata[,1:16623] ##adjust for gene number - call

rawdata2 <- t(rawdata)

colnames(rawdata2) <- NULL
colnames(rawdata2) <- rawdata2[1,]
rownames(rawdata2) <- NULL
rawdata2 <- as.data.frame(rawdata2)
rawdata3 <- rawdata2[2:16623,]

colnames(addcols) <- NULL
addcols <- as.data.frame(addcols)

f_rawdata <- cbind(addcols, rawdata3)

write.table(f_rawdata, file='f_rawdata.txt', sep='\t')

finaldata = as.data.frame(read.table('f_rawdata.txt', header=T, sep='\t', stringsAsFactors = FALSE, row.names = 1)) 

rownames(finaldata) <- finaldata[,1]
finaldata=finaldata[,-c(1)]


## FIT MODEL ##
Signature <- factor(c(rep.int(1,times=S1), rep.int(2,times=S2), rep.int(3,times=S3),rep.int(4,times=S4),rep.int(5,times=S5),rep.int(6,times=S6)))

design<- model.matrix(~0+Signature)
colnames(design) <- c('Sig1','Sig2','Sig3','Sig4','Sig5','Sig6')

fit <- lmFit(finaldata, design)
fit2 <- eBayes(fit)

names(fit2)

sig.con<- makeContrasts(Sig1-Sig2,levels=design)
sig.con.fitmodel <- contrasts.fit(fit2, sig.con)
sig.con.fitmodel.eBayes <- eBayes(sig.con.fitmodel)

genes<-as.data.frame(topTable(sig.con.fitmodel.eBayes, number =1000))
genes

write.table(genes, file='sig_1_2_top100.txt', sep='\t')
