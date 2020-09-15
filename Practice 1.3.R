## 1. Load the RetailScoreData file as Retail.data.
Retail.data <- read.csv("RetailScoreData.csv")

attach(Retail.data)
View(Retail.data)

## 2 Find the mean and median values of credit.debt and other.debt.
colnames(Retail.data)
mean(creddebt)
median(creddebt)
mean(othdebt)
median(othdebt)

## 3 Round of the elements in vector total.debt in multiples of tens.
total.debt <- creddebt + othdebt
library(pylr)
total.debt1 <- round_any((total.debt), 10, f = ceiling)
head(total.debt1)

## 4 Paste the elements of the two vectors, credit.debt and other.debt 
## using separator “,”.  
paste(creddebt,othdebt,sep=",")

## 5. Create a data.frame Retail.3779 with all the observations where ncust is 3779.

class(Retail.data$ncust)
as.character(Retail.data$ncust)

Retail.3779 <- Retail.data[Retail.data$ncust == 3779,]

## 6. Sort the data.frame Retail.3779 in the decreasing order of variable age and 
### assign it to Retail.3779.sort.

Retail.3779.sort <- Retail.3779[order(Retail.3779$age, decreasing = T),]

## 7. See how many observations in Retail.3779 are employed for more than 10 years.
## Condering we want to see "how many employees in Retail.3779 are employed for more 
##than 10 years" and assuming employ coloumn gives the information about no. of years employed
Retail.3779$employ>10
sum(Retail.3779$employ>10)

## Condering we want to see all observations in Retail.3779  for employees employed for more 
##than 10 years" and assuming employ coloumn gives the information about no. of years employed

Retail.3779[Retail.3779$employ>10,]

## 8 Find the mean of all observations in Retail.data in variables creddebt and othdebt
## grouped by ncust.

mean_creddebt_byncust <- aggregate(Retail.data$creddebt, by = list(Retail.data$ncust), FUN = mean)
mean_othdebt_byncust <- aggregate(Retail.data$othdebt, by = list(Retail.data$ncust), FUN = mean)
