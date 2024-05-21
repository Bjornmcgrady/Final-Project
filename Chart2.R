# Load necessary library
library(ggplot2)
library(dplyr)

# Read the dataset
data <- read.csv("titles.csv")

# Create a summary dataset for championships over time
championships_over_time <- data %>%
  group_by(year) %>%
  summarise(total_championships = n())

# Create Line Chart
line_chart <- ggplot(championships_over_time, aes(x = year, y = total_championships)) +
  geom_line(color = "blue") +
  labs(title = "Championships Over Time",
       x = "Year",
       y = "Total Championships") +
  theme_minimal()
print(line_chart)
# Save the plot
ggsave("line_chart.png", plot = line_chart, width = 8, height = 6)
