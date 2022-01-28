#### Preamble ####
# Purpose: Download data from opendatatoronto
# Author: Luxuan Zhu
# Data: 6 February 2021
# Contact: lucylu.zhu@mail.utoronto.ca
# License: MIT

#### Workspace setup ####

library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download Data ####

# get package
package <- show_package("64a26694-01dc-4ec3-aa87-ad8509604f50")
package

# get all resources for this package
resources <- list_package_resources("64a26694-01dc-4ec3-aa87-ad8509604f50")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
fire_incidents <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save Dataset ####

write_csv(fire_incidents, "inputs/data/fire_incidents.csv")

