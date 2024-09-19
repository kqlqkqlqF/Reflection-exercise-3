---
  #### Preamble ####
# Purpose:test the dataset simulated for number of Marriage License
# Author: Yiyi Feng
# Date: 19th September 2024
# Contact: yiyi.feng@mail.utoronto.ca
# Pre-requisites: no pre-requisites 
# License: MIT
# Other information: Need to install packages"tidyverse" and "testthat".
---

library(tidyverse)
library("testthat")

simulated_data <-
  read_csv(
    file = "../data/simulated_data/simulated_marriage_data.csv",
    show_col_types = FALSE)

#### Test data ####

# Define the valid civic centres
valid_civic_centres <- c("ET", "NY", "SC", "LA", "SF")

# Test 1: Check if marriage licenses are non-negative
test_that("Marriage licenses are non-negative", {
  expect_true(all(simulated_data$MARRIAGE_LICENSES >= 0))
})

# Test 2: Check if civic centres are valid
test_that("Civic centre names are valid", {
  expect_true(all(simulated_data$CIVIC_CENTRE %in% valid_civic_centres))
})

# Optionally, you can print a message after successful tests
cat("All tests passed successfully!")

