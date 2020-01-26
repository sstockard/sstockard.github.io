#import modules

import os
import pandas as pd 
import numpy as np
from plotnine import *
%matplotlib inline
import seaborn as sns
import matplotlib.pyplot as plt

features=pd.read_csv("features-data-set.csv") 

some = features[['Temperature','Fuel_Price','CPI','Unemployment']]

corr = features.corr()

mask = np.zeros_like(corr, dtype=np.bool)
mask[np.triu_indices_from(mask)] = True

f, ax = plt.subplots(figsize=(11, 9))
cmap = sns.diverging_palette(220, 10, as_cmap=True)

sns.heatmap(corr, mask=mask, cmap=cmap, vmax=.3, center=0,
            square=True, linewidths=.5, cbar_kws={"shrink": .5})
