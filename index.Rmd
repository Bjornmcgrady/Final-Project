---
title: "Final Project"
output: html_document
date: "2024-05-17"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

# Load the data
```{r}
data <- read_csv("titles.csv")
data
```

# Load necessary libraries
```{r}
library(dplyr)
library(tidyverse)
```

# Define the summary information function
```{r}
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
```
