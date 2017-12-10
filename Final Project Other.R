#kafta ,nagios automation tool
#derekkane
#columbia uni stats video
data = read.csv('LoansTrainingSetV2.csv')
dataset = data[3:19]

str(dataset)
#dataset[is.na(dataset)]<-0
#Removal Of Special Char
Sp_char<-function(x)
{ 
  x<-gsub('[$]','',x)
  x<-gsub('[<]','',x)
  x<-gsub('[+]','',x)
  x<-gsub('years','',x)
  x<-gsub('year','',x)
}
dataset$Years.in.current.job<-as.integer(Sp_char(dataset$Years.in.current.job))
dataset$Monthly.Debt<-as.numeric(Sp_char(dataset$Monthly.Debt))
dataset$Maximum.Open.Credit<-as.numeric(Sp_char(dataset$Maximum.Open.Credit))
str(dataset)

#Factoring
dataset$Loan.Status = factor(dataset$Loan.Status,
                             levels = unique(as.character(dataset$Loan.Status)),
                             labels = 1:length(unique(as.character(dataset$Loan.Status))))
dataset$Term = as.numeric(factor(dataset$Term,
                                 levels = unique(as.character(dataset$Term)),
                                 labels = 1:length(unique(as.character(dataset$Term)))))
dataset$Home.Ownership = as.numeric(factor(dataset$Home.Ownership,
                                           levels = unique(as.character(dataset$Home.Ownership)),
                                           labels = 1:length(unique(as.character(dataset$Home.Ownership)))))
dataset$Purpose = as.numeric(factor(dataset$Purpose,
                                    levels = unique(as.character(dataset$Purpose)),
                                    labels = 1:length(unique(as.character(dataset$Purpose)))))
#dataset$Months.since.last.delinquent = as.numeric(dataset$Months.since.last.delinquent)
#dataset$Bankruptcies = as.numeric(dataset$Bankruptcies)
#dataset$Tax.Liens = as.numeric(dataset$Tax.Liens)

str(dataset)

#Replacing na's
dataset$Credit.Score <- as.integer(ifelse(is.na(dataset$Credit.Score),mean(dataset$Credit.Score,na.rm=T),dataset$Credit.Score))
dataset$Years.in.current.job <- as.integer(ifelse(is.na(dataset$Years.in.current.job),mean(dataset$Years.in.current.job,na.rm=T),dataset$Years.in.current.job))
dataset$Annual.Income <- as.integer(ifelse(is.na(dataset$Annual.Income),mean(dataset$Annual.Income,na.rm=T),dataset$Annual.Income))
dataset$Bankruptcies <- as.integer(ifelse(is.na(dataset$Bankruptcies),mean(dataset$Bankruptcies,na.rm=T),dataset$Bankruptcies))
dataset$Tax.Liens <- as.integer(ifelse(is.na(dataset$Tax.Liens),mean(dataset$Tax.Liens,na.rm=T),dataset$Tax.Liens))
dataset$Months.since.last.delinquent <- as.integer(ifelse(is.na(dataset$Months.since.last.delinquent),mean(dataset$Months.since.last.delinquent,na.rm=T),dataset$Months.since.last.delinquent))
dataset$Maximum.Open.Credit <- ifelse(is.na(dataset$Maximum.Open.Credit),mean(dataset$Maximum.Open.Credit,na.rm=T),dataset$Maximum.Open.Credit)
