#####Appending data to vectors in R

b <- 1
b <- c(b, 2)
b
c<-c(1,2,3,4,4)

###combining multiple vectors

d<-c(b,c)
d

##unique values of d
unique(d)

##merging data frames in R
total <- merge(data frameA,data frameB,by="ID")


##date values in R

# use as.Date( ) to convert strings to dates 
mydates <- as.Date(c("2007-06-22", "2004-02-13"))
# number of days between 6/22/07 and 2/13/04 
days <- mydates[1] - mydates[2]

##Todays date
Sys.Date()
Sys.time()


# print today's date
today <- Sys.Date()
format(today, format="%B %d %Y")


# convert date info in format 'mm/dd/yyyy'
strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")


mydates <- as.Date(c("2007-06-22", "2004-02-13"))

# convert dates to character data
strDates <- as.character(dates)





########Strings in R
s <- "EndMemo.com R Language Tutorial"
substr(s,0,7)

#Get string length: 
nchar(s)

#To uppercase:
x <- toupper(s)
x

#To lowercase:
x <- tolower(s)
x

#Split the string at letter "o":
x <- strsplit(s,"o")
x

#Concatenate two strings:
x <- paste(x," -- String Functions",sep="")
x

#Substring replacement:
x <- sub("Tutorial","Examples",s)
x

#Use regular expression:
x <- sub("n.+e","XXX",s)
x


###Handling Na's n missing values in R
is.na(x) # returns TRUE of x is missing
y <- c(1,2,3,NA)
is.na(y) # returns a vector (F F F T)


# recode 99 to missing for variable v1
# select rows where v1 is 99 and recode column v1 
mydata$v1[mydata$v1==99] <- NA


x <- c(1,2,NA,3)
mean(x) # returns NA
mean(x, na.rm=TRUE) # returns 2


newdata <- na.omit(mydata)



######Operators in R

x <- c(1:10)
x
x > 8
x < 5
x > 8 | x < 5
x[c(T,T,T,T,F,F,F,F,T,T)]
x[(x>8) | (x<5)]


  
###Matrices in R
A = matrix( 
     c(2, 4, 3, 1, 5, 7), # the data elements 
     nrow=2,              # number of rows 
     ncol=3,              # number of columns 
     byrow = TRUE)        # fill matrix by rows 

A[2, 3]

A[2, ]  
A[ ,3]   
A[ ,c(1,3)]
dimnames(A) = list( 
    c("row1", "row2"),         # row names 
     c("col1", "col2", "col3")) # column names 

t(B)

C = matrix( 
     c(7, 4, 2), 
     nrow=3, 
     ncol=1) 

cbind(B, C)

D = matrix( 
    c(6, 2), 
     nrow=1, 
     ncol=2) 
rbind(B, D) 

c(B) 



###Aggregate data in R

# aggregate data frame mtcars by cyl and vs, returning means
# for numeric variables
attach(mtcars)
aggdata <-aggregate(mtcars, by=list(cyl,vs), 
                    FUN=mean, na.rm=TRUE)
print(aggdata)



###Subsetting data in R
# select variables v1, v2, v3
myvars <- c("v1", "v2", "v3")
newdata <- mydata[myvars]

# another method
myvars <- paste("v", 1:3, sep="")
newdata <- mydata[myvars]

# select 1st and 5th thru 10th variables
newdata <- mydata[c(1,5:10)]

##using subset function

newdata <- subset(mydata, age >= 20 | age < 10, 
                  select=c(ID, Weight))