# Load the data
data <- read_csv("titles.csv")
data

# Load necessary libraries
library(dplyr)
library(tidyverse)

# Define the summary information function
summary_info <- function(data) {
  info <- list()
  
  # Number of observations (rows) in the dataset
  info$num_observations <- nrow(data)
  
  # Number of features (columns) in the dataset
  info$num_features <- ncol(data)
  
  # City with the highest number of championships
  info$city_with_most_championships <- data %>%
    group_by(winner_metro) %>%
    summarise(total_championships = n()) %>%
    arrange(desc(total_championships)) %>%
    slice(1) %>%
    pull(winner_metro)
  
  # Total number of championships for the city with the highest number
  info$total_championships_for_top_city <- data %>%
    group_by(winner_metro) %>%
    summarise(total_championships = n()) %>%
    arrange(desc(total_championships)) %>%
    slice(1) %>%
    pull(total_championships)
  
  # Average number of championships per city
  info$avg_championships_per_city <- data %>%
    group_by(winner_metro) %>%
    summarise(total_championships = n()) %>%
    summarise(avg_championships = mean(total_championships)) %>%
    pull(avg_championships)
  
  # Total number of different sports represented in the dataset
  info$num_sports <- data %>%
    select(sport) %>%
    distinct() %>%
    nrow()
  
  # Time range of the championships data
  info$time_range <- range(data$year)
  
  return(info)
}

# Example usage assuming 'data' is your dataframe
summary <- summary_info(data)
print(summary)
