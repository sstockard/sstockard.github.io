---
layout: default
---

# Automating Pathway Analysis and  Exploring Copy Number Signatures

**Language:** R

**Software:** GSEA

## Background

**DNA and mutations:** Deoxyribonucleic acid (DNA) is often called the "blueprint of life," as it is the template for protein synthesis in the body. DNA is found in cells, and must be copied when cells replicate. However, sometimes mistakes occur during this process, resulting in [DNA mutations](/variants.md). While some mutations can be random, [recent evidence](/variants.md) suggests that many times mutations occur according to particular patterns. Different enviornmental conditions and diseases are associated with specific patterns of mutations. These patterns are called _mutational signatures_. For example, one mutational signature is related to cigarette smoking and many cancer types have corresponding mutational signatures.

While mutational signatures refer to single base variants in DNA, other types of mutations exist. One of these types of mutations is called _copy number variations_. This term is used to describe mutations where there is an abnormal number of copies of a gene. My recent work has focused on _copy number signatures_, or patterns of copy number variations. For simplicity, I will refer to copy number signatures as CNSigs. Our lab has previously identified 5 CNSigs that I will include in this analysis.

**Pathway analysis:** My hypothesis is that CNSigs are related to underlying biological processes. One way to test this is via pathway analysis. A pathway analysis uses expression of predefined gene sets to relate biological mechanisms to phenotypic outcomes. Gene Set Enrichment Analysis (GSEA) is Java tool used to carryout pathway analysis.

## Automatic Generation of GSEA Input Files

GSEA requires very specific formatting parameters for input files. I needed to do hundreds of GSEA analyses, so manual generation of these files and visualizations was time consuming and tedius. I developed a pipeline that automates the process given an expression dataset.This process is specifically for CNSig analysis.

[View Pipeline Code](Pathway/Pipeline.R)

## Pathway Analysis results

#### Pathway Analysis Matrix
![mat](/Pathway/matrix.png "mat")
###### * indicates significant up or downregulation of that pathway based on enrichment score

This is a heatmap of the enrichment scores of various gene sets. Higher enrichment scores indicate greater expression of genes in that biological pathway. These results show that Signatures 1 and 5 have very similar pathway expression, while Signatures 2, 3, and 4 differ greatly. Although some signatures are similar, these results still support my hypothesis that CNSigs are associated with specific biological mechanisms. 

## Other Clinical Results

![ex](/Pathway/exposures.png "ex")

This plot shows CNSig exposure across 700+ breast cancer samples. Signature exposure is on the y-axis and tumor samples on the x-axis. Most samples are exposed to multiple signatures and signatures are fairly evenly distributed across samples.

![surv](/Pathway/survival.png "surv")

Low quality survival data, so difficult to interpret. However it seems that Signatures 2 and 4 are associated with the worst patient survival.


