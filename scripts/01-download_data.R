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
  

#### Load required libraries ####
library(opendatatoronto)
library(dplyr)
library(readr)  # For write_csv


# get package
package <- show_package("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")
package

# get all resources for this package
resources <- list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data
#### Save data ####
# Save the data in the desired format
write_csv(data, "../data/raw_data/raw_marriage_data.csv") 

