---
layout: default
---

# Exploratory Retail Insights

## Background

In both data science and business settings, data visualization is critical for understanding underlying data structure and making accurate predictions. Using computational methods, data visualization can occur quickly-- even when using large data sources. There are many examples of scientific data visualzations on my portfolio. Below are a few examples of data visualzations in R and Python using a sample retail dataset.

Data: 
* [Store Features](./shopping/features-data-set.csv)
* [Store Sales](./shopping/sales-data-set.csv)

### Python

#### Average Yearly Sales 2011-2013 for 11 Departments
[View Python Code](https://github.com/sstockard/sstockard.github.io/blob/master/shopping/barchart.py)

![Calls](shopping/11depts.png "Calls")

What this figure tells us: 

* There is little change in sales from year to year per department

* The top selling and bottom selling departments remained as so for each year

* Sales in Dept 6 and Dept 7 have steadily decreased from 2010 to 2012
     
#### Correlations Between Retail Factors
[View Python Code](https://github.com/sstockard/sstockard.github.io/blob/master/shopping/corrplot.py)

![Calls](shopping/corplot.png "Calls")

* Positive correlation between Markdowns 1-4 and occurance of a holiday, but a very slight negative correlation between Markdown 5 and holiday occurance

* While there aren't many notable correlations in this dataset, corrplots are a way to quickly visualize many possible correlations at once in exploratory analyses

### R

#### Weekly Sales 2011-2013 for 3 Departments
[View R Code](https://github.com/sstockard/sstockard.github.io/blob/master/shopping/weeklysales.R)

![Calls](shopping/yearlysales.png "Calls")

What this figure tells us: 

* Dept 1 has sales peaks around the New Year and early spring.

* Dept 4 has small peaks throughout the year and a larger peaks around the holidays.

* Dept 11 has peaks around the Holiday Season from Thanksgiving to New Years
