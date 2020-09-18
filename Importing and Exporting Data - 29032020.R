# Clear Workspace
rm(list=ls())

############################################################
## importing data from files ##
############################################################

#--------------------------------------------------------

RSC <- read.table("RetailScoreData.txt")
View(RSC)

RSC <- read.table("RetailScoreData.txt", header = T)
View(RSC)

RSC <- read.table("RetailScoreData.txt", header = T, sep = ',') #/t - tab
View(RSC)

#--------------------------------------------------------
# Importing .csv file 

RSC1 <- read.csv("RetailScoreData.csv", header = T)
View(RSC1)

#--------------------------------------------------------
# Importing .excel file

RSC2 <- read_excel("RetailScoreData.xlsx")

# Error in read_excel("RetailScoreData.xlsx") : 
#   could not find function "read_excel"

# we do not have read_excel function in R

# tools >>> Install Packages >>>> write the package name + (dependencies = T)

# install.packages('readxl', dependencies = T)

RSC2 <- read_excel("RetailScoreData.xlsx")
# Error in read_excel("RetailScoreData.xlsx") : 
#   could not find function "read_excel"

library(readxl)

RSC2 <- read_excel("RetailScoreData.xlsx")
View(RSC2)

RSC3 <- read_excel("RetailScoreData.xlsx", sheet = 2)
View(RSC3)

############################################################
## Exporting data to files ##
############################################################

#--------------------------------------------------------

# Exporting .csv file 

write.csv(RSC3, file ='mydata.csv')
write.csv(RSC3, file = 'mydata1.csv', row.names = F)

