# BASIC PLOTTING
#-------------------------------------------------------------------------------
# Two vectors are used to plot the graph. Its similar to our basic maths to plot
# a graph (x value, y value). Just the difference is two vectors are used, in 
# which one vector is for x values and other vectors is for y values.

foo <- c(1.1,2,3.5,3.9,4.2)
bar <- c(2,2.2,-1.3,0,0.2)
plot(foo,bar)


# The x and y locations don’t necessarily need to be specified as separate
# vectors. You can also supply coordinates in the form of a matrix, with the
# x values in the first column and the y values in the second column, or as a
# list. For example:-
baz <- cbind(foo,bar)
baz

# The plot function is one of R’s versatile "generic functions". It works
# differently for different objects and allows users to define their own methods
# for handling objects

?plot.default

plot(foo,bar,type="l") 
# l is lines only (define under type) 
plot(foo,bar,type="b")
# b is both points and lines
# n is non points, line
# The default value for type is "p", which can be interpreted as “points
# only.”
#_______________________________________________________________________________
# Title and Axis Labels

# By default, it don't have title and lable.
# Since, we can define title by main="write the title". xlab and ylab to define x and y axis.

plot(foo,bar,type="b",main="My lovely plot",xlab="x axis label", ylab="location y")
# or,
plot(foo,bar,type="b",main="My lovely plot\ntitle on two lines",xlab="", ylab="")
#_______________________________________________________________________________
# Color

plot(foo,bar,type="b",main="My lovely plot",xlab="x axis",ylab="y axis",col=2)
# col=seagreen4
# The default color is integer 1 or the character string "black".

#_______________________________________________________________________________
# Line and Point Appearances

plot(foo,bar,type="b",main="My lovely plot",xlab="x axis",ylab="y axis",
     col=4,pch=8,lty=2,cex=2.3,lwd=3.3)

plot(foo,bar,type="b",main="My lovely plot",xlab="x axis",ylab="y axis",
     col=6,pch=15,lty=3,cex=0.7,lwd=2)

# pch --> Stands for point character. This selects which character to use for
#         plotting individual points.
# cex --> Stands for character expansion. This controls the size of plotted point
#         characters.
# lty --> Stands for line type. This specifies the type of line to use to connect
#        the points (for example, solid, dotted, or dashed).
# lwd --> Stands for line width. This controls the thickness of plotted lines.
#_______________________________________________________________________________
# Plotting Region Limits

# By default R sets the range of each axis by using the range of the supplied 
# x and y values (plus a small constant to pad a little area around the outermost
# points). 

# We can set custom plotting area limits using:-

# xlim, ylim --> This provides limits for the horizontal range and vertical
#                range (respectively) of the plotting region.

# Both parameters require a numeric vector of length 2, provided as
# c(lower,upper).
plot(foo,bar,type="b",main="My lovely plot",xlab="",ylab="",
     col=4,pch=8,lty=2,cex=2.3,lwd=3.3,xlim=c(-10,5),ylim=c(-3,3))

plot(foo,bar,type="b",main="My lovely plot",xlab="",ylab="",
     col=6,pch=15,lty=3,cex=0.7,lwd=2,xlim=c(3,5),ylim=c(-0.5,0.2))
#_______________________________________________________________________________
# Adding Points, Lines, and Text to an Existing Plot

x <- 1:20
y <- c(-1.49,3.37,2.59,-2.78,-3.94,-0.92,6.43,8.51,3.41,-8.23,
        -12.01,-6.58,2.87,14.12,9.63,-4.58,-14.78,-11.67,1.17,15.62)

# The first step is to create the empty plotting region where you can add
# points and draw lines.
plot(x, y, type="n", main="Graph")
#----- ----- ------  ----- ----- ------  ----- ----- ------
# The second step: The abline function is a simple way to add straight lines spanning a
# plot. The line (or lines) can be specified with slope and intercept values.

horizontal_lines <- c(-5,5)
abline(h=horizontal_lines, col="red", lty=2, lwd=2)

#----- ----- ------   ----- ----- ------  ----- ----- ------
# The third step: Draw a line of code adds shorter vertical lines between the 
# horizontal ones.
# For this we use segments, not abline, since you don’t want these lines to span 
# the entire plotting region.
# The segments command takes a “from” coordinate (given as x0 and y0) and
# a “to” coordinate (as x1 and y1) and draws the corresponding line. The
# vector-oriented behavior of R matches up the two sets of “from” and “to”
# coordinates. Both lines are red and dotted and have double-thickness.

segments(x0=c(5,15), y0=c(-5,-5), x1=c(5,15), y1=c(5,5), col="red", lty=3, lwd=2)
#----- ----- ------  ----- ----- ------   ----- ----- ------  
# To show the points on the graph with different colors (in different region)
points(x[y>=5],y[y>=5],pch=4,col="darkmagenta",cex=2)

points(x[y<=-5],y[y<=-5],pch=3,col="darkgreen",cex=2)

points(x[(x>=5&x<=15)&(y>-5&y<5)],y[(x>=5&x<=15)&(y>-5&y<5)],pch=19, col="blue")

points(x[(x<5|x>15)&(y>-5&y<5)],y[(x<5|x>15)&(y>-5&y<5)])

#----- ----- ------   ----- ----- ------  ----- ----- ------
# Now draw the line with these point 
lines(x,y,lty=4)

#----- ----- ------  ----- ----- ------   ----- ----- ------
# Draw the arrow,
# By default, the head of the arrow is located at the “to” coordinate
arrows(x0=8,y0=14,x1=11,y1=2.5)

# As per the default behavior of text, the string supplied as labels is centered
# on the coordinates provided with the arguments x and y.
text(x=8,y=15,labels="sweet spot")

#----- ----- ------  ----- ----- ------  ----- ----- ------
# To label all the diffrent points (of diffrent colours), we can use legend().

legend("bottomleft",
       legend=c("overall process","sweet","standard",
                "too big","too small","sweet y range","sweet x range"),
       pch=c(NA,19,1,4,3,NA,NA),lty=c(4,NA,NA,NA,NA,2,3),
       col=c("black","blue","black","darkmagenta","darkgreen","red","red"),
       lwd=c(1,NA,NA,NA,NA,2,2),pt.cex=c(NA,1,1,2,2,NA,NA))


