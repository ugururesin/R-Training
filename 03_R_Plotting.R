########################################
# PLOTTING CODES in R
# Prepared by Ugur Uresin, Data Engineer
########################################
# 1-SAVING A PLOT
# 2-SCATTER PLOTS
# 3-BAR CHARTS
# 4-HISTOGRAMS
# 5-PIE CHARTS
# 6-DOT CHARTS
# 7-MISC
# 8-GGPLOT (Special Plot Package)
########################################


# 1-SAVING A PLOT
########################################
mydata1 <- c(1,2,3,5,8)                             #Example data to plot
plot(mydata1, type="o", col="blue", pch=1, lty=1)   #Plots mydata1
setwd("/Users/ugur/Desktop/R/")                     #Set a directory to save the plot
dev.copy(png,'myplotname.png')
dev.off()


# 2-SCATTER PLOTS
########################################
# MAIN TYPES
mydata1 <- c(1,2,3,5,8)
plot(mydata1, type="p", col="blue")  #"p" for points,
plot(mydata1, type="l", col="blue")  #"l" for lines,
plot(mydata1, type="b", col="blue")  #"b" for both,
plot(mydata1, type="c", col="blue")  #"c" for the lines part alone of "b",
plot(mydata1, type="o", col="blue")  #"o" for both ‘overplotted’,
plot(mydata1, type="h", col="blue")  #"h" for ‘histogram’ like (or ‘high-density’) vertical lines,
plot(mydata1, type="s", col="blue")  #"s" for stair steps,
plot(mydata1, type="S", col="blue")  #"S" for other steps, see ‘Details’ below,
plot(mydata1, type="n", col="blue")  #"n" for no plotting
# DATA POINT TYPE: pch parameter
plot(mydata1, type="o", col="blue", pch=1)  #1 for circle
plot(mydata1, type="o", col="blue", pch=2)  #2 for triangle
plot(mydata1, type="o", col="blue", pch=3)  #3 for +
plot(mydata1, type="o", col="blue", pch=4)  #4 for x 
plot(mydata1, type="o", col="blue", pch=8)  #8 for *
plot(mydata1, type="o", col="blue", pch=22) #22 for square
# DATA LINE TYPE: lty parameter
plot(mydata1, type="o", col="blue", pch=1, lty=1)  #1 for continuous
plot(mydata1, type="o", col="blue", pch=1, lty=2)  #2 for line-dashed
plot(mydata1, type="o", col="blue", pch=1, lty=3)  #3 for point-dashed
plot(mydata1, type="o", col="blue", pch=1, lty=4)  #4 for line-point-dashed
plot(mydata1, type="o", col="blue", pch=1, lty=5)  #5 for line-dashed (longer)
plot(mydata1, type="o", col="blue", pch=1, lty=6)  #6 line-point-dashed (longer)
# EDITING AXES
plot(mydata1, type="o", col="blue", ylim=c(0,10))   #Defines limits of y-axis
plot(mydata1, type="o", col="blue", xlim=c(0,10))   #Defines limits of y-axis
plot(mydata1, type="o", col="blue", ann=F)          #Plots wo Titles
title(xlab="My X Axis Title", col.lab="red")        #Defines X-Axis Title
title(ylab="My Y Axis Title", col.lab="red")        #Defines Y-Axis Title
title(main="MyTitle", col.main="red", font.main=1)  #Adds Title (1:Normal, 2:Bold, 3:Italic, 4:BoldItalic ...)
# RE-DEFINING AXES
mydata2 <- c(2,4,6,3,7)
myrange <- range(mydata2)
plot(mydata2, type="o", col="blue", axes=F, ann=F)    #Creates a Plot wo Axes & Titles 
axis(1, at=1:5, lab=c("Mon","Tue","Wed","Thu","Fri")) #Creates a below axis (1=below, 2=left, 3=above and 4=right)
axis(2, las=1, at=0:myrange[2])                       #Creates a left axis with the 'Data Range' (las=3 to rotate the label)
box()                                                 #Creates a box around the plot
# MULTIPLE PLOTTING & LEGEND
mydata1 <- c(1,2,3,5,8)
mydata2 <- c(2,4,6,3,7)
myrange <- range(mydata1,mydata2)
plot(mydata1, type="o", col="blue", pch=1, lty=1)   #Plots mydata1
lines(mydata2, type="o", col="red", pch=4, lty=2)   #Adds mydata2 into previous plot
legend(1,myrange[2], c("data1","data2"), col=c("blue","red"), pch=c(1,4), lty=c(1,2))  #1,myrange[2] is the (x,y) position of the legend, instead can be "topleft"
# PLOTS FOR LM
house=data.frame(
  size=c(80,83,76,60,90,100,120,200,45,140,140,180,190,
         190,200,220,250,160,200,190,300,270,245,100,120),
  price=c(150000,153000,140000,120000,150000,160000,160000,160000,
          200000,150000,170000,180000,175000,180000,200000,230000,
          260000,150000,200000,195000,280000,255000,230000,110000,130000)
)
plot(x=house$size, y=house$price)                     #To plot house data
abline(lm(formula= price~., data=house),col="red")    #To draw the prediction curve (lm) 


# 3-BAR CHARTS
########################################
mybardata <- c(1,3,6,4,9)
barplot(mybardata)
# EXAMPLE
autos_data <- data.frame(
  cars=c(1,3,6,4,9),
  trucks=c(2,5,4,5,12),
  suvs=c(4,4,6,6,16)
  )
# Hatched Bar Charts
barplot(autos_data$cars, main="Cars", xlab="Days", ylab="Total",
        names.arg=c("Mon","Tue","Wed","Thu","Fri"), border="blue", density=c(10,20,30,40,50)) #density parameter is to hatch on bars
# Adjacent bars using rainbow colors
barplot(as.matrix(autos_data), main="Autos", ylab= "Total", beside=TRUE, col=rainbow(5))      #rainbow(5) is for 5 different colors
# Place the legend at the top-left corner with no frame using rainbow colors
legend("topleft", c("Mon","Tue","Wed","Thu","Fri"), cex=0.8, bty="n", fill=rainbow(5));
# Expand right side of clipping rect to make room for the legend
par(xpd=T, mar=par()$mar+c(0,0,0,4))
# Graph autos (transposing the matrix) using heat colors,put 10% of the space between each bar, and make labels smaller with horizontal y-axis labels
barplot(t(autos_data), main="Autos", ylab="Total", 
        col=heat.colors(3), space=0.1, cex.axis=0.8, las=1,
        names.arg=c("Mon","Tue","Wed","Thu","Fri"), cex=0.8) 
# Place the legend at (6,30) using heat colors
legend(6, 30, names(autos_data), cex=0.8, fill=heat.colors(3));
# Restore default clipping rect
par(mar=c(5, 4, 4, 2) + 0.1)


# 4-HISTOGRAMS
########################################
# BASIC HISTOGRAM
autos <- data.frame(
  cars=c(1,3,6,4,9),
  trucks=c(2,5,4,5,12),
  suvs=c(4,4,6,6,16)
)
hist(autos$cars)
hist(autos$cars, col="blue")
# MULTIPLE HISTOGRAM
autos_data <- c(autos$cars, autos$trucks, autos$suvs) #concatenate the three vectors
max_num <- max(autos_data)
hist(autos_data, col=heat.colors(max_num), xlim=c(0,max_num), breaks=max_num, right=F, main="Autos Histogram", las=1) #las for axis number alignment
# PROBABILITY DENSITY
autos_data <- c(autos$cars, autos$trucks, autos$suvs) #concatenate the three vectors
max_num <- max(autos_data)
brk <- c(0,3,4,5,6,10,16)
# Create a histogram for autos with fire colors, set uneven
# breaks, make x axis range from 0-max_num, disable right-
# closing of cell intervals, set heading, make y-axis labels 
# horizontal, make axis labels smaller, make areas of each
# column proportional to the count#create uneven breaks
hist(autos_data, col=heat.colors(length(brk)), breaks=brk, xlim=c(0,max_num), right=F, main="Probability Density", las=1, cex.axis=0.8, freq=F)
#
# DISTRIBUTION HISTOGRAMS
# Get a random log-normal distribution
r <- rlnorm(1000)
hist(r)
# Get a random log-normal distribution
r <- rlnorm(1000)
h <- hist(r, plot=F, breaks=c(seq(0,max(r)+1, .1))) # Get the distribution without plotting it using tighter breaks
# Plot the distribution using log scale on both axes, and use blue points
plot(h$counts, log="xy", pch=20, col="blue", main="Log-normal distribution", xlab="Value", ylab="Frequency")


# 5-PIE CHARTS
########################################
# EXAMPLE
cars <- c(1, 3, 6, 4, 9)
pie(cars)
# Create a pie chart with defined heading and custom colors and labels
cars <- c(1, 3, 6, 4, 9)
pie(cars, main="Cars", col=rainbow(length(cars)), labels=c("Mon","Tue","Wed","Thu","Fri"))
# Change the colors, label using percentages, and create a legend
colors <- c("white","grey70","grey90","grey50","black")                   #Defines some colors ideal for black & white print
car_labels <- round(cars/sum(cars) * 100, 1)                              #Calculates the percentage for each day, rounded to one decimal place
car_labels <- paste(car_labels, "%", sep="")                              #Concatenates a '%' char after each value
pie(cars, main="Cars", col=colors, labels=car_labels, cex=0.8)            #Creates a pie chart with defined heading and custom colors and labels
legend(1.5, 0.5, c("Mon","Tue","Wed","Thu","Fri"), cex=0.8, fill=colors)  #Creates a legend at the right   


# 6-DOT CHARTS
########################################
# EXAMPLE
autos <- data.frame(
  cars=c(1,3,6,4,9),
  trucks=c(2,5,4,5,12),
  suvs=c(4,4,6,6,16)
)
dotchart(t(autos))
# Create a colored dotchart for autos with smaller labels
dotchart(t(autos), color=c("red","blue","darkgreen"), main="Dotchart for Autos", cex=0.8)


# 7-MISC
########################################
# This example shows all 25 symbols that you can use to produce points in your graphs:
# Make an empty chart
plot(1, 1, xlim=c(1,5.5), ylim=c(0,7), type="n", ann=FALSE)
# Plot digits 0-4 with increasing size and color
text(1:5, rep(6,5), labels=c(0:4), cex=1:5, col=1:5)
# Plot symbols 0-4 with increasing size and color
points(1:5, rep(5,5), cex=1:5, col=1:5, pch=0:4)
text((1:5)+0.4, rep(5,5), cex=0.6, (0:4))
# Plot symbols 5-9 with labels
points(1:5, rep(4,5), cex=2, pch=(5:9))
text((1:5)+0.4, rep(4,5), cex=0.6, (5:9))
# Plot symbols 10-14 with labels
points(1:5, rep(3,5), cex=2, pch=(10:14))
text((1:5)+0.4, rep(3,5), cex=0.6, (10:14))
# Plot symbols 15-19 with labels
points(1:5, rep(2,5), cex=2, pch=(15:19))
text((1:5)+0.4, rep(2,5), cex=0.6, (15:19))
# Plot symbols 20-25 with labels
points((1:6)*0.8+0.2, rep(1,6), cex=2, pch=(20:25))
text((1:6)*0.8+0.5, rep(1,6), cex=0.6, (20:25))


# 8-GGPLOT (Special Plot Package)
########################################
# PACKAGE INSTALL:
install.packages("ggplot2")
library(ggplot2)
#
# STRUCTURE:
vectorx <- c(1,2,3,4)
vectory <- c(2,4,6,8)
mydata <- cbind(vectorx,vectory)
ggplot(data=mydata)                                 #Takes the data
+geom_function(mapping = aes(x=vectorx, y=vectory)) #Assigna the vectors to the axes
#
# EXAMPLE:
house=data.frame(
  size=c(80,83,76,60,90,100,120,200,45,140,140,180,190,
         190,200,220,250,160,200,190,300,270,245,100,120),
  price=c(150000,153000,140000,120000,150000,160000,160000,160000,
          200000,150000,170000,180000,175000,180000,200000,230000,
          260000,150000,200000,195000,280000,255000,230000,110000,130000)
)
ggplot(data=house)+
  geom_point(mapping=aes(x=size,y=price))+
  coord_cartesian(ylim=c(70000,250000))+
  geom_smooth(mapping=aes(x=size, y=price),method="lm",formula=y~x,se=F)  #The grey area in the plot is 'confidence interval' (se=F to close)

#
# SCATTER PLOT:
library(ggplot2)
View(ggplot2::mpg)  # Data in ggplot2 package
mpgdata <- mpg
plot(mpgdata$displ,mpgdata$hwy)
plot(x=mpgdata$displ,y=mpgdata$hwy,col="red", xlab="Volume", ylab="Mile/Gallon",
     main="Engine Volume vs. Fuel Consumption",
     sub="Based on mpg data in ggplot2", type="p")
ggplot(data=mpgdata) + geom_point(mapping = aes(x=displ, y=hwy))
#
# MULTIPLE PLOT:
g1 <- ggplot(data=mpgdata) + geom_point(mapping = aes(x=displ, y=hwy))
g2 <- ggplot(data=mpgdata) + geom_point(mapping = aes(x=displ, y=cty))
easyGgplot2::ggplot2.multiplot(g1,g2)
#
# DISPLAY & EMPHASIZE LABELS (class)
mpgdata$class = as.factor(mpgdata$class)  # First, convert 'class' into a factor then add to geom_point (col, size, shape...)
# Seperating by Color
g11=ggplot(data=mpgdata)+geom_point(mapping=aes(x=displ, y=hwy, col=class))+ggtitle("Consumption in Highway")
g22=ggplot(data=mpgdata)+geom_point(mapping=aes(x=displ, y=hwy, col=class))+ggtitle("Consumption in City")
g11
g22
easyGgplot2::ggplot2.multiplot(g11,g22)   #ATTENTION: This may collapse R. Expand plots window as large as possible!
# Separating by Point Size
ggplot(data=mpgdata)+geom_point(mapping=aes(x=displ, y=hwy, size=class))
# Separating by Point GreyScale (Alpha Parameter)
ggplot(data=mpgdata)+geom_point(mapping=aes(x=displ, y=hwy, alpha=class))
# Separating by Point Shape (Shape Parameter)
ggplot(data=mpgdata)+geom_point(mapping=aes(x=displ, y=hwy, shape=class))  #ATTENTION: shape can display 6 parameters in max!
# Separating by Point Shape and Color Together
ggplot(data=mpgdata)+geom_point(mapping=aes(x=displ, y=hwy, shape=class, col=class))+ggtitle("Consumption in Highway")
# Album Plots (facet_wrap) function
ggplot(data=mpgdata)+geom_point(mapping=aes(x=displ, y=hwy))+facet_wrap(~class,nrow=2)
#
# BAR-CHARTS:
elmas=ggplot2::diamonds
# Note: in geom_bar, y is count as default, only x is required to be defined
ggplot(data=elmas)+geom_bar(mapping=aes(x=cut,color=cut))                                 #bars w colored edges
ggplot(data=elmas)+geom_bar(mapping=aes(x=cut,fill=cut))                                  #bars w filled colors
ggplot(data=elmas)+geom_bar(mapping=aes(x=cut,fill=cut))+theme(legend.position = "none")  #removes the legend
# To Show 2nd Categoric Variable in Bars
ggplot(data=elmas)+geom_bar(mapping=aes(x=cut,color=clarity))
ggplot(data=elmas)+geom_bar(mapping=aes(x=cut,fill=clarity))
# Position parameter
ggplot(data=elmas)+geom_bar(mapping=aes(x=cut,fill=clarity),position="stack") #gives count
ggplot(data=elmas)+geom_bar(mapping=aes(x=cut,fill=clarity),position="fill")  #gives %count
# Identity parameter
elmas=diamonds[1:3,]
ggplot(data=elmas)+geom_bar(mapping=aes(x=cut,y=carat),stat="identity")