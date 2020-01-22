---
layout: default
---

# Discrepancies in Variant Databases for BRCA1 Mutations

**Language:** R

**Topic:** Cancer genomics

**Full analysis code:** 

## Background 

Deoxyribonucleic acid, more commonly known as DNA, is the blueprint for all life on Earth. DNA is found in cells and determines the characteristics that make every person unique. For simplicity, we can think of DNA as long strands of molecules called _bases_. There are four bases: G, T, C, and A. Normally, cells replicate and copy their DNA accurately. But sometimes there are mistakes. These mistakes are called _mutations_.

Some mutations are harmful and can cause diseases such as cancer. These are called _malignant mutations_. However, other mutations are harmless and have no negative effects. These are called _benign mutations_. It is now possible to recieve a DNA test from a doctor to screen for mutations that may impact health. Databases exist that classify mutations as malignant, benign, or unknown based on results of laboratory experiments. But do these databases agree? 

## The Dataset

BRCA1 is a gene commonly mutated in cancer. It is made up of many bases, so there are many opportunities for mutations. 

4 BRCA1 mutant databases were explored: 

* [ClinVar](/variants/ClinVar.csv)
* [DbSNP](/variants/dbSNP.tsv)
* [LOVD](/variants/LOVD.tsv)
* [University of Utah](/variants/Utah.tsv)

Clinical classifications of variants: 

* Pathogenic
* Likely Pathogenic
* Benign
* Likely Benign 
* Unknown significance 

# Query the databases

First, let's see what the data looks like. 

![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")



