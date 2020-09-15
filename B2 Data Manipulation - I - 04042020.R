rm(list=ls())

###########################################
###           DATA MANIPULATION         ###
###########################################  

# LOADING FILE
RSC <- read.csv("RetailScoreData.csv")

# print first 6 rows of the data

head(RSC)
# hygeine check to see if data is loaded correctly and also when I am making certains changes, 
# we want to check if the changes are implemented correctly

head(RSC, 10)

# print last 6 rows of the data

tail(RSC)
tail(RSC,10)

### Data Dictionary of "RSC.csv" ### 

# branch:   branch code
# ncust:    number of customers
# age:      age of the borrower
# ed:       educational qualification based on degrees
# employ:   number of years in the job
# address:  number of years in the current address
# income:   income in '000$
# debtinc:  debt to income ratio (or burden) in %
# creddebt: credit card debt in '000$
# othdebt:  other debt in $mn
# default:  dummy for default incidents

str(RSC) # info data type and shows a few data points in each column

# Access 1st row in a dataframe
RSC[1,] # row_no, col_no.
RSC[1:10,]

# Access 1st column in a dataframe
RSC[,1]

################################################################
# CHANGING THE DATA TYPE OF THE COLUMN
################################################################
# branch:   branch code is Nominal Data

str(RSC$branch) # is being read as integer value

# branch would be a nominal data type. So, in R it should be a factor variable. Factor variables have levels

levels(RSC$branch)
class(RSC$branch)

RSC$branch <- as.factor(RSC$branch)
levels(RSC$branch)
class(RSC$branch)

str(RSC$branch)

## To do :: Check for other variables which could be nominal and convert them to factor


################################################################
# CHANGING THE COLUMN NAMES
################################################################

colnames(RSC) # vector
colnames(RSC)[3,5] # Error in colnames(RSC)[3, 5] : incorrect number of dimensions
colnames(RSC)[c(3,5)]
colnames(RSC)[c(3,5)] <- c("customer.id", 'edu')
colnames(RSC)[c(3,5)]
colnames(RSC)

head(RSC)

################################################################
# Filtering
################################################################

RSC$branch
RSC$branch == 25 # vector of True and False
RSC[RSC$branch == 25, ] # rows where the branch code is 25 and all the cols

RSC.25 <- RSC[RSC$branch == 25,]
head(RSC.25)

dim(RSC.25)


################################################################
# ADDING VARIABLES
################################################################

colnames(RSC)
RSC$totaldebt <- RSC$creddebt + RSC$othdebt
colnames(RSC)

################################################################
# ADDING VARIABLES AT A SPECIFIC INDEX
################################################################

dataset <- data.frame(a = 1:5, b = 2:6, c = 3:7)
dataset

# install.packages('tibble', dependencies = T)
library(tibble)

add_column(dataset, d = 4:8, .after = 2) # index

add_column(dataset, e = 10:14, .after = "c") # col name

add_column(dataset, g = 10:14, .before = "a") # col name

################################################################
# COMBINING
################################################################

levels(RSC$branch)

RSC.49 <- RSC[RSC$branch == 49,]
head(RSC.49)

dim(RSC.49)

RSC.25.49 <- rbind(RSC.25, RSC.49)
# Error in rbind(deparse.level, ...) : 
#   numbers of columns of arguments do not match

dim(RSC.49)
dim(RSC.25)

head(RSC.49,1)
head(RSC.25,1)

# We won't be able to apply rbind if the no. of columns are not same
# We won't be able to apply cbind if the no. of rows are not same

RSC.49$totaldebt <- NULL
# RSC.49[,'totaldebt'] <- NULL
# RSC.49 <- RSC.49[-13]

dim(RSC.49)
dim(RSC.25)

RSC.25.49 <- rbind(RSC.25, RSC.49)
head(RSC.25.49)
tail(RSC.25.49)

dim(RSC.25.49)


################################################################
# AGGREGATING DATA
################################################################

aggregate(income ~ branch, RSC, mean) # for each branch, what is the mean income?

# continuous ~ categorical variable, function

aggregate(income ~ branch, RSC, sum)

aggregate(income ~ branch, RSC, median)

