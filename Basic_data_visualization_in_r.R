# _______________________________ BASIC DATA VISUALIZATION _________________________________________
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


