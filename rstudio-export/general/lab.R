#Basics
# Calculate 3 + 4
3 + 4
# Assign the value to x and y
x <- 3
y <- 4
# Print out the value of the sum
x + y
#Play with data
#Load the dataset from script
Admin <- read.csv("C:/Users/x250/Downloads/Admission_Predict.csv")
#See a summary of the dataset
summary(Admin)
#Rename column(all columns affected)
#colnames(Admin) <- c("Ironhack_number")
#Rename specific column
names(Admin)[names(Admin) == "TOEFL.Score"] <- "IELTS.Score"
#Another way to see the overview of the dataset
str(Admin)
#Head option to see first rows of the dataset:
head(Admin)
#Change the TOEFL for IELTS
Admin$IELTS.Score[Admin$IELTS.Score > 93 & Admin$IELTS.Score < 102] <- 7
# Get some values
min(Admin$GRE.Score)
max(Admin$GRE.Score)
median(Admin$GRE.Score)
mean(Admin$GRE.Score)
#Calculate the quantiles
quantile(Admin$GRE.Score)
# Calculate the Percentile
quantile(Admin$GRE.Score, c(.35, .55))
#Histogram
hist(Admin$GRE.Score)
hist(Admin$GRE.Score, main = "Histograms for Ironhack" , xlab= "GRE", ylab=
       "Frequency", border = "green", col="red")
#Boxplot
boxplot(Admin$SOP~Admin$LOR)
library(ggplot2)
#Scatter
ggplot(Admin, aes( GRE.Score, IELTS.Score)) + geom_point()
#Histogram
ggplot(Admin, aes(GRE.Score)) + geom_histogram(binwidth = 3)
#https://www.r-graph-gallery.com/
#Correlation
cor.test(Admin$University.Rating, Admin$Chance.of.Admit)
# T test
#In a company we’re asked to measure the efficiency of a web server.
#For that, we measure the waiting time of a client between the request and the response.
#Can we consider the waiting time as 9 milliseconds? Take α=0,1
t.test(Server$V1, mu=9, conf.level = 0.9)
