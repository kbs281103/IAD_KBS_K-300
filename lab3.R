# Підключення бібліотек
library(ggplot2)
library(vioplot)

# Завантаження
file_path <- file.choose()
lap_data <- read.csv(file_path)

# Фільтрація: тільки адекватні значення (менше 200 000 мс = 3 хв.)
lap_data_clean <- subset(lap_data, milliseconds < 200000)

# Директорія для збереження
output_dir <- dirname(file_path)

# Boxplot
boxplot_plot <- ggplot(lap_data_clean, aes(y = milliseconds)) +
  geom_boxplot(fill = "lightblue") +
  ggtitle("Boxplot часу проходження кола (мс) без викидів")
ggsave(file.path(output_dir, "boxplot_clean.png"), boxplot_plot, width=6, height=4)

# Violin
violin_plot <- ggplot(lap_data_clean, aes(x = "", y = milliseconds)) +
  geom_violin(fill = "grey") +
  geom_boxplot(width = 0.1, alpha = 0.4) +
  ggtitle("Violin Plot часу проходження кола (без викидів)")
ggsave(file.path(output_dir, "violin_plot_clean.png"), violin_plot, width=6, height=4)

# Histogram
histogram_plot <- ggplot(lap_data_clean, aes(x = milliseconds)) +
  geom_histogram(fill = "orange", color = "black", binwidth = 1000) +
  ggtitle("Гістограма часу проходження кола (без викидів)")
ggsave(file.path(output_dir, "histogram_clean.png"), histogram_plot, width=6, height=4)

# Density
density_plot <- ggplot(lap_data_clean, aes(x = milliseconds)) +
  geom_density(fill = "green", alpha = 0.4) +
  ggtitle("Density Plot часу проходження кола (без викидів)")
ggsave(file.path(output_dir, "density_plot_clean.png"), density_plot, width=6, height=4)
