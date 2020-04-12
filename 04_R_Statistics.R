########################################
# STATISTICS CODES in R
# Prepared by Ugur Uresin, Data Engineer
########################################
# 1-INITIAL DATA CHECK
# 2-CENTAL TENDENCY AND VARIABILITY
# 3-RELATIVE STANDING
# 4-t TESTS
# 5-ANOVA
# 6-CORRELATION & REGRESSION
########################################



# 1-INITIAL DATA CHECK
########################################
head(mydata)    #shows first 6 rows of the data
tail(mydata)	  #shows last 6 rows of the data
tail(mydata,8)	#shows last 8 rows of the data
summary(mydata)	#shows the statistics of the data


# 2-CENTAL TENDENCY AND VARIABILITY
########################################
x <- c(10,20,30)
mean(x)   #Mean of the numbers in vector x.
median(x) #Median of the numbers in vector x
var(x)    #Estimated variance of the population from which the numbers in vector x are sampled
sd(x)     #Estimated standard deviation of the population from which the numbers in vector x are sampled
scale(x)  #Standard scores (z-scores) for the numbers in vector x
str(x)    #Displays the internal structure


# 3-RELATIVE STANDING
########################################
x <- c(30,10,20)
n <- 1
sort(x)     #The numbers in vector x in increasing order
sort(x)[n]	#The nth smallest number in vector x
rank(x)     #Ranks of the numbers (in increasing order) in vector x
rank(-x)    #Ranks of the numbers (in decreasing order) in vector x
quantile(x)	#The 0th, 25th, 50th, 75th, and 100th percentiles (i.e, the quartiles) of the numbers in vector x
rank(x,ties.method="average") #Ranks of the numbers (in increasing order) in vector x, with tied numbers given the average of the ranks that the ties would have attained
rank(x,ties.method="min")     #Ranks of the numbers (in increasing order) in vector x, with tied numbers given the minimum of the ranks that the ties would have attained
rank(x,ties.method="max")     #Ranks of the numbers (in increasing order) in vector x, with tied numbers given the maximum of the ranks that the ties would have attained


# 4-t TESTS
########################################
x <- c(1,2,3,4)
y <- c(5,6,7,8)
n <- 2.5

t.test(x,mu=n, alternative="two.sided") #Two-tailed t-test that the mean of the numbers in vector x is different from n.
t.test(x,mu=n, alternative="greater")	  #One-tailed t-test that the mean of the numbers in vector x is greater than n.
t.test(x,mu=n, alternative="less")	    #One-tailed t-test that the mean of the numbers in vector x is less than n.
t.test(x,y,mu=0, var.equal=TRUE, alternative="two.sided") #Two-tailed t-test that the mean of the numbers in vector x is different from the mean of the numbers in vector y. The variances in the two vectors are assumed to be equal.
t.test(x,y,mu=0, alternative="two.sided", paired=TRUE)    #Two-tailed t-test that the mean of the numbers in vector x is different from the mean of the numbers in vector y. The vectors represent matched samples.

# 5-ANOVA
########################################
x <- c(1,2,3,4)
y <- c(5,6,7,8)
z <- c(2,4,6,8)
d <- as.data.frame(cbind(x,y))
aov(y~x, data = d)                #Single-factor ANOVA, with the numbers in vector y as the dependent variable and the elements of vector x as the levels of the independent variable. The data are in data frame d.
aov(y~x + Error(w/x), data = d)   #Repeated Measures ANOVA, with the numbers in vector y as the dependent variable and the elements in vector x as the levels of an independent variable. Error(w/x) indicates that each element in vector w experiences all the levels of x (i.e., x is a repeated measure). The data are in data frame d.
aov(y~x*z, data = d)              #Two-factor ANOVA, with the numbers in vector y as the dependent variable and the elements of vectors x and z as the levels of the two independent variables. The data are in data frame d.
aov(y~x*z + Error(w/z), data = d) #Mixed ANOVA, with the numbers in vector z as the dependent variable and the elements of vectors x and y as the levels of the two independent variables. Error(w/z) indicates that each element in vector w experiences all the levels of z (i.e., z is a repeated measure). The data are in data frame d.


# 6-CORRELATION & REGRESSION
########################################
x <- c(1,2,3,4)
y <- c(2,4,6,9)
z <- c(1,1,1,2)
d1 <- cbind(x,y)
d2 <- as.data.frame(cbind(x,y,z))
cor(x,y)          #Correlation coefficient between the numbers in vector x and the numbers in vector y
cor.test(x,y)     #Correlation coefficient between the numbers in vector x and the numbers in vector y, along with a t-test of the significance of the correlation coefficient.
# Linear Regression
mymodel <- lm(y~x, data = d1) #Linear Regresion Model
coefficients(mymodel)         #Slope and intercept of linear regression of mymodel
confint(mymodel)              #Confidence intervals of the slope and intercept of linear regression of mymodel
lm(y~x+z, data = d2)          #Multiple regression analysis with the numbers in vector y as the dependent variable and the numbers in vectors x and z as the independent variables. Data are in data frame d.
lm(y~., data = d2)            #"." can be written for all variables except from y in the d2 data