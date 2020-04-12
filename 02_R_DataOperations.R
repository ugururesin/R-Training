########################################
# DATA OPERATION CODES in R
# Prepared by Ugur Uresin, Data Engineer
########################################
# 1-NA & NULL
# 2-GENERIC DATA FUNCTIONS
# 3-VECTORS
# 4-MATRICES
# 5-ARRAYS
# 6-DATA FRAMES
# 7-LISTS
# 8-FACTORS
# 9-DATA CONVERSIONS
########################################



# 1-NA & NULL
########################################
# DEFINITION: Both NA & NULL represent a 'Missing' or 'Not Entered' value
# DIFFERENCE: NULL has a class but NA!


# 2-GENERIC DATA FUNCTIONS
########################################
object <- c("Tim"=1,"Sue"=2,"Tom"=3)
object
length(object)  #Number of elements or components
str(object)     #Structure of an object 
class(object)   #Class or type of an object
names(object)   #Names
#
c(object,object)      #Combine objects into a vector
cbind(object,object)  #Combine objects as columns
rbind(object,object)  #Combine objects as rows
#
ls()       #List current objects
rm(object) #Delete an object
#
newobject <- edit(object) #Edit copy and save as newobject 
fix(object)               #Edit in place
# DATA RANGES
mydata1 <- c(1,2,5,9)
mydata2 <- c(3,4,6,7)
range(mydata1,mydata2)
range(0,mydata1,mydata2) #Starts from 0
########################################


# 3-VECTORS
########################################
# Note: For arithmetic operations the sizes must be same!!!
#
# VECTOR TYPES
my_vector <- c(1,2,3,4,5)    #vector type is double
my_vector <- c("mr","mrs")   #vector type is character
my_vector <- c(T,F)          #vector type is logical
my_vector <- c(1,T,"mr")     #vector type is character
my_vector <- 1:5; x          #creates a vector in a given range!
my_vector <- seq(1,2,by=0.2)        #creates a vector with a step size!
my_vector <- seq(1,5,length.out=3)  #creates a vector with an interval and size!
# ACCESS TO ELEMENTS
my_vector[1]                #1st element of the myvector
my_vector[c(1,2)]           #1st and 2nd elements of the myvector
my_vector[my_vector<0]      #negative elements of the myvector
my_vector[my_vector>0]      #positive elements of the myvector
# ASSIGN INDEX
my_vector <- c("first"=3,"second"=5,"third"=7)
my_vector
# COMBINE NUMERIC VECTORS
a <- c(1,2,3,4)
b <- c(5,6,7,8)
coldata <- cbind(a,b) # merge two vector as two cols
rowdata <- rbind(a,b) # merge two vector as two rows


# 4-MATRICES
########################################
# NOTE: All columns in a matrix must have the same mode(numeric, character, etc.) 
#
# MATRIX CREATION
mymatrix <- matrix(1:9, nrow=3, byrow=T) # byrow=T/F is to order elements byrow
# COL AND ROW NAMES
colnames(mymatrix) <- c("A","B","C")
rownames(mymatrix) <- c("D","E","F")
mymatrix
# COMBINE MATRICES
A <- matrix(c(1,2,3,4),ncol=2,byrow=F)
B <- matrix(c(5,6))
C <- matrix(c(8,9))
cbind(A,B)
rbind(B,C)


# 5-ARRAYS
########################################
# Arrays are similar to matrices but can have more than two dimensions


# 6-DATA FRAMES
########################################
# NOTE: A data frame is more general than a matrix
# Different columns can have different modes (numeric, character, factor, etc.)
#
# DF CREATION (WAY 1)
d <- c(1,2,3,4)
e <- c("red", "blue", "grey", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
mydf1 <- data.frame(d,e,f)
names(mydf1) <- c("ID","Color","Passed") #variable names
mydf1
# DF CREATION (WAY 2)
mydf2 <- data.frame(
  Names=c("Tom","Sue","Kim","Joe"),
  Gender=c("M","F","F","M"))
mydf2


# 7-LISTS
########################################
# NOTE: An ordered collection of objects (components)
# A list allows you to gather a variety of (possibly unrelated) objects under one name
#
mylist1 <- list(Name="Jack",Sex="M",Age="22",Married=F)
mylist2 <- list(Name="Sue",Sex="F",Age="25",Married=T)
# COMBINE LISTS
mylist <- c(mylist1,mylist2)
mylist


# 8-FACTORS
########################################
# Factors are basically character variables (Example: Female and Male)
# Names should NOT be categorized as factors (Example: Ali, Tom, Sue)
#
# FACTOR CREATION
answers=c("T","T","F","E","T","T","E")          #Gives 7 characters
summary(answers)                        
answersF=factor(answers,levels=c("T","F","E"))  #Gives 3 factors w different frequencies
summary(answersF)
#
# FACTOR LEVEL SETTING:
X=c("Fair","Good","Very Good","Premimum","Ideal")
is.ordered(X)         #Gives FALSE!
orderedX=factor(X,levels=c("Fair","Good","Very Good","Premimum","Ideal"),ordered=T)
is.ordered(orderedX)  #Gives TRUE!
#
# FACTOR VARIABLE TRAP (FVT)
########################################
# Transforming a factor containing numbers to numerical value gives the position of the levels (instead of the content of the variable)!
# EXAMPLE 
a <- c("12","13","14","12","12")          #Converting chars into numerics
typeof(a)							                    #character
b <- as.numeric(a)					              
typeof(b)							                    #double (No Problem Here)
#
z <- factor(c("12","13","14","12","12"))  #Converting factors into numerics
z									                        #factor w levels: 12 13 14
typeof(z)							                    #integer
y <- as.numeric(z)	
y                                         #gives "1 2 3 1 1" (it means 1st factor, 2nd factor, 3rd factor, 1st factor, 1st factor): FVT Problem!!!
# CORRECT WAY:  Convert into char then into num
x <- as.numeric(as.character(z))


# 9-DATA CONVERSIONS
########################################
# KEEPING ORIGINAL FORMAT IN DATA FRAMES
x=1:10
y=c("a","b","c","d","e","f","g","h","i","j")
z=c(T,F,T,T,F,T,T,T,T,T)
mymatrix=cbind(x,y,z)
mydataframe=data.frame(x,y,z)     #Variable types are preserved
str(mydataframe)
mydataframe2=data.frame(mymatrix) #Variable types are NOT preserved. Because MATRIX turns all into FACTORS!
str(mydataframe2)
#
# WRONG ORDERING IN NUMERICS!
# EXAMPLE
mydataframe2$w = as.numeric (mydataframe2$x)    #This is WRONG!!!
mydataframe2$w                                  #New col (w) is ordered as 1,3,4,5... instead of 1,2,3,4...
str(mydataframe2)
# CORRECT WAY1: First convert vectors into char, add to data.frame then convert into num
# CORRECT WAY2: At the beginning; use vectors to create dataframe, NOT matrices!
mydataframe$w = as.numeric(mydataframe$x)
str(mydataframe)
