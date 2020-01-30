#import modules

import os
import pandas as pd 
import numpy as np
from plotnine import *
%matplotlib inline
import seaborn as sns
import matplotlib.pyplot as plt

#visualize

sales=pd.read_csv("sales-data-set.csv") 

sa = sales.loc[1:1500]

sa.head()

a4_dims = (11.7, 8.27)
fig, ax = plt.subplots(figsize=a4_dims)

ax = sns.swarmplot(x="Dept", y="Weekly_Sales", data=sa)
