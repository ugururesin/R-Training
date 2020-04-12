########################################
# BASIC CODES in R
# Prepared by Ugur Uresin, Data Engineer
########################################
# 1-DIRECTORY SETTING
# 2-HELLO WORLD!
# 3-PACKAGE INSTALL & USE
# 4-DATA IMPORT & DIRECTORY SET
# 5-SPECIAL CHARACTERS
# 6-INDEXES
# 7-LOGICAL OPERATIONS
# 8-ARITHMETIC OPERATIONS
########################################



# 1-DIRECTORY SETTING
########################################
# MAC:
setwd("/Users/ugur/Desktop/R/")
# Windows:
setwd("C:\\Users\\ugur\\Desktop\\R")


# 2-HELLO WORLD!
########################################
for(i in 1:5){print("Hello World")}


# 3-PACKAGE INSTALL & USE
########################################
install.packages("package.name")
library("package.name")


# 4-DATA IMPORT & DIRECTORY SET
########################################
# Data Import From Internet
data01 <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep=",",header=F) #sep for seperator, header=T if there are headers
# Data Import From Local (MAC)
data02 = read.csv("/Users/UGUR/Desktop/R/_data/titanic_data/test.csv")


# 5-SPECIAL CHARACTERS
########################################
# ~   Alt+n
# ≈   Alt+x
# ®   Alt+r
# ∫   Alt+b
# √   Alt+v
# ≤   Alt+ö
# ≥   Alt+ç


# 6-INDEXES
########################################
# R starts from 1, JAVA starts from 0
A <- c(6,4,3,1,0)
A[1] #R Gives:6, JAVA Gives:4


# 7-LOGICAL OPERATIONS
########################################
# OR Operator
5==4 | 5<=6   #For "|" sign: Alt+-
# AND Operator
5==4 & 5<=6


# 8-ARITHMETIC OPERATIONS
########################################
# Round Function
round(5.2) #goes 5
round(5.7) #goes 6
round(5.5) #goes 6