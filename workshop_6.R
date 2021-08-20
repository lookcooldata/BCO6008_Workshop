library(tidymodels)
library(skimr)

##loading the data
data(ames)

##reviewing the data
ames$Sale_Price%>%head()
ames %>% skim()

##cleaning the data
##using log scale to deal with the large range of prices 
ames<-ames %>% mutate(Sale_Price = log10(Sale_Price))


set.seed(123)
ames_split<-initial_split(ames, prop = 0.8, strata = Sale_Price)
