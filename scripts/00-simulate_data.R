---
  #### Preamble ####
# Purpose: Simulate and generate a dataset for number of Marriage License
# Author: Yiyi Feng
# Date: 19th September 2024
# Contact: yiyi.feng@mail.utoronto.ca
# Pre-requisites: no pre-requisites 
# License: MIT
# Other information: Need to install packages"tidyverse".
---
  

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# Set random seed for reproducibility
set.seed(237)

# Define the parameters
civic_centres <- c("ET", "NY", "SC", "LA", "SF") # List of civic centers
time_periods <- seq.Date(from = as.Date("2011-01-01"), 
                         to = as.Date("2021-12-01"), by = "month") # Monthly time periods

# Create a data frame with all combinations of CIVIC_CENTRE and TIME_PERIOD
data <- expand.grid(
  CIVIC_CENTRE = civic_centres,
  TIME_PERIOD = format(time_periods, "%Y-%m")
)

# Generate marriage licenses for each combination using Poisson distribution
data$MARRIAGE_LICENSES <- rpois(nrow(data), lambda = 10)

# Add the _id column starting from 1
data$id <- 1:nrow(data)

# Reorder columns to match the desired format
data <- data[, c("id", "CIVIC_CENTRE", "MARRIAGE_LICENSES", "TIME_PERIOD")]

# Print the first few rows of the dataset
head(data)

# Write simulated data to a CSV file for further analysis
write.csv(data, "../data/simulated_data/simulated_marriage_data.csv", row.names = TRUE)


