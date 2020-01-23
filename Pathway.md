---
layout: default
---

# Automating Pathway Analysis and  Exploring Copy Number Signatures

**Language:** R

**Software:** GSEA

**Codes linked below**

## Background

**DNA and mutations:** Deoxyribonucleic acid (DNA) is often called the "blueprint of life," as it is the template for protein synthesis in the body. DNA is found in cells, and must be copied when cells replicate. However, sometimes mistakes occur during this process, resulting in [DNA mutations](/variants.md). While some mutations can be random, [recent evidence](/variants.md) suggests that many times mutations occur according to particular patterns. Different enviornmental conditions and diseases are associated with specific patterns of mutations. These patterns are called _mutational signatures_. For example, mutational signature 29 is related to cigarette smoking and many cancer types have corresponding mutational signatures.

While mutational signatures refer to single base variants in DNA, other types of mutations exist. One of these types of mutations is called a _copy number variation_. This term is used to describe mutations where there is an abnormal number of copies of a gene. My recent work has focused on _copy number signatures_, or patterns of copy number variations. For simplicity, I will refer to copy number signatures as CNSigs. Our lab has previously used non-negative matrix factorization to identify 5 CNSigs in cancer. I will refer to them in this analysis.

**Pathway analysis:** I hypothesized that CNSigs are related to underlying biological processes. One way to test this is via pathway analysis. A pathway analysis uses expression of predefined gene sets to relate biological mechanisms to phenotypic outcomes. Gene Set Enrichment Analysis (GSEA) is Java tool used to carryout pathway analysis.

## Automatic Generation of GSEA Input Files

GSEA requires very specific formatting parameters for input files. I had to perform hundreds of GSEA analyses, so manual generation of the files was time consuming and tedious. I developed a pipeline that automates the process given an expression dataset. This process is specifically for CNSig analysis and also outputs a heatmap of the results once the analysis is complete.

[View Pipeline Code](https://github.com/sstockard/sstockard.github.io/blob/master/Pathway/Pipeline.R)

## Pathway Analysis results

#### Pathway Analysis Matrix
![mat](/Pathway/matrix.png "mat")
###### * indicates significant up or downregulation of that pathway based on enrichment score

This is a heatmap of the enrichment scores of various gene sets. Higher enrichment scores indicate greater expression of genes in that biological pathway. These results show that Signatures 1 and 5 have very similar pathway expression, while Signatures 2, 3, and 4 differ greatly. Although some signatures are similar, these results still support my hypothesis that CNSigs are associated with specific biological mechanisms. 

## Other Clinical Results

#### Signature Exposures Across Breast Cancer Samples
[View Code](https://github.com/sstockard/sstockard.github.io/blob/master/Pathway/exposures.R)
![ex](/Pathway/exposures.png "ex")

This plot shows CNSig exposure across 700+ breast cancer samples. CNSig exposure is on the y-axis and tumor samples on the x-axis. Most samples are exposed to multiple CNSigs and CNSigs are fairly evenly distributed across samples.

#### Signature Survival Curves
[View Code](https://github.com/sstockard/sstockard.github.io/blob/master/Pathway/survival.R)
![surv](/Pathway/survival.png "surv")

Low quality survival data, so difficult to interpret. However it seems that Signatures 2 and 4 are associated with the worst patient survival.

#### Breast Cancer Subtype Association with Signatures
[View Code](https://github.com/sstockard/sstockard.github.io/blob/master/Pathway/radar.R)

![sub](/Pathway/subtype.png "sub")

This radar plot illustrates the associations of CNSigs with 3 different breast cancer subtypes. Signatures S4 and S4 and associated with ER+ breast cancers and S1 and S2 are slightly more common in TNBC. 

## Clustering Patients

Most recently, I have tried to analyze CNSigs on a continuous scale by correlating outcomes to CNSig exposure. Previously, I tried to group patients via clustering and elucidating differences in clinical characterisitcs of differing clustering cohorts. That code can be viewed [here](https://github.com/sstockard/sstockard.github.io/blob/master/Pathway/clustering.R). 

## Impacts

**Clinical:**  Because CNSigs can be detected in tumor samples and are related to patient outcomes, CNSigs can act as a way to guide cancer patient treatment. This is important as inappropriate cancer therapies can be harmful to patients' health and survival.

**Business:**  Big data analysis and visualization is critical in any business setting. This project has greatly guided my computational, statistical, and analytical skills. In addition, automation and effecient pipeline development are important in a time sensitive, fast-paced enviornment. 

## Conclusions

* I was able to successfully automate a pipeline for GSEA input files for CNSig Analysis.
* Pathway analysis suggests CNSigs are related to underlying biological mechanisms.
* Breast cancer patients are exposed to multiple CNSigs.
* CNSigs are related to breast cancer survival and subtype.
