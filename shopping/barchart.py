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
#average weekly sales of 11 departments across 3 years

df['Date'] = pd.to_datetime(df['Date'], format="%d/%m/%Y")

df = df.assign(year = df.Date.dt.year)

depts = df.loc[1:1500]
sns.set(style="whitegrid")
g = sns.catplot(x="year", y="Weekly_Sales", hue="Dept", data=depts,
                   height=10, kind="bar", palette="Set1")
