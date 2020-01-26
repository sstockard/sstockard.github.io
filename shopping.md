---
layout: default
---

# Exploratory Retail Insights

Data: 
* [Store Features](./shopping/features-data-set.csv)
* [Store Sales](./shopping/sales-data-set.csv)

### Python

#### Average Yearly Sales 2011-2013 for 11 Departments
[View Python Code](https://github.com/sstockard/sstockard.github.io/blob/master/shopping/barchart.py)
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
[View Python Code](https://github.com/sstockard/sstockard.github.io/blob/master/shopping/corrplot.py)
![Calls](shopping/corplot.png "Calls")

### R

#### Weekly Sales 2011-2013 for 3 Departments
[View R Code](https://github.com/sstockard/sstockard.github.io/blob/master/shopping/weeklysales.R)
![Calls](shopping/yearlysales.png "Calls")

* Dept 1 has sales peaks around the New Year and early spring.

* Dept 4 has small peaks throughout the year and a larger peaks around the holidays.

* Dept 11 has peaks around the Holiday Season from Thanksgiving to New Years
