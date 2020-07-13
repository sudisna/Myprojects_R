# Using the data from the spam email data file and using logistic regresion, create a predictive model to know if an email is spam or not. Use all the variables. (What are the significant variables and which is their order of importance?)

# Step 0: Importing libraries / installing packages:
install.packages("caTools")
install.packages("questionr")
install.packages("car")
library(caTools)
library(questionr)
library(car)

# Step 1: import the data and read the documentation 
# https://vincentarelbundock.github.io/Rdatasets/datasets.html

#spam <- read.csv("/cloud/project/spam7.csv")
# Step 2: Exploratory analysis
describe(spam)
summary(spam)
str(spam)
sum(is.na(spam))
# Step 3: Rename "crl.tot"
names(spam)[names(spam)== "crl.tot"] <-"lencap"

# Step 4: Splitting the data into train / test

split <-sample.split(spam,SplitRatio = 0.8)
train <-subset(spam,split=="TRUE") 
test  <-subset(spam,split=="FALSE")

# Step 5: Training the model. yesno is the dependant variable and the others are the independant. We need to recode yesno, redo the train / test and then run the model. 

spam$yesno <-recode(spam$yesno, "'y' = 1 ; 'n' = 0")
split <-sample.split(spam,SplitRatio = 0.8)
train <-subset(spam,split=="TRUE") 
test  <-subset(spam,split=="FALSE")

mymodel <- glm(yesno ~ lencap+dollar+bang+money+n000+make, data = train, family =
"binomial")
summary(mymodel)

# Comment: Dollar would be the strongest variable followed by n000,money,bang and lencap


# Step 6: Running the test data through the model

res <-predict(mymodel,test,type = 'response')

# Step 7: Creating the confusion matrix to validate the model

confmatrix <- table(Actual_value = test$yesno, Predicted_value = res > 0.5)
confmatrix
# Step 8: Calculating the accuracy of our model

(confmatrix[[1,1]] + confmatrix[[2,2]]) /sum(confmatrix)