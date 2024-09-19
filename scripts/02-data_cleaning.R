---
  #### Preamble ####
# Purpose:tclean up the dataset got from opendatatoronto for number of Marriage License
# Author: Yiyi Feng
# Date: 19th September 2024
# Contact: yiyi.feng@mail.utoronto.ca
# Pre-requisites: no pre-requisites 
# License: MIT
# Other information: Need to install packages"tidyverse" and "testthat".
---
  
#### Load required libraries ####
library(dplyr)
library(tidyr)
library(lubridate)

#### Clean data ####
raw_data <- read_csv("../data/simulated_data/simulated_marriage_data.csv")

#### Clean the data ####
cleaned_data <- raw_data %>%
  # Separate TIME_PERIOD into year and month
  separate(TIME_PERIOD, into = c("year", "month"), sep = "-") %>%
  # Create a date column from year and month using lubridate::ymd
  mutate(date = ymd(paste(year, month, "01", sep = "-"))) %>%
  # Select and reorder columns
  select(id, CIVIC_CENTRE, MARRIAGE_LICENSES, date)

#### Save data ####
write_csv(cleaned_data, "../data/analysis_data/analysis_marriage_data.csv")

