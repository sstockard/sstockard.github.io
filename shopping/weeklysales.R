#import data
features = as.data.frame(read.csv('features-data-set.csv', header=T, check.names = FALSE))
sales = as.data.frame(read.csv('sales data-set.csv', header=T, check.names = FALSE))

library(ggplot2)
library(dplyr)
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
