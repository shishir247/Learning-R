rm(list=ls())

############################################################
## Data Manipulation ##
############################################################

###################################
## Apply Function  ##
###################################

data <- matrix(c(1:10, 21:30), nrow = 5, ncol = 4)
data

# Syntax of apply function : apply(data, margin, function)
# 2 margins. 1 = rows and 2 = columns

# mean value of columns
apply(data, 2, mean)

# std dev value of columns
apply(data, 2, sd)

# mean value of rows
apply(data, 1, mean)

# std dev value of rows
apply(data, 1, sd)

apply(data, 3, sd) # Error in if (d2 == 0L) { : missing value where TRUE/FALSE needed

#---------------------------
# lapply function

# lapply: input is list and output is list

data <- list(x = 1:5, y = 6:10, z = 11:15)
data

lapply(data, mean)

lapply(data, range)

#---------------------------
# sapply function

# take list as input and return vector as output if the output has one value;
# it will return matrix is the output has more than one value

sapply(data, mean) # vector

sapply(data, range) # matrix

#---------------------------
# tapply function

age <- c(23,33,28,21,20,19,34) # Quantitative/Numerical
gender <- c("m","m","m","f","f","f","m") # Qualitative/Categorical

tapply(age, gender, mean) # numerical vector, index(factor data type), FUN

# The elements are coerced to factors by as.factor.

tapply(gender, age, mean)

# 19 20 21 23 28 33 34
# NA NA NA NA NA NA NA

# Warning messages:
#   1: In mean.default(X[[i]], ...) :
#   argument is not numeric or logical: returning NA
# 2: In mean.default(X[[i]], ...) :
#   argument is not numeric or logical: returning NA
# 3: In mean.default(X[[i]], ...) :
#   argument is not numeric or logical: returning NA
# 4: In mean.default(X[[i]], ...) :
#   argument is not numeric or logical: returning NA
# 5: In mean.default(X[[i]], ...) :
#   argument is not numeric or logical: returning NA
# 6: In mean.default(X[[i]], ...) :
#   argument is not numeric or logical: returning NA
# 7: In mean.default(X[[i]], ...) :
#   argument is not numeric or logical: returning NA

RSC <- read.csv("RetailScoreData.csv")
str(RSC)

tapply(RSC$income, RSC$branch, mean)

aggregate(income ~ branch, RSC, mean) # Continuous and categorical, function

# To do :: pick RSC data and find the mean debtinc, creddebt and othdebt branch wise using tapply.

tapply(age, gender, FUN = function(x) mean(x) + median(x))

###################################
## In Built Datasets  ##
###################################

# load the datasets

library(datasets)
data()

View(iris)
?iris

?mtcars
View(mtcars)

###################################
## Dplyr Package  ##
###################################

# install.packages("dplyr", dependencies = TRUE)
# install.packages("fansi", dependencies = TRUE)
# install.packages("utf8", dependencies = TRUE)

library(dplyr)

#---------------------------
# select - returns a subset of the columns

head(mtcars)
dim(mtcars)

select(mtcars, mpg)
select(mtcars, mpg, disp)

select(mtcars, mpg : wt)
select(mtcars, mpg : wt, -hp)

head(select(mtcars, mpg, disp))
select(mtcars, mpg, disp)[1:5,]
select(mtcars, mpg, disp)[c(1,15,20,24),]

head(iris)
dim(iris)

select(iris, Sepal.Length, Petal.Length)

### Tibble Data Frame ### 

mtcars <- tbl_df(mtcars) #tibble df
mtcars

select(mtcars, mpg, disp)
select(mtcars, mpg : wt)

select(mtcars, mpg:wt, -hp)

iris <- tbl_df(iris) #tibble df
iris

select(iris, Sepal.Length, Petal.Length)

select(iris, Sepal.Length, Petal.Length)[20:30,]

#-------------------------------------------

# filter() enables easy filtering, zoom in, and zoom out of relevant data. 

summary(mtcars)
summary(as.factor(mtcars$cyl))
#  4   6   8 
# 11   7  14 

filter(mtcars, cyl == 8)
filter(mtcars, cyl < 8)

# multiple criteria filter
filter(mtcars, cyl < 6 & vs == 1) # and condition
filter(mtcars, cyl < 6 | vs == 1) # or condition - shift + \ = | 

select(filter(mtcars, cyl < 6 | vs == 1), cyl, vs, mpg)

#---------------------------------------------

# mutate() helps add new variables to an existing data set

# syntax is mutate(data, new_column)

dim(mtcars) # 32 11
mutate(mtcars, my_custom_disp = disp/2)
dim(mtcars) # 32 11

new_mtcars <- mutate(mtcars, my_custom_disp = disp/2)
new_mtcars # 32 12
dim(new_mtcars)

# Dropping columns
new_mtcars[,12] <- NULL 
new_mtcars

new_mtcars <- new_mtcars[,-12]

#---------------------------------------------

# arrange function helps arrange the data in a specific order

# syntax is arrange(data, ordering column)

arrange(mtcars, disp) # default is ascending order
arrange(mtcars, desc(disp))

arrange(mtcars, cyl, disp)
arrange(mtcars, cyl, disp)[11:20,]

arrange(mtcars, cyl, desc(disp))
arrange(mtcars, cyl, desc(disp))[11:20,]

#---------------------------------------------

# summarize() function summarizes multiple value into a single value in a dataset. 

summarise(mtcars, mean(disp))

# wt of the car across different number of cyl

summarise(mtcars, mean(wt))

aggregate(wt ~ cyl, mtcars, mean)
#   cyl         wt
# 1   4   2.285727
# 2   6   3.117143
# 3   8   3.999214

tapply(mtcars$wt, mtcars$cyl, mean)
# 4        6        8 
# 2.285727 3.117143 3.999214 

summarise(group_by(mtcars, cyl), mean(wt))

summarise(group_by(mtcars, cyl), mean_wt = mean(wt))

summarise(group_by(mtcars, cyl), mean_wt = mean(wt), max_wt = max(wt), min_wt = min(wt), sd_wt = sd(wt))

summarise(group_by(mtcars, cyl, vs), mean_wt = mean(wt), max_wt = max(wt), min_wt = min(wt), sd_wt = sd(wt))

###############################################################################
## Piping Operator
###############################################################################

# %>% - ctrl + shift + m

mtcars %>% group_by(cyl) %>% summarise(mean_wt = mean(wt), max_wt = max(wt), min_wt = min(wt), sd_wt = sd(wt))

mtcars %>% group_by(cyl, vs) %>% summarise(mean_wt = mean(wt), max_wt = max(wt), min_wt = min(wt), sd_wt = sd(wt))

# Summarise function -- any statistical summary funtion -- mean, median, sd, IQR, var

###############################################################################
## Hflights
###############################################################################

# install.packages('hflights', dependencies = T)

library(hflights)
?hflights

head(hflights)

hflights

hflights <- tbl_df(hflights)
hflights

# Atomic vectors
# The atomic vectors are the atomic vectorsof R, the simple building blocks upon which all else is built. There are four types of atomic vector that are important for data analysis:
#
# logical vectors <lgl>   contain TRUE or FALSE.
# integer vectors <int>   contain integers.
# double vectors <dbl>    contain real numbers.
# character vector <chr>  contain strings made with "".

colnames(hflights)

head(hflights)

# summarising distance wrt uniquecarriers

summarise(group_by(hflights, UniqueCarrier), Mean_Dist = mean(Distance), Median_Dist = median(Distance))

hflights %>% group_by(UniqueCarrier) %>% summarise(Mean_Dist = mean(Distance), Median_Dist = median(Distance))

#-----------------------------------------------------------------
# we have to rank each of the carriers acc to increasing order of arrival delay
#-----------------------------------------------------------------

summary(hflights)

colnames(hflights)

hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0)

hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0) %>% arrange(desc(ArrDelay))
# we didnt get the UniqueCarriers

# We will have to summarise the ArrDelay wrt to uniqueCarriers and then arrange for the Rank

hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0) %>% summarise(Mean_ArrDelay = mean(ArrDelay))

hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0) %>% 
  summarise(Mean_ArrDelay = mean(ArrDelay)) %>% arrange(ArrDelay)
# Error: object 'ArrDelay' not found  
  
hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0) %>% 
  summarise(Mean_ArrDelay = mean(ArrDelay)) %>% arrange(Mean_ArrDelay)
  
hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0) %>% 
  summarise(Mean_ArrDelay = mean(ArrDelay)) %>% arrange(desc(Mean_ArrDelay))
  
hflights %>% group_by(UniqueCarrier) %>% filter(ArrDelay > 0) %>% 
  summarise(Mean_ArrDelay = mean(ArrDelay)) %>% arrange(desc(Mean_ArrDelay)) %>% mutate(rank = rank(Mean_ArrDelay))



            