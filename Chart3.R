# Load necessary library
library(ggplot2)
library(dplyr)

# Read the dataset
data <- read.csv("titles.csv")

# Create Bar Chart
bar_chart <- ggplot(data, aes(x = reorder(winner_metro, -table(winner_metro)[winner_metro]))) +
  geom_bar(fill = "blue") +
  labs(title = "Total Championships by City",
       x = "City",
       y = "Total Championships") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(bar_chart)
# Save the plot
ggsave("bar_chart.png", plot = bar_chart, width = 8, height = 6)
