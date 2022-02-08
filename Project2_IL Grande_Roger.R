
# Roger IL Grande
# EM-622 Project 2


# Load the necessary libraries
library(lubridate)
library(tidyr)
library(dplyr)
library(ggplot2)
library(plyr)
library(reshape)

# Set working directory
setwd("~/Documents/R Projects")

timesData <- read.csv("timesData.csv", header = TRUE) # Import the dataset

View(timesData) # View the data


str(timesData) # Check if the data are imported as correct forms

# convert chr to num: international, income, total_score
timesData$international <- as.numeric(timesData$international)
timesData$income <- as.numeric(timesData$income)
timesData$total_score <- as.numeric(timesData$total_score)
str(timesData)

# convert chr to int: world_rank? No, because some of the rankings contain hyphens to show range, and mathematical operations on rank are not needed


# Expected Calculation method:
# Teaching (30 percent of final score), research (30 percent), citations (research impact) (worth 32.5 percent), international mix (5 percent), industry income (2.5 percent)

# Calculation test
calc_test <- (0.30*timesData[1,4] + 0.05*timesData[1,5] + 0.30*timesData[1,6] + 0.325*timesData[1,7] + .025*timesData[1,8]) # Formula
calc_test <- round(calc_test, digits=1) # Round to tenths
print(calc_test) # Print the result
calc_test == timesData[1,9] # Return TRUE if total_score matches this calculation


sum(is.na(timesData)) # Count the number of cells that contain missing values

timesData.clean <- na.omit(timesData) # Create data set which omits these missing values
str(timesData.clean) # View the data types in this new dataset
View(timesData.clean) # View the dataset
# I performed this operation AFTER converting chr to num for the three variables in order to remove NA/NAN if needed


# Manipulation: Create a subset of data
partial_a <- subset(timesData, select = c('world_rank', 'university_name', 'country', 'research', 'income', 'num_students', 'total_score', 'year'))
View(partial_a)

# Create a subset of only year 2012 data
twenty_twelve_only <- subset(timesData, year=="2012")
View(twenty_twelve_only)

# Sort by descending population
sorted_descending_population <- arrange(twenty_twelve_only, desc(num_students))
View(sorted_descending_population)

# Identify the top five universities with largest student population
top_five <- twenty_twelve_only %>%
  arrange(desc(num_students)) %>% 
  slice(1:5)
View(top_five) # View the whole table
top_five[,"university_name", drop=FALSE] # print out the top five in the terminal output, include row names


# Use the split-apply-combine strategy to summarize the highest research score of each year
grouped_times_data <- ddply(timesData, c('year'), summarize, maxscore = max(research))
grouped_times_data # output result in terminal


# Plot a line chart of the ranking as a function of year for Columbia University
Columbia_subset <- subset(timesData, university_name=="Columbia University")
Columbia_subset$world_rank <- as.integer(Columbia_subset$world_rank) # The rankings must be numbers in order to plot
View(Columbia_subset)


Columbia_plot <- ggplot(Columbia_subset) + geom_line(aes(y = world_rank, x = year)) # Set the source dataset and columns used for each axis
Columbia_plot + labs(title = "Ranking as a Function of Year for Columbia University", x = "Year", y = "Ranking", caption = "HW2 Part 2d") + theme(plot.title = element_text(hjust = 0.5)) # Add axis titles, centered plot title, and caption


# Melt or reshape the sub dataset partial_a into a long format based on university name. tidyr package does not work on my version of macOS so I cannot use group function
partial_a_tidy <- melt(partial_a, id.vars = c("university_name"))
partial_a_tidy


# Interpretation: What is and where is the greatest number of students in each year?

# Create a subset of each year data
twenty_eleven_only <- subset(timesData, year=="2011")
twenty_twelve_only <- subset(timesData, year=="2012")
twenty_thirteen_only <- subset(timesData, year=="2013")
twenty_fourteen_only <- subset(timesData, year=="2014")
twenty_fifteen_only <- subset(timesData, year=="2015")
twenty_sixteen_only <- subset(timesData, year=="2016")


# 2011
top_2011 <- twenty_eleven_only %>%
  arrange(desc(num_students)) %>% 
  slice(1:1)
name1 <- top_2011[1,2] # pull the university name for year 1
num1 <- top_2011[1,10] # pull the number of students for year 1

# 2012
top_2012 <- twenty_twelve_only %>%
  arrange(desc(num_students)) %>% 
  slice(1:1)
name2 <- top_2012 # pull the university name for year 2
num2 <- top_2012[1,10] # pull the number of students for year 2

# 2013
top_2013 <- twenty_thirteen_only %>%
  arrange(desc(num_students)) %>% 
  slice(1:1)
name3 <- top_2013[1,2] # pull the university name for year 3
num3 <- top_2013[1,10] # pull the number of students for year 3

# 2014
top_2014 <- twenty_fourteen_only %>%
  arrange(desc(num_students)) %>% 
  slice(1:1)
name4 <- top_2014[1,2] # pull the university name for year 4
num4 <- top_2014[1,10] # pull the number of students for year 4

# 2015
top_2015 <- twenty_fifteen_only %>%
  arrange(desc(num_students)) %>% 
  slice(1:1)
name5 <- top_2015[1,2] # pull the university name for year 5
num5 <- top_2015[1,10] # pull the number of students for year 5

# 2016
top_2016 <- twenty_sixteen_only %>%
  arrange(desc(num_students)) %>% 
  slice(1:1)
name6 <- top_2016[1,2] # pull the university name for year 6
num6 <- top_2016[1,10] # pull the number of students for year 6

# Combine all of the greatest number of students numbers and universities by year into a single data frame
interpretation.df <- data.frame(Year=c("2011", "2012", "2013", "2014", "2015", "2016"), University=c(name1, name2, name3, name4, name5, name6),
                  Students=c(num1, num2, num3, num4, num5, num6))
View(interpretation.df)



# QUESTION 2

rainfallData <- read.csv("rainfall.csv", header = TRUE) # Import the dataset
View(rainfallData)
str(rainfallData)

# Plot a line chart of the total rainfall as a function of year
rainfall_plot <- ggplot(rainfallData) + geom_line(aes(y = Total, x = WY)) # Set the source dataset and columns used for each axis
rainfall_plot + labs(title = "Total Rainfall as a Function of Year in CA", x = "Year", y = "Rainfall", caption = "HW2 Question 2") + theme(plot.title = element_text(hjust = 0.5)) # Add axis titles, centered plot title, and caption

# Create a subset of data for year 1950 and reshape the subset
nineteen_fifty_only <- subset(rainfallData, WY=="1950")
nineteen_fifty_only

# Reshape the subset into long form, remove total data and keep monthly data only
nineteen_fifty_tidy <- melt(nineteen_fifty_only, id.vars = c("WY"))
nineteen_fifty_tidy <- subset(nineteen_fifty_tidy, variable!="Total")
nineteen_fifty_tidy

# Plot a histogram of monthly rainfall in 1950
ggplot(nineteen_fifty_tidy, aes(x=variable, y=value)) + geom_histogram(stat='identity')

# Change colors
p<-ggplot(nineteen_fifty_tidy, aes(x=variable, y=value)) + 
  geom_histogram(color="gold", fill="blue", stat='identity')

# Add axis titles, resize binwidth, centered plot title, and caption
p + labs(title = "California Monthly Rainfall in 1950", x = "Month", y = "Rainfall", caption = "HW2 Question 2", binwidth = 1) + theme(plot.title = element_text(hjust = 0.5))

