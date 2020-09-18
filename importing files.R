install.packages('readxl', dependencies = T)

rm(list = ls())

RSC1 <- read.table('RetailScoreData.txt')


RSC1 <- read.table('RetailScoreData.txt', header = T, sep = ',')

View(RSC1)



SC2 <- read.csv('RetailScoreData.csv', header = T, sep = ',')

View(RSC2)



install.packages('readxl', dependencies = T)

library(readxl)

RSC3 <- read_excel('RetailScoreData.xlsx')

View(RSC3)


RSC4 <- read_excel('RetailScoreData.xlsx', sheet = 2)

View(RSC4)


write.csv(RSC4, file('shishir'))



