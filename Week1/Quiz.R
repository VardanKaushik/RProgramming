setwd("C:/Users/Kaushik/Desktop/R_Johns/R_Programming/Week1")

#QUESTION 12
data<-read.csv("hw1_data.csv", nrows = 2)
data
 
#QUESTION 11
 #data<read.csv("hw1_data.csv", nrows=100)
classes<-sapply(data,class) #usally done by reading 100 rows first
classes
data<-read.csv("hw1_data.csv", colClasses = classes)

#QUESTION 13
attributes(data) #gives total number of rows, col names, class type

#QUESTION 14
LastTwoRows<-data[c(152,153),] #Gives the last two rows of the data set

#QUESTION 15
data$Ozone[47] #Gives the value of Ozone on row 47
data[["Ozone"]][47] #So does this
 #data["Ozone"] Gives the entire column

#QUESTION 16 for total number of missing values in ozone
bad<-is.na(data["Ozone"])
NoMissing<-data[["Ozone"]][!bad]
TotalMissing<-dim(data["Ozone"])[1] - length(NoMissing)
TotalMissing

#QUESTION 17 for the MEAN of OZONE values
#mean(data["Ozone"]) doesn't work; mean gives an ERROR if there are MISSING VALUES in the data set
# so in order to calculate the mean, calculate the mean of non missing values
mean(NoMissing)

#QUESTION 18
Good<-complete.cases(data)
CompleteData<-data[Good,]
Ozone31<-CompleteData["Ozone"]>31
NewData<-CompleteData[Ozone31,]
Temp90<-NewData["Temp"]>90
NewData<-NewData[Temp90,]
mean(NewData$Solar.R)

#QUESTION 19
Month6<-CompleteData["Month"]==6
NewData<-CompleteData[Month6,]
mean(NewData$Temp)
# mean(CompleteData[CompleteData$Month==6,]$Temp) in one line

#QUESTION 20
max(CompleteData[CompleteData$Month==5,]$Ozone)