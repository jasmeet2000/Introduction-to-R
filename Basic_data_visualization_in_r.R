# _______________________________ BASIC DATA VISUALIZATION ________________________
# Data visualization is an important part of a statistical analysis. The 
# visualization tools appropriate for a given data set are dependent upon the 
# types of variables
# Plot and ggplot2 help for visualization.

#----- ----- ------  ----- ----- ------  ----- ----- ------  ----- ----- ------
# Barplots and Pie Charts

# Barplots and pie charts are commonly used to visualize qualitative data by 
# category frequency.

#----- ----- ------  ----- ----- ------  ----- ----- ------  ----- ----- ------
# Barplot: 
# A barplot draws either vertical or horizontal bars, typically separated by white
# space, to visualize frequencies according to the relevant categories. Though
# the raw frequencies themselves are usually displayed, a barplot can also
# be used to visualize other quantities, such as means or proportions, which
# directly depend upon these frequencies.

# Example:-
mtcars

cyl.freq <- table(mtcars$cyl)
cyl.freq

# This is a stacked plot
barplot(cyl.freq)    

table(mtcars$cyl[mtcars$am==0])
table(mtcars$cyl[mtcars$am==1])

# Types of bar plot:-
# stacked --> where bars are split up vertically 
# dodged  --> Where bars are broken up and placed beside each other.

cyl.freq.matrix <- table(mtcars$am,mtcars$cyl)
cyl.freq.matrix

# This is a dodged plot
barplot(cyl.freq.matrix,beside=TRUE,horiz=TRUE,las=1,
        main="Performance car counts\nby transmission and cylinders",
        names.arg=c("V4","V6","V8"),legend.text=c("auto","manual"),
        args.legend=list(x="bottomright"))


# help 
?barplot 

qplot(factor(mtcars$cyl),geom="bar")
# Note here that the relevant geom is "bar"

qplot(factor(mtcars$cyl),geom="blank",fill=factor(mtcars$am),xlab="",
      ylab="",main="Performance car counts\nby transmission and cylinders")
+ geom_bar(position="dodge")
+ scale_x_discrete(labels=c("V4","V6","V8"))
+ scale_y_continuous(breaks=seq(0,12,2))
+ theme_bw() + coord_flip()
+ scale_fill_grey(name="Trans.",labels=c("auto","manual"))
#----- ----- ------  ----- ----- ------  ----- ----- ------  ----- ----- ------
# Pie chart

# The venerable pie chart is an alternative option for visualizing frequency based
# quantities across levels of categorical variables, with appropriately
# sized “slices” representing the relative counts of each categorical variable.

pie(table(mtcars$cyl),labels=c("V4","V6","V8"), col=c("white","gray","black"),
    main="Performance cars by cylinders")

# Pie charts are a bad way of displaying information.

#----- ----- ------  ----- ----- ------  ----- ----- ------  ----- -----  ------
# Histograms

# To visualize the distribution of continuous measurements, we can use a 
# histograma
mtcars$hp

# A histogram also measures frequencies, but in targeting a numeric-continuous 
# variable, it’s first necessary to “bin” the observed data, meaning to define 
# intervals and then count the number of continuous observations that fall within 
# each one. The size of this interval is known as the binwidth.

hist(mtcars$hp)
# This is a right or positive skew

hist(mtcars$hp,breaks=seq(0,400,25),col="gray",main="Horsepower",xlab="HP")
abline(v=c(mean(mtcars$hp),median(mtcars$hp)),lty=c(2,3),lwd=2)
legend("topright",legend=c("mean HP","median HP"),lty=c(2,3),lwd=2)


#---------------
# Histograms using ggplot
qplot(mtcars$hp)
# `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

qplot(mtcars$hp,geom="blank",main="Horsepower",xlab="HP")
+ geom_histogram(color="black",fill="white",breaks=seq(0,400,25),
                 closed="right")
+ geom_vline(mapping=aes(xintercept=c(mean(mtcars$hp),median(mtcars$hp)),
                         linetype=factor(c("mean","median"))),show.legend=TRUE)
+ scale_linetype_manual(values=c(2,3)) + labs(linetype="")

#----- ----- ------  ----- ----- ------  ----- ----- ------  ----- ----- ------
# Box-and-Whisker Plots (or boxplot)

hist(quakes$mag)
boxplot(quakes$mag)
# IQR 
# Mathematically,
# IQR = Q3 – Q1

# where,
# Q3 upper quartile value
# Q1 lower quartile value
# Dark bold line in the middle of the box is median
# circle points are the outliers

# -----------------------
# Side-by-Side Boxplots

stations.fac <- cut(quakes$stations,breaks=c(0,50,100,150))
stations.fac[1:5]

boxplot(quakes$mag~stations.fac, xlab="# stations detected",ylab="Magnitude",col="gray")

qplot(stations.fac,quakes$mag,geom="boxplot", xlab="# stations detected",ylab="Magnitude")

#_________________________________________________________________________________________
# Scatterplots

plot(iris[,4],iris[,3],type="n",xlab="Petal Width (cm)", ylab="Petal Length (cm)")

points(iris[iris$Species=="setosa",4], iris[iris$Species=="setosa",3],pch=19,col="black")

points(iris[iris$Species=="virginica",4], iris[iris$Species=="virginica",3],pch=19,col="gray")

points(iris[iris$Species=="versicolor",4], iris[iris$Species=="versicolor",3],pch=1,col="black")

legend("topleft",legend=c("setosa","virginica","versicolor"), col=c("black","gray","black"),pch=c(19,19,1))

#--------------
# For two objects

iris_pch <- rep(19,nrow(iris))
iris_pch[iris$Species=="versicolor"] <- 1
iris_col <- rep("black",nrow(iris))
iris_col[iris$Species=="virginica"] <- "gray"
  
plot(iris[,4],iris[,3],col=iris_col,pch=iris_pch, xlab="Petal Width (cm)",ylab="Petal Length (cm)")

# Multi Scatterplots

pairs(iris[,1:4],pch=iris_pch,col=iris_col,cex=0.75)

qplot(iris[,4],iris[,3],xlab="Petal width",ylab="Petal length",
         shape=iris$Species) + scale_shape_manual(values=4:6) + labs(shape="Species")

# Scatterplot matrix (GGally)
install.packages("GGally")
library("GGally") 
ggpairs(iris,mapping=aes(col=Species),axisLabels="internal")





