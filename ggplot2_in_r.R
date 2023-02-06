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
x <- 1:20
y <- c(-1.49,3.37,2.59,-2.78,-3.94,-0.92,6.43,8.51,3.41,-8.23,
          -12.01,-6.58,2.87,14.12,9.63,-4.58,-14.78,-11.67,1.17,15.62)
ptype <- rep(NA,length(x=x))
ptype[y>=5] <- "too_big"
ptype[y<=-5] <- "too_small"
ptype[(x>=5&x<=15)&(y>-5&y<5)] <- "sweet"
ptype[(x<5|x>15)&(y>-5&y<5)] <- "standard"
ptype <- factor(x=ptype)
ptype

# Now we have a factor with 20 values sorted into four levels. 
qplot(x,y,color=ptype,shape=ptype)

# Plot
qplot(x,y,color=ptype,shape=ptype) + geom_point(size=4) +
  geom_line(mapping=aes(group=1),color="black",lty=2) +
  geom_hline(mapping=aes(yintercept=c(-5,5)),color="red") +
  geom_segment(mapping=aes(x=5,y=-5,xend=5,yend=5),color="red",lty=3) +
  geom_segment(mapping=aes(x=15,y=-5,xend=15,yend=5),color="red",lty=3)

# Here,
# qplot        --> Create ggplot2 “quick plot”
# geom_point   --> Add points geom Section 
# geom_line    --> Add lines geom Section 
# size, shape, color --> Set geom constants 
# linetype     --> Set geom line type Section 
# mapping, aes --> Geom aesthetic mapping
# geom_segment --> Add line segments geom
# geom_hline   --> Add horizontal lines geom















