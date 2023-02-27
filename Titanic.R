# Load required packages
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggrepel)
library(gggenes)

# Read in the data
train_data <- read.csv("train_titanic.csv")
test_data <- read.csv("test_titanic.csv")
gender_data <- read.csv("gender_submission_titanic.csv")

summary(train_data)
str(train_data)


# Check for missing values in the dataset
sum(is.na(train_data))
sum(is.na(test_data))

# Create a new variable called 'Survived' in the test dataset with default value 0
test_data$Survived <- 0

# Combine the train and test datasets
full_data <- bind_rows(train_data, test_data)

# Check for missing values again
sum(is.na(full_data))

# Drop unnecessary columns from the dataset
full_data <- full_data %>% select(-c(PassengerId, Name, Ticket, Cabin))

# Transform categorical variables to factors
full_data$Pclass <- factor(full_data$Pclass)
full_data$Sex <- factor(full_data$Sex)
full_data$Embarked <- factor(full_data$Embarked)

# ---------------------------------------------------------------------------------------------
Survival = factor(full_data$Survived)
p = ggplot(full_data, aes(x=Pclass, fill= Survival)) +
  geom_bar(position="dodge") +
  scale_fill_manual(values=c("#FF6F61", "#A8D8B9"),labels=c('No', 'Yes')) +
  labs(x="Passenger Class", y="Number of Passenger", title="Survival by Passenger Class") + 
  theme_bw() + scale_x_discrete(labels=c("1" = "Upper Class", "2" = "Middle Class",
                                          "3" = "Lower Class"))

p
 # ---------------------------------------------------------------------------------------------
q <- ggplot(data = full_data
            , mapping = aes(x = Age, fill = Survival, color = Survival)) +
  scale_fill_discrete(labels=c('No', 'Yes'))
q + geom_histogram (alpha = 0.6,bins = 20) +
  labs(x="Age of Passenger", y="Number of Passenger") +
  ggtitle("Number of passenger \nsurvived/dead in various age group")+
  theme(text= element_text(size = 16)) 

# ---------------------------------------------------------------------------------------------
p <- ggplot(data = full_data
            , mapping = aes(x = Age, fill = Survival, color = Survival))

p + geom_histogram (alpha = 0.6) + 
  labs(x="Age of Passenger", y="Number of Passenger") +
  ggtitle("Survival Vs Age with respect to Gender") +
  theme(text = element_text(size = 16)) + facet_wrap(~ Sex, ncol= 2) +   scale_fill_discrete(labels=c('No', 'Yes'))

# ---------------------------------------------------------------------------------------------
p <- ggplot(data = full_data
            , mapping = aes(x = Age, fill = Survival, color = Survival)) 
  
  p + geom_density(alpha = 0.5) + facet_wrap(~ Sex, ncol = 2) +
  theme(text = element_text(size = 16)) + 
  labs(x="Density", y="Age") + ggtitle("Density Estimate by Age") +  scale_fill_discrete(labels=c('No', 'Yes'))


# ---------------------------------------------------------------------------------------------
  # ggplot(train_data, aes(x=Age, y=Fare, colour= factor(Survived))) +
  #   geom_point(alpha=0.5) +
  #   theme(text = element_text(size = 16)) + 
  #   geom_line(yintercept = 95, size = 1.4, colour="grey") +
  #   geom_text_repel(data = subset(train_data, Fare > 95),mapping =aes(lable=Pclass)) +
  #   labs(x="Age", y="Fare", title="Scatterplot of Age vs Fare Paid per Survived") +
  #   theme_bw()

  p <- ggplot(data = train_data, mapping = aes(x = Age, y = Fare, color = factor(Survived)))
  p + geom_point(alpha = 0.9) + theme(text=element_text(size = 16)) +
    geom_hline(yintercept =90, size = 1.4, color = "gray") +
    labs(x="Age of Passenger", y="Fare paid by passenger", title="Scatterplot of age vs Fare paid per Survived") +
    theme_bw()
# ---------------------------------------------------------------------------------------------
  # Define children as individuals under the age of 18
  train_data$Child <- ifelse(train_data$Age < 18, "Child", "Adult")
  
  # Filter dataset to only include individuals who survived
  train_survived <- filter(train_data, Survived == 1)
  
  ggplot(data = train_survived, aes(x = Sex, fill = Child)) +
    geom_bar(position = "dodge") +
    ggtitle("Children who Survived the Titanic") +
    xlab("Sex") +
    ylab("Number of Survivors") +
    scale_fill_manual(values = c("red", "blue")) +
    theme_minimal()
  
  #----

 
# ---------------------------------------------------------------------------------------------
#---- PLOT
# Age vs density
p <- ggplot(train_data, aes(x = Age)) + geom_density()
p + theme(panel.grid.major = element_line(color = "grey", size = 0.5), 
          panel.grid.minor = element_line(color = "grey", size = 0.5))

# Survived vs age
ggplot(train_data, aes(x = factor(Survived), y = Age)) + geom_boxplot()


ggplot(train_data, aes(x=Age, y=Fare)) +
  geom_point(alpha=0.5, color="#3D9970") +
  labs(x="Age", y="Fare", title="Relationship between Age and Fare Paid") +
  theme_bw()

# Age Vs Class
ggplot(full_data, aes(x = Pclass, y = Age)) + geom_boxplot()
# Fare Vs Class
ggplot(full_data, aes(x = Pclass, y = Fare)) + geom_boxplot()

# Male vs Female
ggplot(full_data, aes(x = Sex, fill = Sex)) + geom_bar()
# Age vs Gender
ggplot(train_data, aes(x = Sex, y = Age)) + geom_boxplot()

#------
s_e_x = factor(full_data$Sex)
levels(s_e_x)

 ggplot(class_count, aes(x="", y = c(25, 25, 50), fill= c("Male", "Female", "Child"))) + 
  geom_bar(width = 1, stat = "identity")

#__________________________________________________
# Load necessary libraries and read in data
library(ggplot2)
library(dplyr)

train_data <- read.csv("train_titanic.csv")

# Drop unnecessary columns from the dataset
train_data_clean <- train_data %>% select(Survived, Age, Fare, Sex)

# Drop missing values
train_data_clean <- na.omit(train_data_clean)

# Convert Sex variable to factor
train_data_clean$Sex <- as.factor(train_data_clean$Sex)

#____________________

# Read the data
train <- read.csv("train_titanic.csv")

# Calculate the number of survivors by passenger class
survivors <- train %>%
  filter(Survived == 1) %>%
  group_by(Pclass) %>%
  summarise(count = n())

# Create the pie chart
Survival = factor(survivors$Pclass)

ggplot(data = survivors, aes(x = "", y = count, fill = Survival )) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  theme_void() +
  labs(title = "Proportion of Titanic Survivors by Passenger Class") + scale_x_discrete(labels=c("1" = "Upper Class", "2" = "Middle Class", "3" = "Lower Class"))
  


