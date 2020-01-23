---
layout: default
---

# Exploratory Shopping Insights

Data: 
* [Store Features](./shopping/features-data-set.csv)
* [Store Sales](./shopping/sales-data-set.csv)

### Python

```python
#import modules

import os
import pandas as pd 
import numpy as np
from plotnine import *
%matplotlib inline
import seaborn as sns
import matplotlib.pyplot as plt

#import database

df=pd.read_csv("sales data-set.csv")
```
```python
#average weekly sales of 11 departments across 3 years

df['Date'] = pd.to_datetime(df['Date'], format="%d/%m/%Y")

df = df.assign(year = df.Date.dt.year)

depts = df.loc[1:1500]
sns.set(style="whitegrid")
g = sns.catplot(x="year", y="Weekly_Sales", hue="Dept", data=depts,
                   height=10, kind="bar", palette="Set1")
```
#### Average Yearly Sales 2011-2013 for 11 Departments
![Calls](shopping/11depts.png "Calls")

```python
#correlations between various outcomes

features=pd.read_csv("features-data-set.csv") 

some = features[['Temperature','Fuel_Price','CPI','Unemployment']]

corr = features.corr()

mask = np.zeros_like(corr, dtype=np.bool)
mask[np.triu_indices_from(mask)] = True

f, ax = plt.subplots(figsize=(11, 9))
cmap = sns.diverging_palette(220, 10, as_cmap=True)

sns.heatmap(corr, mask=mask, cmap=cmap, vmax=.3, center=0,
            square=True, linewidths=.5, cbar_kws={"shrink": .5})            
```
#### Correlations Between Retail Factors
![Calls](shopping/corplot.png "Calls")

### R

```r
#import data
features = as.data.frame(read.csv('features-data-set.csv', header=T, check.names = FALSE))
sales = as.data.frame(read.csv('sales data-set.csv', header=T, check.names = FALSE))

library(ggplot2)
library(dplyr)
```
```r
#sales in 3 different departments across 3 years

sales <-
  sales %>%
  mutate(Store = as.factor(Store),
         Dept = as.factor(Dept),
         Date = as.Date(Date, "%d/%m/%Y"))

sales_trimmed <-
  sales %>%
  filter(Store == 1,
         Dept == 1 | Dept == 4 | Dept == 11) %>%
  dplyr::select(-IsHoliday)

yearly <- ggplot(sales_trimmed, aes(x = Date, y = Weekly_Sales, colour = Dept)) +
  geom_line(size = 1.5) +
  scale_color_manual(values = c("#00AFBB", "#E7B800","plum"))+
  theme_grey()
```
#### Weekly Sales 2011-2013 for 3 Departments
![Calls](shopping/yearlysales.png "Calls")

* Dept 1 has sales peaks around the New Year and early spring.

* Dept 7 has random peaks throughout the year but stays mostly cosnistant.

* Dept 11 has peaks around the Holiday Season from Thanksgiving to New Years
