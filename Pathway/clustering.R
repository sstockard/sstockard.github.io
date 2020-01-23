setwd('/Users/sincl/OneDrive/Desktop/Sigs')
list.files()

library(ggplot2)


##ALL DATA

exposure=as.data.frame(read.table('sample_exposure.txt', header=T, sep='\t', row.names = 1)) #df with samples as rows and sigs as cols

t_exposure <- t(exposure) #transpose

write.table(t_exposure, file='exposure.txt', sep='\t') #write transposed table

exposure2=as.data.frame(read.table('exposure.txt', header=T, sep='\t')) #read in transpose table

library(reshape)
melt <- melt(cbind(exposure2, ind = rownames(exposure2)), id.vars = c('ind'))

library(scales)
ggplot(melt,aes(x = variable, y = value,fill = ind)) + 
  geom_bar(position = "fill",stat = "identity") +
  scale_y_continuous(labels = percent_format())

original_call <- as.data.frame(read.table('TCGABreast_TotalDataset_CNSig_Call.txt', header=T, sep='\t'))


##CLUSTER GROUPS

S2s=as.data.frame(read.table('S2s.txt', header=T, sep='\t', row.names = 1)) #df with samples as rows and sigs as cols

t_S2s <- t(S2s) #transpose

write.table(t_S2s, file='t_S2s.txt', sep='\t') #write transposed table

S2s=as.data.frame(read.table('t_S2s.txt', header=T, sep='\t')) #read in transpose table

deuc <- dist(t(S2s))

clust_df2 <- hclust(deuc, method='ward.D')
plot(clust_df2)

groups1 <- cutree(clust_df2, 6)

clust_df2 <- as.data.frame(groups1)

clust_df2 <- data.frame(names = row.names(clust_df2), clust_df2)
merged2 <- merge(clust_df2, original_call, by.x = 'names', by.y = 'Sample')

Anewdf <- data.frame(merged2$names, merged2$Call, merged2$groups1)
Anewdf2 <- data.frame(merged2$names, merged2$Call)
Anewdf3 <- data.frame(merged2$names, merged2$groups1)

grp_1 <- subset(Anewdf3, merged2.groups1 == '1')
grp_1 <- grp_1 %>% remove_rownames %>% column_to_rownames(var="merged2.names")
grp_1 <- row.names(grp_1)

grp_2 <- subset(Anewdf3, merged2.groups1 == '2')
grp_2 <- grp_2 %>% remove_rownames %>% column_to_rownames(var="merged2.names")
grp_2 <- row.names(grp_2)

grp_3 <- subset(Anewdf3, merged2.groups1 == '3')
grp_3 <- grp_3 %>% remove_rownames %>% column_to_rownames(var="merged2.names")
grp_3 <- row.names(grp_3)

grp_4 <- subset(Anewdf3, merged2.groups1 == '4')
grp_4 <- grp_4 %>% remove_rownames %>% column_to_rownames(var="merged2.names")
grp_4 <- row.names(grp_4)

grp_5 <- subset(Anewdf3, merged2.groups1 == '5')
grp_5 <- grp_5 %>% remove_rownames %>% column_to_rownames(var="merged2.names")
grp_5 <- row.names(grp_5)

grp_6 <- subset(Anewdf3, merged2.groups1 == '6')
grp_6 <- grp_6 %>% remove_rownames %>% column_to_rownames(var="merged2.names")
grp_6 <- row.names(grp_6)

##GRP1

ex1 <- exposure2[,grp_1]
melt1 <- melt(cbind(ex1, ind = rownames(ex1)), id.vars = c('ind'))

ggplot(melt1,aes(x = variable, y = value,fill = ind)) + 
  geom_bar(position = "fill",stat = "identity") +
  scale_y_continuous(labels = percent_format())

##GRP2
ex2 <- exposure2[,grp_2]
melt2 <- melt(cbind(ex2, ind = rownames(ex2)), id.vars = c('ind'))

ggplot(melt2,aes(x = variable, y = value,fill = ind)) + 
  geom_bar(position = "fill",stat = "identity") +
  scale_y_continuous(labels = percent_format())

##GRP3

ex3 <- exposure2[,grp_3]
melt3 <- melt(cbind(ex3, ind = rownames(ex3)), id.vars = c('ind'))

ggplot(melt3,aes(x = variable, y = value,fill = ind)) + 
  geom_bar(position = "fill",stat = "identity") +
  scale_y_continuous(labels = percent_format())

##GRP4

ex4 <- exposure2[,grp_4]
melt4 <- melt(cbind(ex4, ind = rownames(ex4)), id.vars = c('ind'))

ggplot(melt4,aes(x = variable, y = value,fill = ind)) + 
  geom_bar(position = "fill",stat = "identity") +
  scale_y_continuous(labels = percent_format())

##GRP5

ex5 <- exposure2[,grp_5]
melt5 <- melt(cbind(ex5, ind = rownames(ex5)), id.vars = c('ind'))

ggplot(melt5,aes(x = variable, y = value,fill = ind)) + 
  geom_bar(position = "fill",stat = "identity") +
  scale_y_continuous(labels = percent_format())

##GRP6

ex6 <- exposure2[,grp_6]
melt6 <- melt(cbind(ex6, ind = rownames(ex6)), id.vars = c('ind'))

ggplot(melt6,aes(x = variable, y = value,fill = ind)) + 
  geom_bar(position = "fill",stat = "identity") +
  scale_y_continuous(labels = percent_format())

mixed=as.data.frame(read.table('mixed_call_mut_4.txt', header=T, sep='\t'))

mixedf <- merge.data.frame(mixed, clust_df2, by.y = 'names', by.x = 'V1' )

write.table(mixedf, file='mixedftwo.txt', sep='\t', row.names = F)

#SIGNATURES/GROUPS CLINICAL SUBTYPE

ClinType <- mixed$ClinicalSubtype
w <- subset(mixed, !is.na(ClinType))
ClinType <- w$ClinicalSubtype

ggplot(data = w,aes(x = Call,fill = ClinType)) +
  geom_bar(position = "fill")+
  ylab("Clinical Subtype") + xlab("Copy Number Signature") + 
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

ClinType <- mixedf$ClinicalSubtype
w <- subset(mixedf, !is.na(ClinType))
ClinType <- w$ClinicalSubtype

ggplot(data = w,aes(x = Call,fill = ClinType)) +
  geom_bar(position = "fill")+
  ylab("Clinical Subtype") + xlab("Copy Number Signature") + 
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

ggplot(data = w,aes(x = groups1,fill = ClinType)) +
  geom_bar(position = "fill")+
  ylab("Clinical Subtype") + xlab("Copy Number Signature Groups") + 
  labs(caption="p=0.0616") +
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

ClinType <- as.factor(ClinType)
groups <- as.factor(w$groups1)

chisq.test(ClinType,groups)


#SIGNATURES/GROUPS PAM50

PAM50 <- mixed$PAM50
w <- subset(mixed, !is.na(PAM50))
PAM50 <- w$PAM50

ggplot(data = w,aes(x = Call,fill = PAM50)) +
  geom_bar(position = "fill")+
  ylab("PAM50") + xlab("Copy Number Signature") + 
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

PAM50 <- mixedf$PAM50
w <- subset(mixedf, !is.na(PAM50))
PAM50 <- w$PAM50

ggplot(data = w,aes(x = Call,fill = PAM50)) +
  geom_bar(position = "fill")+
  ylab("PAM50") + xlab("Copy Number Signature") + 
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

ggplot(data = w,aes(x = groups1,fill = PAM50)) +
  geom_bar(position = "fill")+
  ylab("PAM50") + xlab("Copy Number Signature Groups") + 
  labs(caption="p=0.0398") +
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

PAM50 <- as.factor(PAM50)
groups <- as.factor(w$groups1)

chisq.test(PAM50,groups)


#SIGNATURES/GROUPS TNBC 1 EVENT

mixedf=as.data.frame(read.table('mixedftwo.txt', header=T, sep='\t'))

TNBC <- mixed$event.TNBC
w <- subset(mixed, !is.na(TNBC))
TNBC <- w$event.TNBC

ggplot(data = w,aes(x = Call,fill = TNBC)) +
  geom_bar(position = "fill")+
  ylab("TNBC Event") + xlab("Copy Number Signature") + 
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

TNBC <- mixedf$event.TNBC
w <- subset(mixedf, !is.na(TNBC))
TNBC <- w$event.TNBC

ggplot(data = w,aes(x = Call,fill = TNBC)) +
  geom_bar(position = "fill")+
  ylab("TNBC Event") + xlab("Copy Number Signature") + 
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

ggplot(data = w,aes(x = groups1,fill = TNBC)) +
  geom_bar(position = "fill")+
  ylab("TNBC Event") + xlab("Copy Number Signature 1 Groups") +
  labs(caption="p=0.0038") +
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

TNBC <- as.factor(TNBC)
groups <- as.factor(w$groups1)

chisq.test(TNBC,groups)


#SIGNATURES/GROUPS BRCA 1 EVENT

mixedf=as.data.frame(read.table('mixedftwo.txt', header=T, sep='\t'))

BRCA1 <- mixed$event.BRCA1
w <- subset(mixed, !is.na(BRCA1))
BRCA1 <- w$event.BRCA1

ggplot(data = w,aes(x = Call,fill = BRCA1)) +
  geom_bar(position = "fill")+
  ylab("BRCA1 Event") + xlab("Copy Number Signature") + 
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

BRCA1 <- mixedf$event.BRCA1
w <- subset(mixedf, !is.na(BRCA1))
BRCA1 <- w$event.BRCA1

ggplot(data = w,aes(x = Call,fill = BRCA1)) +
  geom_bar(position = "fill")+
  ylab("BRCA1 Event") + xlab("Copy Number Signature") + 
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

ggplot(data = w,aes(x = groups1,fill = BRCA1)) +
  geom_bar(position = "fill")+
  ylab("BRCA1 Event") + xlab("Copy Number Signature 1 Groups") +
  labs(caption="p=0.0033") +
  theme(axis.text.x = element_text(size=5), axis.text.y = element_text(size=10), axis.title.x = element_text(size=10), axis.title.y = element_text(size=10))

BRCA1 <- as.factor(BRCA1)
groups <- as.factor(w$groups1)

chisq.test(BRCA1,groups)

##SIGNATURES/GROUPS CNA SUM

CNA <- mixed$CNASum
w <- subset(mixed, !is.na(CNA))
CNA <- w$CNASum

ggplot(w, aes(x = Call, y = CNA))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("CNA Sum") + xlab("Signature Calls") + 
  theme_bw() 

CNA <- mixedf$CNASum
w <- subset(mixedf, !is.na(CNA))
CNA <- w$CNASum

ggplot(w, aes(x = Call, y = CNA))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("CNA Sum") + xlab("Signature Calls") + 
  theme_bw()

ggplot(w, aes(x = as.factor(groups1), y = CNA))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("CNA Sum") + xlab("Signature Groups") + 
  theme_bw()  +
  geom_hline(yintercept = 13916, color='red', size = 1.2)

##SIGNATURES/GROUPS CD8 T CELLS

CD8 <- mixed$T.cells.CD8
w <- subset(mixed, !is.na(CD8))
CD8 <- w$T.cells.CD8

ggplot(w, aes(x = Call, y = CD8))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("CD8 T Cells") + xlab("Signature Calls") + 
  theme_bw() 

CD8 <- mixedf$T.cells.CD8
w <- subset(mixedf, !is.na(CD8))
CD8 <- w$T.cells.CD8

ggplot(w, aes(x = Call, y = CD8))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("CD8 T Cells") + xlab("Signature Calls") + 
  theme_bw() 

ggplot(w, aes(x = as.factor(groups1), y = CD8))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  labs(caption="p=0.0023") +
  ylab("CD8 T cells") + xlab("Signature Groups") + 
  theme_bw()+
  geom_hline(yintercept = 0.08875911, color='red', size = 1.2)

##SIGNATURES/GROUPS FOLLICULAR HELPER T CELLS

Fol <- mixed$T.cells.follicular.helper
w <- subset(mixed, !is.na(Fol))
Fol <- w$T.cells.follicular.helper

ggplot(w, aes(x = Call, y = Fol))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("Follicular Helper T Cells") + xlab("Signature Calls") + 
  theme_bw() 

Fol <- mixedf$T.cells.follicular.helper
w <- subset(mixedf, !is.na(Fol))
Fol <- w$T.cells.follicular.helper

ggplot(w, aes(x = Call, y = Fol))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("Follicular Helper T Cells") + xlab("Signature Calls") + 
  theme_bw() 

ggplot(w, aes(x = as.factor(groups1), y = Fol))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("Follicular Helper T cells") + xlab("Signature Groups") + 
  labs(caption="p=0.0102") +
  theme_bw()+
  geom_hline(yintercept = 0.06641375, color='red', size = 1.2)

##SIGNATURES/GROUPS M1 MACROPHAGE

M1 <- mixed$Macrophages.M1
w <- subset(mixed, !is.na(Macrophages.M1))
M1 <- w$Macrophages.M1

ggplot(w, aes(x = Call, y = Macrophages.M1))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("M1 Macrophages") + xlab("Signature Calls") + 
  theme_bw() 

M1 <- mixedf$Macrophages.M1
w <- subset(mixedf, !is.na(M1))
M1 <- w$Macrophages.M1

ggplot(w, aes(x = Call, y = M1))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("M1 Macrophages") + xlab("Signature Calls") + 
  theme_bw() 

ggplot(w, aes(x = as.factor(groups1), y = M1))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("M1 Macrophages") + xlab("Signature Groups") +
  labs(caption="p=0.0139") +
  theme_bw()+
  geom_hline(yintercept = 0.07390586, color='red', size = 1.2)

##SIGNATURES/GROUPS M2 MACROPHAGE

M2 <- mixed$Macrophages.M2
w <- subset(mixed, !is.na(Macrophages.M2))
M2 <- w$Macrophages.M2

ggplot(w, aes(x = Call, y = Macrophages.M2))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("M2 Macrophages") + xlab("Signature Calls") + 
  theme_bw() 

M2 <- mixedf$Macrophages.M2
w <- subset(mixedf, !is.na(M2))
M2 <- w$Macrophages.M2

ggplot(w, aes(x = Call, y = M2))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("M2 Macrophages") + xlab("Signature Calls") + 
  theme_bw() 

ggplot(w, aes(x = as.factor(groups1), y = M2))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("M2 Macrophages") + xlab("Signature Groups") + 
  labs(caption="p=0.0084") +
  theme_bw() +
  geom_hline(yintercept = 0.2796555, color='red', size = 1.2)

##SIGNATURES/GROUPS NK CELLS

NK <- mixed$NK.cells.activated
w <- subset(mixed, !is.na(NK))
NK <- w$NK.cells.activated

ggplot(w, aes(x = Call, y = NK))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("NK Cells") + xlab("Signature Calls") + 
  theme_bw() 

NK <- mixedf$NK.cells.activated
w <- subset(mixedf, !is.na(NK))
NK <- w$NK.cells.activated

ggplot(w, aes(x = Call, y = NK))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("Natural Killer Cells") + xlab("Signature Calls") + 
  theme_bw() 

ggplot(w, aes(x = as.factor(groups1), y = NK))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("Natural Killer cells") + xlab("Signature Groups") + 
  labs(caption="p=0.0113") +
  theme_bw()  +
  geom_hline(yintercept = 0.0174716, color='red', size = 1.2)

##SIGNATURES/GROUPS H2 NORM

H2norm <- mixed$H2.norm
w <- subset(mixed, !is.na(H2norm))
H2norm <- w$H2.norm

ggplot(w, aes(x = Call, y = H2norm))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("H2 Norm") + xlab("Signature Calls") + 
  theme_bw() 

H2norm <- mixedf$H2.norm
w <- subset(mixedf, !is.na(H2norm))
H2norm <- w$H2.norm

ggplot(w, aes(x = Call, y = H2norm))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("H2 Norm") + xlab("Signature Calls") + 
  theme_bw() 

ggplot(w, aes(x = as.factor(groups1), y = H2norm))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("H3 Norm") + xlab("Signature Groups") + 
  labs(caption="p=0.0113") +
  theme_bw()  +
  geom_hline(yintercept = 0.3198195, color='red', size = 1.2)


##SIGNATURES/GROUPS H3 NORM

H3norm <- mixed$H3.norm
w <- subset(mixed, !is.na(H3norm))
H3norm <- w$H3.norm

ggplot(w, aes(x = Call, y = H3norm))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("H3 Norm") + xlab("Signature Calls") + 
  theme_bw() 

H3norm <- mixedf$H3.norm
w <- subset(mixedf, !is.na(H3norm))
H3norm <- w$H3.norm

ggplot(w, aes(x = Call, y = H3norm))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("H3 Norm") + xlab("Signature Calls") + 
  theme_bw() 

ggplot(w, aes(x = as.factor(groups1), y = H3norm))+  
  geom_boxplot(fill=NA, colour="black", outlier.shape = NA)+ 
  geom_point(size=1, position=position_jitter(h=0.1,w=0.1))+
  ylab("H3 Norm") + xlab("Signature Groups") + 
  labs(caption="p=0.0113") +
  theme_bw()  +
  geom_hline(yintercept = 0.4012735, color='red', size = 1.2)