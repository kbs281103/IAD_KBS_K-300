# -------------------------------
# Лабораторна робота №4 з ІАД
# Варіант №3 — Набір даних: attitude
# Автор: Крячун Б.С.
# -------------------------------

# Встановлення необхідних пакетів (виконується один раз)
install.packages(c("car", "gclus", "psych", "corrgram", "corrplot"))

# Підключення пакетів
library(car)
library(gclus)
library(psych)
library(corrgram)
library(corrplot)

# -------------------------------
# Завдання 1 — Аналіз state.x77
# -------------------------------
states <- state.x77[, 1:6]

# Кореляція Пірсона та Спірмена
cor(states)
cor(states, method = "spearman")

# Коваріація
cov(states)

# Тест на достовірність кореляції між Income та HS Grad
cor.test(states[, "Income"], states[, "HS Grad"])

# -------------------------------
# Завдання 2 — Ручне виконання в Excel
# (Дані згенеровані окремо в Excel-файлі)
# -------------------------------
# Excel формула для кореляції:
# =CORREL(A2:A21, B2:B21)

# -------------------------------
# Завдання 3 — Лінійна та поліноміальна регресія (women)
# -------------------------------
data(women)
attach(women)

# Лінійна регресія
fit1 <- lm(weight ~ height, data = women)
summary(fit1)

plot(height, weight,
     xlab = "Зріст (дюйми)", ylab = "Вага (фунти)",
     main = "Лінійна регресія: вага ~ зріст")
abline(fit1, col = "blue")

# Поліноміальна регресія
fit2 <- lm(weight ~ height + I(height^2), data = women)
summary(fit2)

plot(height, weight,
     xlab = "Зріст (дюйми)", ylab = "Вага (фунти)",
     main = "Поліноміальна регресія: вага ~ зріст")
lines(height, fitted(fit2), col = "red", lwd = 2)

# -------------------------------
# Завдання 4 — Робота з даними attitude
# -------------------------------
data(attitude)
head(attitude)

# --- a) Кореляція та графіки
cor(attitude$rating, attitude$complaints, method = "pearson")
cor(attitude$rating, attitude$complaints, method = "kendall")

plot(attitude$rating, attitude$complaints,
     main = "Залежність: rating vs complaints",
     xlab = "Rating", ylab = "Complaints")
abline(lm(complaints ~ rating, data = attitude), col = "blue")

# Поліноміальна регресія
fit_poly <- lm(complaints ~ rating + I(rating^2), data = attitude)
lines(attitude$rating, fitted(fit_poly), col = "red")

# --- b) Попарна кореляція
pairs(attitude, main = "pairs(): Попарні діаграми")

scatterplotMatrix(attitude, spread = FALSE, lty.smooth = 2,
                  main = "scatterplotMatrix() з пакету car")

# --- cpairs з gclus
cpairs(attitude, order.single(d = dist(attitude)), panel.colors = NULL)

# --- c) corPlot з psych
corPlot(cor(attitude), numbers = TRUE)

# --- d) Корелограми
corrgram(attitude, lower.panel = panel.shade, upper.panel = panel.pie,
         text.panel = panel.txt, main = "corrgram() — shaded + pie")

corrplot(cor(attitude), method = "circle", type = "upper",
         title = "corrplot() — Кола", mar = c(0,0,2,0))

# Кінець скрипта
