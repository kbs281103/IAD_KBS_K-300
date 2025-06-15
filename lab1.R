getwd()
setwd("D:/R/Lab1")
getwd()

install.packages("vcd")
install.packages("tidyxl")
install.packages("Hmisc")
library(vcd)
library(tidyxl)
library(Hmisc)

?Hmisc
help.search("excel")
apropos("data")

library(vcd)
data("Arthritis")
Arthritis
str(Arthritis)
summary(Arthritis)
mosaic(~Treatment + Improved, data = Arthritis, shade = TRUE)


sqrt((2 - sqrt(7))^2 + (3 - sqrt(7))^2)
sqrt(2) + sqrt(9) + 4*sqrt(2)