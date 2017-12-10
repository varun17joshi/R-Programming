#Basic statistics in R
csv<-read.csv('supermarkets.csv',h=T)


########Going throughh rows and columns #######

csv[,1]# to get 1st column as vector
csv[1,]# to get 1st row
csv[1,1]

csv[1]
nrow(csv)
length(csv)


summary(csv) #To get the summary of data set
mean(csv$POS_QTY) # To find mean of a particular column

library(Hmisc)
describe(csv) 
library(psych)
describe(csv) 

test<-mtcars#take an inbuilt dataset mtcars and put in a varibale named test

mtcars
mtcars$mpg  #miles per gallon
mtcars$am   #transmission type 0=auto 1 = manual

##Problem
#Assuming that the data in mtcars follows the normal distribution, find the 95% confidence interval
#estimate of the difference between the mean gas mileage of manual and automatic transmissions.


L = mtcars$am == 0 
 mpg.auto = mtcars[L,]$mpg 
 mpg.auto                    # automatic transmission mileage 
 
 #By applying the negation of L, we can find the gas mileage for manual transmission.
 mpg.manual = mtcars[!L,]$mpg 
 mpg.manual 
 
 
 
 ### t -test ###
 
 t.test(mpg.auto, mpg.manual) 
 
 
#  
#  Answer
#  In mtcars, the mean mileage of automatic transmission is 17.147 mpg and the manual transmission is 24.392 mpg.
#  The 95% confidence interval of the difference in mean gas mileage is between 3.2097 and 11.2802 mpg.
 
 
 
 ########testing corelation for significance
 

 
 # Correlation matrix from mtcars
 # with mpg, cyl, and disp as rows 
 # and hp, drat, and wt as columns 
 x <- mtcars[1:3]
 y <- mtcars[4:6]
 cor(x, y)
 
 
 ######testing proportions in R
 
 #prop.test can be used for testing the null that the proportions (probabilities of success) 
 #in several groups are the same,or that they equal certain given values.
 
 smokers  <- c( 83, 90, 129, 70 )
 patients <- c( 86, 93, 136, 82 )
 prop.test(smokers, patients)
 
#  
#  Prop.test function calculates the value of chi-square, given the 
#  values of success (in the vector x) and total attempts (in the vector n). 
#  The vectors x and n can also be previously declared, 
#  and then be retrieved as usual: prop.test (x, n, correct = FALSE).
 
 plant.df = PlantGrowth
 plant.df$group = factor(plant.df$group,
                         labels = c("Control", "Treatment 1", "Treatment 2"))
 
 plant.mod1 = lm(weight ~ group, data = plant.df)
 summary(plant.mod1)
 
 
 anova(plant.mod1)
 