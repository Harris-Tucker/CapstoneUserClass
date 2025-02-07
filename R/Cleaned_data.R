library(tidyverse)
library(ggplot2)
library(gridExtra)


file_path <- "/Users/tharris/CapstoneUserClass/R/user_behavior_dataset.csv"

# Load the data
raw_data <- read.csv(file_path, header = FALSE)


# Remove "junk" rows
raw_data <- raw_data[-1, ]
raw_data <- raw_data[-1, ]

# Rename columns, as they were somehow removed when bringing in the data

colnames(raw_data) <- c("UserID", "Device Model", "Operating System", "App Usage Time (min/day)", "Screen On Time (hours/day)",
                        "Battery Drain (mAh/day)", "Number of Apps Installed", "Data Usage (MB/day)", "Age", "Gender",
                        "User Behavior Class")

# Remove Column 2 ( Device Model, too many categorical variables which don't seem necessary )
raw_data <- raw_data[, -2]

# Adjust data types on numeric columns
# Specify columns to convert
numeric_columns <- c("UserID", "App Usage Time (min/day)", "Screen On Time (hours/day)",
                     "Battery Drain (mAh/day)", "Number of Apps Installed", "Data Usage (MB/day)",
                     "Age", "User Behavior Class")

raw_data[numeric_columns] <- lapply(raw_data[numeric_columns], as.numeric)

cleaned_data <- raw_data

# As this is a classification data set, the target variable needs to be a factor
cleaned_data$`User Behavior Class` <- as.factor(cleaned_data$`User Behavior Class`)

# Making OS a factor
cleaned_data$`Operating System` <- as.factor(cleaned_data$`Operating System`)
cleaned_data$Gender <- as.factor(cleaned_data$Gender)

