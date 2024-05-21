# Load necessary library
library(dplyr)

# Aggregate Table Script
# Group by city and sport to show the total number of championships won by each city in each sport
aggregate_table <- data %>%
  group_by(winner_metro, sport) %>%
  summarise(total_championships = n()) %>%
  arrange(desc(total_championships)) %>%
  mutate(total_championships = round(total_championships, 2)) # Round the total championships

# Rename columns for better readability
colnames(aggregate_table) <- c("City", "Sport", "Total Championships")

# Display the table
print(aggregate_table)
