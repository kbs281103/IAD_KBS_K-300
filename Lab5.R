
# Лабораторна робота №5 (ІАД)
# Варіант 3 – ANOVA та коваріаційний аналіз

# Встановлення відсутніх пакетів
if (!require("effects")) install.packages("effects")
if (!require("multcomp")) install.packages("multcomp")
if (!require("HSAUR2")) install.packages("HSAUR2")
if (!require("doBy")) install.packages("doBy")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("WRS2")) install.packages("WRS2")
if (!require("HH")) install.packages("HH")

# Завантаження після встановлення
library(effects)
library(multcomp)
library(HSAUR2)
library(doBy)
library(ggplot2)
library(WRS2)
library(HH)

# === Приклад 3 ===
tomato <- data.frame(
  weight = c(1.5, 1.9, 1.3, 1.5, 2.4, 1.5,
             1.5, 1.2, 1.2, 2.1, 2.9, 1.6,
             1.9, 1.6, 0.8, 1.15, 0.9, 1.6),
  trt = rep(c("Water", "Nutrient", "Nutrient+24D"), each = 6)
)

stripchart(weight ~ trt, data = tomato, xlab = "Вага, кг", ylab = "Умови")
tapply(tomato$weight, tomato$trt, mean)
summary(aov(weight ~ trt, data = tomato))

# === Приклад 4 ===
data(litter, package = "multcomp")
attach(litter)
table(dose)
aggregate(weight, by = list(dose), FUN = mean)
fit <- aov(weight ~ gesttime + dose)
summary(fit)
effect("dose", fit)
contrast <- rbind("no drug vs. drug" = c(3,-1,-1,-1))
summary(glht(fit, linfct = mcp(dose = contrast)))
ancova(weight ~ gesttime + dose, data = litter)
ancova(weight ~ gesttime * dose, data = litter)

# === Приклад 5 ===
data("weightgain", package = "HSAUR2")
str(weightgain)
ggplot(data = weightgain, aes(x = type, y = weightgain, fill = source)) +
  geom_boxplot()
summaryBy(weightgain ~ type + source, data = weightgain, FUN = c(mean, sd, length))
plot.design(weightgain)
with(weightgain, interaction.plot(type, source, weightgain))
model <- aov(weightgain ~ source + type + source:type, data = weightgain)
summary(model)

# === Завдання 5 ===
data("diet", package = "WRS2")
str(diet)

# Двовибірковий незалежний t-тест між дієтами A і B
t.test(weight.loss ~ diet.type, data = subset(diet, diet.type %in% c("A", "B")))

# Двовибірковий залежний t-тест: до і після
t.test(diet$initial.weight, diet$final.weight, paired = TRUE)

# Однофакторний дисперсійний аналіз
summary(aov(weight.loss ~ diet.type, data = diet))
