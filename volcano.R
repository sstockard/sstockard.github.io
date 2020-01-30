dif=as.data.frame(read.table('sig_1_5_top1000.txt', header=T, check.names = FALSE, stringsAsFactors = FALSE)) 

dif$thershold <- ifelse(dif$logFC > 1 & dif$adj.P.Val < 0.01, "red", 
                        +                         ifelse(dif$logFC < -1 & dif$adj.P.Val < 0.01, -1, "blue"))

ggplot(data=dif, aes(x=logFC, y=-log10(dif$adj.P.Val))) +
  geom_point( size=1 ,aes(color=as.factor(thershold))) +
  theme(legend.position = "none") + xlab("log2 fold change") + ylab("-log10 p-value")

dif$thershold <- ifelse(dif$logFC > 1 & dif$adj.P.Val < 0.01, "red", 
                        +                         ifelse(dif$logFC < -1 & dif$adj.P.Val < 0.01, -1, "blue"))
