# Titanic (GOOD)
library(ggplot2)
library(dplyr)
library(tidyr)

titanic <- read.csv("train_titanic.csv")

summary(titanic)
str(titanic)

survived_count <- titanic %>% group_by(Survived) %>% summarize(count=n())

ggplot(survived_count, aes(x=factor(Survived), y=count, fill=factor(Survived))) + geom_bar(stat="identity") + labs(title="Survivors vs Non-survivors", x="Survival", y="Number of passengers")

ggplot(titanic, aes(x=Age, y=Fare, color=factor(Survived))) + 
  geom_point(alpha=0.5) + 
  labs(title="Age vs Fare by survival status", x="Age", y="Fare")


class_count <- table(titanic$Pclass)



#_______________________________________________________________________________
library(ggplot2)
library(stats)
library(base)
library(dplyr)

library(tidyverse)


# Read in the data
imdb_data <- read.csv("IMDB_top250.csv")

# Create a histogram of movie ratings
ggplot(imdb_data, aes(x = rating)) +
  geom_histogram(binwidth = 0.1, fill = "darkblue") +
  labs(title = "Distribution of Movie Ratings",
       x = "Movie Rating", y = "Frequency")

# Create a bar chart of top 10 genres
imdb_data %>%
  separate(genre, into = c("Genre1", "Genre2", "Genre3"), sep = ", ") %>%
  gather(key = "Genre", value = "Value", Genre1:Genre3) %>%
  filter(!is.na(Value)) %>%
  group_by(Genre) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  top_n(10) %>%
  ggplot(aes(x = reorder(genre, -count), y = count)) +
  geom_bar(stat = "identity", fill = "darkblue") +
  labs(title = "Top 10 Genres",
       x = "Genre", y = "Count")

# Create a scatter plot of movie length vs rating
ggplot(imdb_data, aes(x = run_time, y = rating)) +
  geom_point(size = 3, color = "darkblue") +
  labs(title = "Movie Length vs Rating",
       x = "Movie Length (minutes)", y = "Rating")

#_____________________________________________________


# Load required packages
library(tidyverse)
# library(ggimage)
library(ggplot2)

# Load the dataset
meteorites <- read.csv("Meteorite_Landings.csv")

# View the structure of the dataset
str(meteorites)

# Summary of the dataset
summary(meteorites)

meteorites <- meteorites %>% select(-id, -nametype, -recclass, -GeoLocation)

meteorites <- meteorites[complete.cases(meteorites), ]


meteorites <- meteorites %>% filter(mass..g. > 0)

meteorites <- meteorites %>% rename(meteorite_name = name, fall_type = fall, mass_g = mass..g.)


ggplot(meteorites, aes(x = mass_g)) +
  geom_histogram(binwidth = 100) +
  labs(x = "Mass (g)", y = "Count") +
  theme_classic()
  

ggplot(meteorites, aes(x = mass_g, y = ..density.., fill = fall_type)) +
  geom_density(alpha = 0.5) +
  labs(x = "Mass (g)", y = "Density") +
  scale_fill_manual(values = c("blue", "red")) +
  theme_classic()

ggplot(meteorites, aes(x = year)) +
  geom_histogram(binwidth = "year", fill = "blue") +
  labs(x = "Year", y = "Count") +
  theme_classic()

ggplot(meteorites, aes(x = reclong, y = reclat)) +
  geom_point(alpha = 0.5, size = 0.5) +
  labs(x = "Longitude", y = "Latitude") +
  theme_classic() +
  coord_map()


#____________________________________________________
# (GOOD)
library(dplyr)
library(ggplot2)

customers <- read.csv("customers.csv")

customers <- customers %>%
  rename(  customer_id      = CustomerID
         , gender           = Gender
         , age              = Age
         , annual_income    = Annual.Income....
         , spending_score   = Spending.Score..1.100.
         , Profession       = Profession
         , work_experience  = Work.Experience
         , family_size      = Family.Size)


sum(is.na(customers))

sum(duplicated(customers))


# Create a scatter plot of Annual Income vs. Spending Score
ggplot(customers, aes(x = annual_income, y = spending_score)) + geom_point()


# Create a histogram of Age
ggplot(customers, aes(x = age)) + geom_histogram()


# Create a box plot of Annual Income by Gender
ggplot(customers, aes(x = gender, y = annual_income)) + geom_boxplot()
ggplot(customers, aes(x = gender, y = annual_income)) + geom_violin()

#_________________________________________________________________________

library(dplyr)
library(tidyr)
library(ggplot2)

covid_data <- read.csv("covid_worldwide.csv", header = TRUE, stringsAsFactors = FALSE)


covid_data <- covid_data %>%
  rename(  serial_number      = Serial.Number
           , country          = Country
           , total_cases      = Total.Cases
           , total_deaths     = Total.Deaths
           , total_recovered  = Total.Recovered
           , active_cases     = Active.Cases
           , total_test       = Total.Test
           , population       = Population
           )

covid_data[covid_data == ""] <- NA

sum(is.na(covid_data))

covid_data <- na.omit(covid_data)


library(maps)


active_cases <- covid_data %>% group_by(country) %>% summarize(total_active_cases =sum(as.numeric(active_cases), na.rm = TRUE) )
world_map <- map_data("world")
world_map_data <- merge(world_map, active_cases, by = "country", all.x = TRUE)






