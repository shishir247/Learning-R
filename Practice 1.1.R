## 1. Create a vector vec1 and vec2 with elements 1 to 15 and 115 to 101.
vec1 <- (1:15)
vec1
vec2 <- 115:101 
vec2

## 2 Create a vector vec3 of the sum of the log values of vec1 and vec2 in one argument and print
## the result.
vec3 <- log(vec1)+log(vec2)
vec3

## 3 Print the 7 th element in vec2.
a <- vec2[7]
a

## 4 Create matrix mat1 by combining the vec1 and vec2 column wise.
mat1 <- cbind(vec1,vec2)
mat1

## 5 Change the dimensions of mat1 to 5 x 6 and print mat1.
mat1 <- matrix(mat1,nrow=5,ncol=6)
mat1

dim(mat1) = c(5,6)

## 6 Generate a 5 x 5 matrix mat2 with elements 1:5 in the diagonal and other elements being 0.
mat2 <- diag(1:5,nrow=5,ncol=5)
mat2

## 8 Print the values of 4 th column of mat2
col4 <- mat2[,4]
col4

## 7 Add another column of elements 6:10 in mat2, making it 5 x 6 matrix.
mat2 <- cbind(mat2,6:10)
mat2
dim(mat2)

## 9 Find which elements in mat2 are greater than or equal to 5.
greaterthan5 <- mat2[mat2>=5]
greaterthan5

## 10
A <- c(1:20)
A

#b
B <- c(20:1)
B

#c
C <- c(1:20,19:1)
C

#d
temp <- c(4,6,3)
temp

#e
D <- rep(temp,10)
D

#f
E <- rep(temp, c(10,20,30))
E

#g
f <- rep(temp,11, length.out=31)
f