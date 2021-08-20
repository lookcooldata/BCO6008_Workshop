#install.packages('MASS')
#install.packages('ISLR')
library(ISLR)
library(MASS)
library(tidymodels)

#setting seed
set.seed(123)

#setting configuration for models
lm_spec<-linear_reg()%>%
  set_mode("regression")%>%
  set_engine("lm")

#this data is considered ideal and therefore we skipping the steps of making a recipe
data(Boston)

#applying the model to the data to predict variable medv based on variable lstat
lm_fit<- lm_spec%>%
  fit(data=Boston, medv~lstat)

#summarize the regression results 
lm_fit%>%
  pluck("fit")%>%
  summary()

#tidy shows us a easier to comprehend version of summary
tidy(lm_fit)

#predicts the values specified (medv based on lstat) in new data set
predict(lm_fit, new_data = Boston)

#augment will put the predicted data next to the actual data in the data set
augment(lm_fit, new_data = Boston)%>%
  select(medv, .pred)


#Trying again from step 1
#rm(list = ls())
#step 1
data(Boston)
model_spec<-linear_reg()%>%
  set_mode("regression")%>%
  set_engine("lm")

#step 2
model_fit<-model_spec%>%
  fit(data=Boston, medv~age+crim+rm)

#step 3
model_augmented<-augment(model_fit, new_data = Boston)%>%
  select(medv, .pred)





#step 1
test_spec<- linear_reg()%>%
  set_mode("regression")%>%
  set_engine("lm")

#step 2
test_fit<-test_spec%>%fit(data=Boston, medv~nox+tax)

#step 3
test_augmented<-augment(test_fit, new_data = Boston)%>%
  select(medv, .pred)
