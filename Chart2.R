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

This line chart shows the trend of championships won over the years, illustrating how the number of championships has changed over time. A notable observation I can make is that there were a total of two championships in 1870 and 9 total championships in 2018.
