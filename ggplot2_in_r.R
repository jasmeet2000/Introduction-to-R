#___________________________________ The ggplot2 Package ____________________________________

install.packages("ggplot2")
library("ggplot2")

# Example:-
foo <- c(1.1,2,3.5,3.9,4.2)
bar <- c(2,2.2,-1.3,0,0.2)

# We can produce ggplot2, using its “quick plot”, i.e., qplot()

qplot(foo,bar)

# Adding a title and axis labels also uses the same arguments, that we used in plot 

qplot(foo,bar,main="qplot",xlab="x axis ",ylab="y axis")
#----   -----  ----   -----   ----   -----   ----   -----   ----   -----
# Difference b/w plot and ggplot
# 1. A canves is seen in ggplot, bu not in plot   
# 2. ggplot2 plots are stored as objects, which means they have an underlying, 
#    static representation until we change the object.

# That is:-
baz <- plot(foo,bar)
baz

qux <- qplot(foo,bar)
qux

#----   -----  ----   -----   ----   -----   ----   -----   ----   -----
# Setting Appearance Constants with Geoms

# We modify the object using ggplot2’s convenient suite of geometric modifiers, 
# known as geoms.
qplot(foo,bar,geom="blank") + geom_point() + geom_line()

qplot(foo,bar,geom="blank") + geom_point(size=3,shape=6,color="blue") 
+ geom_line(color="red",linetype=2)
#---------------------------------------
# Example:-

myqplot <- qplot(foo,bar,geom="blank") + geom_line(color="red",linetype=2)
myqplot
myqplot + geom_point(size=3,shape=3,color="blue")
myqplot + geom_point(size=3,shape=7,color="blue")


#----   -----  ----   -----   ----   -----   ----   -----   ----   -----
# Aesthetic Mapping with Geoms



















