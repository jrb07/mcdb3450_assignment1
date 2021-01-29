library(readr)
library(dplyr)
library(ggplot2)
## A.
# Read the csv as a data frame 
worms <- read_csv("worms.csv")
# Filter out all rows with the Grassland string included
x <- worms %>% filter(Vegetation == "Grassland")
# Count the number of those rows to know how many samples Mike took from
#  areas with Grassland vegetation
count(x)

## B.
# Select the Soil.pH column and save as a data frame
pH_vals <- select(worms, Soil.pH)
# Print the summary of the pH values, including the mean, to the console
summary(pH_vals)

## C.
# Filter out each of the vegetation zone values as their own data frames
grassland_data <- worms %>% filter(Vegetation == "Grassland")
arable_data <- worms %>% filter(Vegetation == "Arable")
meadow_data <- worms %>% filter(Vegetation == "Meadow")
orchard_data <- worms %>% filter(Vegetation == "Orchard")
scrub_data <- worms %>% filter(Vegetation == "Scrub")
# Print summary of each column for each data frame
summary(grassland_data)
summary(arable_data)
summary(meadow_data)
summary(orchard_data)
summary(scrub_data)
# I manually took the mean for each column from the summaries and put them
#  in an Excel spreadsheet before exporting the spreadsheet as a .csv into
#  this workspace

## D.
# Use ggplot to make plots of the Area vs Worm Density for the worms data frame
# a Smooth line graph
ggplot(worms, aes(x = Area, y = Worm.density)) + geom_smooth()
# a dot plot which seems to show groupings better
ggplot(worms, aes(x = Area, y = Worm.density)) + geom_point() + 
      scale_x_continuous() + geom_jitter()
# a step graph
ggplot(worms, aes(x = Area, y = Worm.density)) + geom_step(direction = "hv")
# a 2d density graph
ggplot(worms, aes(x = Area, y = Worm.density)) + geom_density2d()
# a filled 2d density graph which results in the dreaded heat map
ggplot(worms, aes(x = Area, y = Worm.density)) + geom_density2d_filled()
