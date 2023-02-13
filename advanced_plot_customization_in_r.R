#_____________________ ADVANCED PLOT CUSTOMIZATION _____________________________

# On a Windows machine, you’ll see R Graphics:
# Device 2 (ACTIVE). The numbering of any graphics devices always starts at 2;
# Device 1 is referred to as the null device, meaning there’s nothing active
# currently.

?Devices

# the list includes commands such as png and pdf, which are the so-called
# silent graphics devices that enable direct-to-file plotting

#-------------------  Handling the Graphics Device  ----------------------------

# It’s possible to have multiple graphics devices open, but only one will be 
# deemed active at any given time.  This is useful when you’re working on 
# several plots at once or want to view or alter one plot without closing any others.

#================== Manually Opening a New Device ==============================

# Step 1: Plot any graph
foo <- c(1.1,2,3.5,3.9,4.2)
bar <- c(2,2.2,-1.3,0,0.2)
plot(cbind(foo,bar))


# Step 2: Open the default screen device on this platform if no device is open
dev.new() 


# Step 3: This plot will open in window as new Device with "Device 2 (ACTIVE)"
plot(quakes$long,quakes$lat)
# quakes: The data set give the locations of 1000 seismic events of MB > 4.0. 
#         The events occurred in a cube near Fiji since 1964.

# plot(foo,bar,type="b")  

# If the only device currently available is Device 1, the null device, any plotting
# command that refreshes a plotting window and produces a new image will automatically
# open a new instance of the default graphics device before actually plotting the data.

# Step 4: If we want the plot 2, that is,"Device 2 (ACTIVE)" still there but we also 
# want to make new plot then in that case we can again use dev.new().

dev.new()      # Device 3 will say (ACTIVE), and Device 2 will now say (inactive)

hist(quakes$stations)   # Will plot in new window as Device 3 (ACTIVE)


#====================  Switching Between Devices ===============================

# To change something in Device 2 without closing Device 3, use dev.set followed 
# by the device number you want to make active.

# The following code activates Device 2 and re-plots the locations of the seismic 
# events so that the size of each point is proportional to the number of stations 
# that detected the event. It also tidies up the axis labels


dev.set(4)  # Using dev.set(device_number) always confirms the newly active device 
            # by printing to the console

plot(quakes$long
        , quakes$lat
        , cex=0.02*quakes$stations
        , xlab="Longitude"
        , ylab="Latitude"
     )

# Switching back to Device 3, as a final tweak, add a vertical line marking
# off the mean number of detecting stations.

dev.set(5)
abline(v=mean(quakes$stations),lty=2)

#=============================== Closing a Device ==============================

# To close a graphics device, either click the X with your mouse as you would
# to close any window or use the dev.off function

# Calling dev.off() with no arguments simply closes the currently active device. Otherwise,
# you can specify the device number just as when using dev.set.

dev.off(2)

# Then repeat the call without an argument to close the remaining device:-
dev.off()

# Similar to dev.set, the printed output tells you what the newly active
# device is after you close one. When you close the last available actionable
# device, you’re returned to the null device.


# =====================  Multiple Plots in One Device ==========================

# We can also control the number of individual plots in any one device. There are 
# two  easiest ways

# =====================   Setting the mfrow Parameter =====================

# The par function is used to control various graphical parameters

# The mfrow argument instructs a new (or the currently active)
# device to “invisibly” divide itself into a grid of the specified dimensions, with
# each cell holding one plot.

# We pass the mfrow option a numeric integer vector of length 2 in the order of c(rows,columns)
# By default, it is c(1,1).


# Make sure there are no plotting windows open and we want the two plots of 
# the quakes data side by side in the same device.

# We would set mfrow as a 1 × 2 grid with the vector c(1,2)—one row of plots
# and two columns:-

dev.new(width=8,height=4)
par(mfrow=c(1,2))

plot(quakes$long
     , quakes$lat
     , cex=0.02*quakes$stations
     , xlab="Longitude"
     , ylab="Latitude"
     )

hist(quakes$stations)
abline(v=mean(quakes$stations),lty=2)

# The line 117 uses the optional arguments width and height to preset the dimensions of
# the new device, in inches, so it is twice as wide as it is high.

# The default square size of 7 × 7 inches and  any use of par() in this way will affect
# only the currently active device.


# ===================== Defining a Particular Layout =====================

?layout
# We can refine the arrangements of plots in a single device using the layout
# function, which offers more ways to individualize the panels into which the
# plots will be drawn.

# Suppose we want an array of three statistical plots
layout_matrix <- matrix(c(1,3,2,3),2,2)
layout_matrix

# The dimensions in a matrix mat as the first argument; these govern an invisible 
# rectangular grid, just like controlling the mfrow option. The difference now is 
# that we can use numeric integer entries in mat to tell layout which plot number will go where.

layout(mat=layout_matrix)

# The dimensions of this matrix create a 2 × 2 grid of plotting cells, but
# the values inside lay.mat tell R that you want plot 1 to take the upper-left cell,
# plot 2 to take the upper-right cell, and plot 3 to stretch itself over the two bottom cells

layout.show(n=max(layout_matrix))

#  The student survey data in survey in the MASS package
library("MASS")

plot(survey$Wr.Hnd
     , survey$Height
     , xlab="Writing handspan"
     , ylab="Height"
     )

boxplot(survey$Height~survey$Smoke
        , xlab="Smoking frequency"
        , ylab="Height"
        )

barplot(table(survey$Exer)
        , horiz=TRUE
        , main="Exercise"
        )

# the biggest benefit of layout is its ability to relax the rigidity of
# plotting cells when compared to using the mfrow par option.

# An unfortunate consequence of the two methods discussed here is the inability to
# edit a previous plot once you’ve finished it and moved on to the next. There is a
# split.screen function, which does allow you to set up several “screens” in a single
# device and switch between them.

#____________________________________________________________________________________
# ----------------------- Plotting Regions and Margins ------------------------------










