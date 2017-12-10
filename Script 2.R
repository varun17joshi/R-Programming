#Here is a list of data types in R

# 1.Vectors
# 2.Lists
# 3.Matrices
# 4.Arrays
# 5.Factors
# 6.Data Frames

#How to know class of a variable? When I say I mean data type
#use the function class("vARIABLE NAME")



#The simplest of these objects is the vector object and 
#there are six data types of these atomic vectors, also termed as six classes of vectors.
#The other R-Objects are built upon the atomic vectors.

#Example of each one
#Logical 
v <- TRUE 
print(class(v))

#numeric
v <- 23.5
print(class(v))

#Integer
v <- 2L
print(class(v))

#Complex
v <- 2+5i
print(class(v))


#Character
v <- "TRUE"
print(class(v))

#raw #"Hello" is stored as 48 65 6c 6c 6f
v <- charToRaw("Hello")
print(class(v))



#Vectors

#When you want to create vector with more than one element, 
#you should use c() function which means to combine the elements into a vector.

# Create a vector.
apple <- c('red','green',"yellow")
print(apple)

# Get the class of the vector.
print(class(apple))



#Lists

#A list is an R-object which can contain many different types of elements inside it like vectors,
#functions and even another list inside it.

# Create a list.
list1 <- list(c(2,5,3),21.3,sin)

# Print the list.
print(list1)


#Matrices

#A matrix is a two-dimensional rectangular data set.
#It can be created using a vector input to the matrix function.

# Create a matrix.
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)


#Arrays

#While matrices are confined to two dimensions,
#arrays can be of any number of dimensions.
#The array function takes a dim attribute which creates the required number of dimension. 
#In the below example we create an array with two elements which are 3x3 matrices each.

# Create an array.
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)


#Factors

#Factors are the r-objects which are created using a vector. 
#It stores the vector along with the distinct values of the elements in the vector as labels.
#The labels are always character irrespective of whether it is numeric or character or Boolean etc.
#in the input vector. They are useful in statistical modeling.
#Factors are created using the factor() function.
#The nlevels functions gives the count of levels.

# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')

# Create a factor object.
factor_apple <- factor(apple_colors)

# Print the factor.
print(factor_apple)
print(nlevels(factor_apple))

#Data Frames

#Data frames are tabular data objects. Unlike a matrix in data frame each column can contain different modes of data. 
#The first column can be numeric while the second column can be character and third column can be logical.
#It is a list of vectors of equal length.


# Create the data frame.
BMI <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)


#Getting current directory in R 

getwd()

#Setting working directory in R

setwd('Your directory path')

#####################################################################################



##Reading and writing files in R##


df <- read.table("New Text Document (2).txt",sep=';',header = F)

df <- read.table("New Text Document.txt",header = T)

df <- read.table("New Text Document.txt",header = FALSE,sep="/",strip.white = TRUE,na.strings = "EMPTY")


csv<-read.csv('kk.csv',h=T)


########Going throughh rows and columns #######

csv[,1]# to get 1st column as vector
csv[1,]# to get 1st row
csv[1,1]

csv[1]
nrow(csv)
length(csv)

#Dollar operator to access columns
