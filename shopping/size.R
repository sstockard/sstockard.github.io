#import modules

import os
import pandas as pd 
import numpy as np
from plotnine import *
%matplotlib inline
import seaborn as sns
import matplotlib.pyplot as plt

#visualize

st = stores.loc[1:5000]

st.head()

a4_dims = (11.7, 8.27)
fig, ax = plt.subplots(figsize=a4_dims)

ax = sns.violinplot(x="Type", y="Size", data=st, inner=None)
