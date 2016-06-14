## LOAD PACKAGES ##
library(dplyr)

## READ IN DATA ##
data <- read.table('./data/rcourse_lesson2_data.txt', sep = "\t", 
                   header = TRUE)

## CLEAN DATA ##
data_clean <- data %>% filter(., name == 'Cedric')
xtabs(~name, data_clean)
data_clean <- data %>% filter(., name == 'Cedric') %>% 
  mutate(name = factor(name)) %>%
  filter(year > 1900) %>%
  filter(year <= 2000) %>%
  mutate(prop_loge = log(prop)) %>%
  mutate(prop_log10 = log10(prop))

min(data_clean$year)
max(data_clean$year)


