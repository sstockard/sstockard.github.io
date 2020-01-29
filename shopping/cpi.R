library(dplyr)
library(ggplot2)

features<-
  features %>%
  mutate(Store = as.factor(Store),
         Date = as.Date(Date, "%d/%m/%Y"))

features_trimmed <-
  features %>%
  filter(Store == 1 | Store == 3 | Store == 6) %>%
  dplyr::select(-IsHoliday)

cpi <- ggplot(features_trimmed, aes(x = Date, y = CPI, colour = Store)) +
  geom_line(size = 1.5) +
  scale_color_manual(values = c("violetred1", "turquoise2","springgreen","tan"))+
  theme_grey()
