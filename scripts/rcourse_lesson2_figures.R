## READ IN DATA ##
source('./scripts/rcourse_lesson2_cleaning.R')

## LOAD PACKAGES ##
library(ggplot2)

## ORGANIZE DATA ##
data_figs <- data_clean

data_figs = data_clean %>%
  mutate(sex = factor(sex, levels=c("F", "M"), labels=c("female", "male")))

## MAKE FIGURES ##
#histogram of dependant var (proportion of Cedric)
name_plot <- ggplot(data_figs, aes(x = prop)) + geom_histogram()
pdf(file = './figures/name.pdf')
name_plot
dev.off()

#histogram of dependant var (proportion of Cedric) -loge
name_loge.plot <- ggplot(data_figs, aes(x = prop_loge)) + geom_histogram()
pdf(file = './figures/name_loge.pdf')
name_loge.plot
dev.off()

#histogram of dependant var (proportion of Cedric) -log10
name_log10.plot <- ggplot(data_figs, aes(x = prop_log10)) + geom_histogram()
pdf(file = './figures/name_log10.pdf')
name_log10.plot
dev.off()

#Proportion of Cedric's by year
year.plot <- ggplot(data_figs, aes(x = year, y = prop_log10)) + 
  geom_point() +
  geom_smooth(method = "lm")

pdf("figures/year.pdf")
year.plot
dev.off()

# Proportion of Cedric's by sex (categorical predictor)
sex.plot = ggplot(data_figs, aes(x = sex, y = prop_log10)) +
  geom_boxplot()

pdf("figures/sex.pdf")
sex.plot
dev.off()

