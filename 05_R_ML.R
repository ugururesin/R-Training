########################################
# MACHINE LEARNING CODES in R
# Prepared by Ugur Uresin, Data Engineer
########################################
# 1-SIMPLE LINEAR REGRESSION 
# 2-DECISION TREES
# 3-Simple kNN ALGORITHM
# 4-CONVOLUTIONAL NEURAL NETWORK
# 5-RANDOM-FOREST ALGORITHM
########################################



# 1-SIMPLE LINEAR REGRESSION (Simple Means 1 Variable)
########################################
# EXAMPLE (Let's Predict the Price of a House According to its Size)
house=data.frame(
  size=c(80,83,76,60,90,100,120,200,45,140,140,180,190,
                190,200,220,250,160,200,190,300,270,245,100,120),
  price=c(150000,153000,140000,120000,150000,160000,160000,160000,
          200000,150000,170000,180000,175000,180000,200000,230000,
          260000,150000,200000,195000,280000,255000,230000,110000,130000)
)
View(house)
# MODEL CREATION
y_price=lm(formula=price~size,data=house)   # price~. takes all variables (except price) as independent variables
# STATISTICS OF THE MODEL
summary(y_price)  # Estimate: When the variable (size) increases by 1 unit, how much price increases?
                  # Multiple R-squared: Only with the variable (size) how much can we explain the price?      
                  # P-value: if it's <0.05, the variable (size) is statistically significant
# PREDICTION MAKING
example.sizes=data.frame(
  size = c(90,110,150,200)
)
price_predictions = predict(y_price,example.sizes)  #prediction parameter is set
price_predictions                                   #prediction result is given

plot(x=house$size, y=house$price)                     #To plot house data
abline(lm(formula= price~., data=house),col="red")    #To draw the prediction curve (lm) 



# 2-DECISION TREES
########################################
# Not numeric prediction but factors!
# Not a good predictor but has a good visualization!
#
# PACKAGE INSTALL:
install.packages("tree")
library(tree)
# EXAMPLE:
car <- read.csv("/Users/UGUR/Desktop/R/_data/car_data/car.data",sep=",",header=F)     #ASK the data uresinugur35@gmail.com
heads <- c("Price","MaintenanceCost","Doors","Seats","Luggage","Safety","Evaluation") #DO NOT USE SPACE in HEADER NAMES!!!
names(car) <- heads
View(car)
car <- as.data.frame(car)
# TREE FUNCTION
?tree
# MODEL CREATION
my.decision.tree = tree(Evaluation~., data=car)
#RESULTS
my.decision.tree
#PLOTTING
plot(my.decision.tree)
text(my.decision.tree)          #Default, text size is not the optimal
plot(my.decision.tree)
text(my.decision.tree, cex=0.6) #cex=text size
#PREDICTION MAKING
new.car=car[140,]
newcar.result = predict(my.decision.tree, new.car)
newcar.result   #the result would be "unacc"


# 3-Simple kNN ALGORITHM
########################################
# EXAMPLE
a=c(160,163,168,175,180,190,165,170,185,184,191,168,178,163,176)  #heights of a sample
b=c(50,52,70,59,80,85,51,63,79,70,72,57,60,70,90)                 #weights of a sample
s=c("F","F","M","F","M","M","F","M","M","F","F","M","F","M","M")  #genders of a sample
gender=as.factor(z)
mydata = data.frame(Height=a,Weight=b,Gender=s)
# PLOTTING
install.packages("ggplot2")
library(ggplot2)
ggplot(mydata)+geom_point(aes(x=Height,y=Weight,col=Gender))
#
# PREDICTION MAKING
library("class")  #Default package in R, no need to install
# Prediction Example1
person1=c(180,65)
result1 = knn(cbind(a,b),person1,s) #default k=1
result1
# Prediction Example2
person2=c(187,75)
results2 = knn(cbind(a,b),k=3,person2,s)  #try different k values
results2
#
# TRAIN & TEST kNN
# EXAMPLE
install.packages("ISLR")
library("ISLR")
?Caravan                  #Read the description of the data
View(Caravan)             #Look the data 
dim(Caravan)              #Dimension of the data is 5822*86
karavan=Caravan           #Assign the data so that the original is kept
summary(karavan$Purchase) #5474 NO, 348 YES
karavan2=karavan[,-86]    #Extracting the non-numeric value
# NORMALIZING
karavan2=scale(karavan2)
View(karavan2)
sqrt(var(Caravan[,2]))
mean(var(Caravan[,2]))
# MODEL CREATION
test =1:1000
test.X=karavan2[test,]            #Use first 1000 X value for testing
train.X=karavan2[-test,]          #Use left X values for training
#
test.Y=karavan$Purchase[test]     #Use first 1000 Y value for testing
train.Y=karavan$Purchase[-test]   #Use left Y values for training
#
prediction_model = knn(train.X, test.X, train.Y, k=5)
mean(test.Y !=prediction_model)
mean(test.Y !="No")
mean(test.Y !="Yes")
#
# PREDICTION MAKING
table(prediction_model,test.Y)
#


# 4-CONVOLUTIONAL NEURAL NETWORK
########################################
# NOTE: All Variables Must Be Numeric for CNN!!!
# PACKAGE INSTALL FOR DATA: Boston
install.packages(MASS)
library(MASS)
# PACKAGE INSTALL FOR: neuralnet 
install.packages("neuralnet")
library(neuralnet)
#
# DATA CHECK
View(Boston)
# The variable to be predicted must be between 0 and 1
# Other variables must be subtracted from their means and divided to their standard deviations.
# NORMALIZING THE VARIABLE TO BE PREDICTED (medv)
Boston.scaled <- as.data.frame(scale(Boston))
min.medv <- min(Boston$medv)
max.medv <- max(Boston$medv)
Boston.scaled$medv <- scale(Boston$medv, center = min.medv, scale = max.medv - min.medv)
# TRAIN & TEST DATA PARTITION
Boston.train.scaled <- Boston.scaled[1:400, ]
Boston.test.scaled <- Boston.scaled[401:506, ]
# MODEL CREATION
# All variables must be written one by one when using the neural networks function!
# Use the model.matrix function if you have a variable with multiple categories (?model.matrix)
# First Model (2 hidden layers with 5&3 nodes)
Boston.nn.5.3 <- neuralnet(medv~crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat,
                           data=Boston.train.scaled,
                           hidden=c(5,3),
                           linear.output=TRUE)
plot(Boston.nn.5.3)         #To display the neural-network
#Second Model (1 hidden layer with 8 nodes)
Boston.nn.8 <- neuralnet(medv~crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat,
                         data=Boston.train.scaled,
                         hidden=8,
                         linear.output=TRUE)
plot(Boston.nn.8)           #To display the neural-network


# 5-RANDOM-FOREST ALGORITHM (DATA IS MISSING!!!) CORRECT HERE!!!
########################################
# PACKAGE INSTALL
install.packages("randomForest")
library("randomForest")
# INFO
# ntree: Number of tress to grow
# ntry: Number of variables randomly sampled as candidates at each split
# MODEL CREATION
rf = randomForest(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + kabinbiliniyor, data=train.1, ntry=3, ntree=1000)
# There are 7 variables, ntry should be sqrt(7)≈3
mypredictions = predict(rf, test.1[,c(3,5,6,7,8,10,14)])
table(mypredictions, test.1$Survived)
sum(test.1$Survived==0)
sum(test.1$Survived==1)
myaccuracy=(103+51)/181 #85% accured
#Who is survived?
tahminler.1 = predict(rf, test[,c(3,5,6,7,8,10,14)])
length(tahminler.1)
sonuc = test$PassengerId
sonuc = as.data.frame(sonuc)
colnames(sonuc)=c("PassengerId")
sonuc$Survived = tahminler.1
getwd()
setwd("/Users/UGUR/Desktop")
write.csv(sonuc, "sonuc.csv", row.names=F)



################????????

########################################
#Data IMPORT
test = read.csv("/Users/UGUR/Desktop/R/_data/titanic_data/test.csv")
train = read.csv("/Users/UGUR/Desktop/R/_data/titanic_data/train.csv")

View(test)
View(train)

#There is no Survived col in test data, let's create
test$Survived=NA

#Test-Train Data Merge
tam.veri=rbind(train,test)
str(tam.veri)

#Survived ve Pclass 'int' olarak tanimlanmis
#Bunlarin 'int' ozelligi gereksiz. Faktore cevirmek, gorsellestirmede avantaj saglar
#Name, factor olarak verilmis. Sadece isim bilgisi old. icin karaktere donusturulebilir
#Sex, factor olarak verilmis. Istenen durumdur
#Age, numeric. Istenen durumdur
#SibSp: Birlikte yolculuk edilen kardes sayisi
#Parch: Birlikte yolculuk edilen anne-baba sayisi
#Ticket, karaktere donusturulebilir
#Fare, numeric. Istenen durumdur
#Cabin, faktor olarak verilmis. Kategorik yapilabilir...
#Embarked (S:Southampton, C:Cherbourg, Q:Queenstown). Faktor olmasi istenen durumdur

#DPLYR PACKAGE FOR DATA MANIPULATION
#Check for dplyr https://www.listendata.com/2016/08/dplyr-tutorial.html
install.package("dplyr")
library(dplyr)

#ggplot'da gecisler icin + kullaniyorduk
#dplyr iskeletinde gecisler %>% ile yapilir

#veri tipi donusumleri
tam.veri = tam.veri %>% mutate (Survived=factor(Survived), Pclass=factor(Pclass), Cabin=as.character(Cabin), Ticket= as.character(Ticket), Name=as.character(Name))

#Visualization
install.packages("ggplot2")
library(ggplot2)
gorsel.veri=tam.veri[1:891,]
p1 = ggplot(gorsel.veri)+geom_bar(mapping=aes(x=Pclass, fill=Survived),position="fill")
p2 = ggplot(gorsel.veri)+geom_freqpoly(mapping=aes(x=Age, color=Survived),bins=50)+theme(legend.position="none") #bins 'Age'yi 50 gruba ayirir.
p3 = ggplot(gorsel.veri)+geom_freqpoly(mapping=aes(x=Fare, color=Survived),bins=30)+theme(legend.position="none") #bins 'Fare'yi 30 gruba ayirir.
p4 = ggplot(gorsel.veri)+geom_bar(mapping=aes(x=SibSp+Parch, fill=Survived),position="fill")+theme(legend.position="none")
#ALTTAKI KODU CALISTIRMADAN ONCE PLOT ALANINI BUYUT (YOKSA R KAPANABILIR)!!!
ggplot2.multiplot(p1,p2,p3,p4)

#FINDING NA VALUES (is.na)
sum(is.na(tam.veri$Sex)) #Only for Sex column

#Applying it all cols
apply(tam.veri, 2, function(x) sum(is.na(x))) #2 for col based, 1 for row based

#Age'de NA olmayan satirlar
#Not: ! ,islemi tersine cevirir (Orn. !TRUE=FALSE)
tam.veri[!is.na(tam.veri$Age),]$Age

#Age sutununda NA olan degerlerin doldurulmasi 
tam.veri=tam.veri %>% group_by(Unvan) %>%
  mutate(Age = ifelse(is.na(Age), round(median(Age, na.rm=T), 1), Age))
#Yukarida, her grup icin mutate fonksiyonu calisir
#Eger "Age" NA ise, sutundaki median degerini al ve yuvarla (round)
#Eger "Age" NA degilse, Age degerini al 
#na.rm is NA degerleri remove eder!
mean(tam.veri$Age)
View(tam.veri)

#cabin sutunundaki bos degerler
kabinbiliniyor = ifelse(tam.veri$Cabin == "", FALSE,TRUE)
tam.veri$kabinbiliniyor = kabinbiliniyor
View(tam.veri)

ggplot(tam.veri[1:891,])+geom_bar(mapping=aes(x=kabinbiliniyor, fill=Survived),position="fill")

tam.veri %>% filter(is.na(Fare))
Fare = ifelse(is.na(tam.veri$Fare), round(median(tam.veri$Fare, na.rm=T), 1), tam.veri$Fare)
tam.veri$Fare = Fare #new Fare sutunu tam.veri'ye eklenir
View(tam.veri)

#####################
#TEST-TRAIN PARTITION
train = tam.veri [1:891,]
test = tam.veri [892:1309,]

#80%-20% partition
train.1=train[1:710,]
test.1=train[711:891,]