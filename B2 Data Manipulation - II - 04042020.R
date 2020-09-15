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





















