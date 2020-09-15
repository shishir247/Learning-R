numvec <-  c(2,5,8,9,0,6,7,8,4,5,7,11)
numvec
charvec <-  c("David","James","Sara","Tim","Pierre","Janice","Sara","Priya","Keith", "Mark", "Apple", "Sara")
charvec
gender <- c("M","M","F","M","M","M","F","F","F","M","M","F")
gender
state <-  c("CO","KS","CA","IA","MO","FL","CA","CO","FL","CA","WY","AZ")
state

df <- data.frame(numvec, charvec, gender, state)
df

df1 <- df[df$numvec < "5", ]
df1

df2 <- df[df$charvec== "Sara", ]
df2

df3 <- data.frame(numvec, charvec, gender, state)
df3
df3[numvec==5,c(2,4)]

df4 <- data.frame(numvec, charvec, gender, state)
df4

df4[c(charvec != "Sara" & gender == "F" & numvec >5),]

df4[c(numvec >5 & gender == "F" & charvec != "Sara"),]

################################################################################

Gender <- rep(c("M","F"),5)
Gender

Age <- c(22, 35, 43, 52, 58, 23, 36, 46, 39, 31)
Age

Df2 <- data.frame(Gender, Age)
Df2

coffee <- c(3, 1, 2, 5, 0, 2, 0, 1, 3, 2)
coffee

Df3 <- cbind(Df2,coffee)
Df3

Df2 <- data.frame(Gender, Age)
Df2

Df2$coffee <-  coffee
Df2$coffee
Df2

#----------------------------------

Df2[,2]

Df2[c(1,3,8), ]