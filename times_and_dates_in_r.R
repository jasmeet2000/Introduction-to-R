# Times & Dates
today <- Sys.Date()
today

class(today)
#------------------
now <- Sys.time()
now

class(now)

#---------------------
# Create Data object
my_date <- as.Date("1971-05-14")   # YYYY-MM-DD
my_date

class(my_date)

my_date <- as.Date("1971-14-05", format = "%Y-%d-%m")
my_date

#Create POSIXct objects
my_time <- as.POSIXct("1971-05-14 11:25:15")
my_time

#--------------------

# See what today looks like under the hood
unclass(today)
unclass(my_date)

# See what now looks like under the hood
unclass(now)
#----------------------
#We Can performed arithmeic with dates

# Constructing day1, day2, day3, day4 and day5 vectors
day1 <- as.Date("2016-11-21")
day2 <- as.Date("2016-11-16")
day3 <- as.Date("2016-11-27")
day4 <- as.Date("2016-11-14")
day5 <- as.Date("2016-12-02")
# Difference between last and first pizza day
day5-day1
# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)
# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza, lag = 1, differences = 1)
day_diff
# Average period between two consecutive pizza days
print(mean(day_diff))

#-------------------------------------
# Create and format dates
# To create a Date object from a simple character string in R, you can use the 
# as.Date() function. The character string has to obey a format that can be defined
# using a set of symbols (the examples correspond to 13 January, 1982):
  
#  %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)


# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2)
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")
#--------------------------------------------------------------
# Create and format times

# Similar to working with dates, you can use as.POSIXct() to convert from a 
# character string to a POSIXct object, and format() to convert from a POSIXct 
# object to a character string. Again, you have a wide variety of symbols:
  
# %H: hours as a decimal number (00-23)
# %I: hours as a decimal number (01-12)
# %M: minutes as a decimal number
# %S: seconds as a decimal number
# %T: shorthand notation for the typical format %H:%M:%S
# %p: AM/PM indicator
# For a full list of conversion symbols, consult the strptime documentation 
# in the console:
  
?strptime

# Again,as.POSIXct() uses a default format to match character strings. 
# In this case, it's %Y-%m-%d %H:%M:%S. In this exercise, abstraction is made
# of different time zones.

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2)

# Convert times to formatted strings
format(time1, "%M")
format(time2, "%I:%M %p")

#_____________________________________________________________________________
# Constructing login and logout vectors
login <- as.POSIXct(c("2016-11-18 10:18:04 UTC", 
                      "2016-11-23 09:14:18 UTC", 
                      "2016-11-23 12:21:51 UTC", 
                      "2016-11-23 12:37:24 UTC", 
                      "2016-11-25 21:37:55 UTC"))
logout <- as.POSIXct(c("2016-11-18 10:56:29 UTC", 
                       "2016-11-23 09:14:52 UTC", 
                       "2016-11-23 12:35:48 UTC",
                       "2016-11-23 13:17:22 UTC", 
                       "2016-11-25 22:08:47 UTC"))
# Calculate the difference between login and logout: time_online
time_online <- logout - login
# Inspect the variable time_online
time_online
# Calculate the total time online
sum(time_online)
# Calculate the average time online
mean(time_online)
#_______________________________________________________________________________

# Constructing astro and meteo vectors
astro <- c("20-Mar-2015", "25-Jun-2015", "23-Sep-2015", "22-Dec-2015")
names(astro) <- c("spring", "summer", "fall", "winter")
meteo <- c("March 1, 15", "June 1, 15", "September 1, 15", "December 1, 15")
names(meteo) <- c("spring", "summer", "fall", "winter")

# Convert astro to vector of Date objects: astro_dates
astro_dates <- as.Date(astro, format = "%d-%b-%Y")
# Convert meteo to vector of Date objects: meteo_dates
meteo_dates <- as.Date(meteo, format = "%B %d, %y")
# Calculate the maximum absolute difference between astro_dates and meteo_dates
max(abs(astro_dates - meteo_dates))





