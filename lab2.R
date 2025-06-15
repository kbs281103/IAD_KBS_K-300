# Завдання 1: Базові типи векторів

# Вектори чисел
v1 <- c(1, 2, 3)
v2 <- seq(1, 10, by=2)  # послідовність
v3 <- rep(5, times=4)   # повторення

# Вектори різних типів
char_vector <- c("A", "B", "C")
logical_vector <- c(TRUE, FALSE, TRUE)

# Конкатенація
concat <- c(v1, v2)

print(v1)
print(v2)
print(v3)
print(concat)

A <- matrix(c(1,0,4,-4,2,1), nrow=3, byrow=TRUE)
B <- matrix(c(1,-1,2,3,1,-5), nrow=3, byrow=TRUE)
C <- matrix(c(3,4,1,-3,8,6), nrow=3, byrow=TRUE)

result <- 3*A + 4*B - 2*C
print(result)

# Масив: наприклад частоти фонем у мовах
array_data <- array(1:24, dim = c(3,4,2))
print(array_data)

# Список: прикладна лінгвістика
linguistics_list <- list(
  language = "Ukrainian",
  phonemes = c("a", "i", "u"),
  count = 3
)
print(linguistics_list)

# Категорії частин мови
parts_of_speech <- c("noun", "verb", "adjective", "noun", "verb")
pos_factor <- factor(parts_of_speech)
print(pos_factor)

# Впорядкований фактор
frequency <- c("low", "medium", "high", "low", "high")
freq_ordered <- factor(frequency, ordered=TRUE, levels=c("low", "medium", "high"))
print(freq_ordered)

# Таблиця частот слів
words_df <- data.frame(
  word = c("the", "of", "and", "to"),
  freq = c(2200, 1500, 1300, 1100)
)
print(words_df)

# Завантаження та перегляд iris
data(iris)
summary(iris)

# Побудова базового графіка
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species,
     main="Залежність довжини пелюстки від чашолистка",
     xlab="Довжина чашолистка", ylab="Довжина пелюстки")

# Якщо не встановлено, то встановити:
# install.packages("ggplot2")

library(ggplot2)

ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, color=Species)) +
  geom_point(size=3) +
  theme_minimal() +
  labs(title="Графік залежності довжини пелюстки від чашолистка",
       x="Довжина чашолистка", y="Довжина пелюстки")