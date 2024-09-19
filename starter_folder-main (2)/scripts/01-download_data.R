---
  #### Preamble ####
# Purpose: Gather a dataset for number of Marriage License
# Author: Yiyi Feng
# Date: 19th September 2024
# Contact: yiyi.feng@mail.utoronto.ca
# Pre-requisites: no pre-requisites 
# License: MIT
# Other information: Need to install packages"tidyverse", "opendatatoronto", and "dplyr".
---
  

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####
# Get the dataset ID or package ID for "Marriage Licence Statistics"
# The dataset package URL is: https://open.toronto.ca/dataset/marriage-licence-statistics/
# Use the package ID directly:
package_id <- "f7bf89d0-647e-4706-b7a7-5a8c3a2674e6"

# Get all resources for the package
resources <- list_package_resources(package_id)

# Find the correct resource (assuming it's a CSV file)
marriage_licence_resource <- filter(resources, tolower(format) == "csv")

# Load the data from the selected resource
marriage_licence_data <- marriage_licence_resource %>%
  get_resource()

# View the first few rows of the dataset
head(marriage_licence_data)

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(marriage_licence_data, "../data/raw_data/raw_marriage_data.csv") 

         
