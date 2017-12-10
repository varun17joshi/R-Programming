#Set working directory
setwd("D:\\Varun Joshi\\Data Science\\Resourses\\LoansTrainingSetV2")


#load required libraries
library(caTools)
library(e1071)
library(ElemStatLearn)
library(rpart)
library(randomForest)
require(stringi)

#Load the data
dataset <- read.csv("LoansTrainingSetV2.csv")

#data cleansing
dataset <- dataset[3:19]
dataset <- dataset[,c(2:17,1)]

#Count of row where NA is present
is.na.present <- apply(dataset, 1, function(x){any(is.na(x)) | any(is.null(x)) })
total.na.count <- sum(is.na.present) 
total.na.count

#Find count of NA
column_wise_na_unprpcessed <- as.data.frame(colSums(is.na(dataset)))
colnames(column_wise_na_unprpcessed) <- c("Count.of.NA")
column_wise_na_unprpcessed

#Find column type
column_types_before <- as.data.frame(sapply(dataset, class))
colnames(column_types_before) <- c("Type")
column_types_before

#remove 'n/a' character
sum(dataset$Years.in.current.job == "n/a")    
sum(is.na(dataset$Years.in.current.job))     
dataset$Years.in.current.job <- stri_replace_all(dataset$Years.in.current.job, NA, fixed="n/a") 
dataset$Years.in.current.job <- as.character(dataset$Years.in.current.job) 

#remove '$' character
sum(grepl('\\$',dataset$Monthly.Debt))        
sum(is.na(dataset$Monthly.Debt))              
dataset$Monthly.Debt <- stri_replace_all(dataset$Monthly.Debt, "", fixed="$") 
dataset$Monthly.Debt <- as.numeric(as.character(dataset$Monthly.Debt))
                  


#Replace '#VALUE!' character
sum(dataset$Maximum.Open.Credit == "#VALUE!") 
sum(is.na(dataset$Maximum.Open.Credit))       
dataset$Maximum.Open.Credit <- stri_replace_all(dataset$Maximum.Open.Credit, NA, fixed="#VALUE!") #remove the #value with ""
dataset$Maximum.Open.Credit <- as.integer(as.character(dataset$Maximum.Open.Credit))



#special characters and "n/a" removed. again count NA
#Find count of NA after replacing special characters
column_wise_na_half_processed <- as.data.frame(colSums(is.na(dataset)))
colnames(column_wise_na_half_processed) <- c("Count.of.NA")
column_wise_na_half_processed

#process Years.in.current.job  column
class(dataset$Years.in.current.job)          # initially charcter
#
#
#------TODO-----#
#
#


#process credit score column
class(dataset$Credit.Score)# initially integer
dataset$Credit.Score[is.na(dataset$Credit.Score)] <- round(mean(dataset$Credit.Score, na.rm = TRUE))#replace NA with column mean
sum(is.na(dataset$Credit.Score))#0 na after processing
class(dataset$Credit.Score)# converted to numeric


#process Annual income column
class(dataset$Annual.Income)# initially integer
dataset$Annual.Income[is.na(dataset$Annual.Income)] <- round(mean(dataset$Annual.Income, na.rm = TRUE))#replace NA with column mean
uclass(dataset$Annual.Income)# converted to numeric 

#process Months.since.last.delinquent  column
class(dataset$Months.since.last.delinquent)# initially integer
dataset$Months.since.last.delinquent[is.na(dataset$Months.since.last.delinquent)] <- round(mean(dataset$Months.since.last.delinquent, na.rm = TRUE))#replace NA with column mean
class(dataset$Months.since.last.delinquent)# converted to numeric 

#process Bankruptcies  column
class(dataset$Bankruptcies)# initially integer
dataset$Bankruptcies[is.na(dataset$Bankruptcies)] <- round(mean(dataset$Bankruptcies, na.rm = TRUE))#replace NA with column mean

class(dataset$Bankruptcies)# converted to numeric 

#process Tax.Liens  column
class(dataset$Tax.Liens)# initially integer
dataset$Tax.Liens[is.na(dataset$Tax.Liens)] <- round(mean(dataset$Tax.Liens, na.rm = TRUE))#replace NA with column mean
class(dataset$Tax.Liens)# converted to numeric 

#process Maximum.Open.Credit  column
class(dataset$Maximum.Open.Credit)# initially integer
dataset$Maximum.Open.Credit[is.na(dataset$Maximum.Open.Credit)] <- round(mean(dataset$Maximum.Open.Credit, na.rm = TRUE))#replace NA with column mean
class(dataset$Maximum.Open.Credit)# converted to numeric 

#Find count of NA after processing data
column_wise_na_processed <- as.data.frame(colSums(is.na(dataset)))
colnames(column_wise_na_processed) <- c("Count.of.NA")
column_wise_na_processed


#convert categorical variable to factor

#Convert term to factor
dataset$Term <-factor(dataset$Term, labels <- unique(dataset$Term), levels <- c(1:(length(unique(dataset$Term)))))

#convert Home.Ownership  to factor
dataset$Home.Ownership <-factor(dataset$Home.Ownership, labels <- unique(dataset$Home.Ownership), levels <- c(1:(length(unique(dataset$Home.Ownership)))))

#convert Purpose  to factor
dataset$Purpose <-factor(dataset$Purpose, labels <- unique(dataset$Purpose), levels <- c(1:(length(unique(dataset$Purpose)))))

#convert Loan.Status  to factor
dataset$Loan.Status <-factor(dataset$Loan.Status, labels <- unique(dataset$Loan.Status), levels <- c(1:(length(unique(dataset$Loan.Status)))))


#Find column type after processing
column_types_after <- as.data.frame(sapply(dataset, class))
colnames(column_types_after) <- c("Type")
column_types_after

#scale the variables
dataset[, -c(2,4,5,7,17)] <- scale(dataset[, -c(2,4,5,7,17)])


#Temporarily remove Years.In.Current.Job
#dataset <- dataset[-4]

#Create training and test dataset
set.seed(100)
split = sample.split(dataset$Loan.Status, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Create model - Logistic regression
#Current.Credit.Balance and Tax.Liens not significant
classifier = glm(formula = Loan.Status ~ ., family = binomial, data = training_set)
summary(classifier)
prob_pred = predict(classifier, type = 'response', newdata = test_set)
y_pred = ifelse(prob_pred > 0.5, 1, 0)
cm = table(test_set[, 17], y_pred > 0.5)
cm
