```{r}
# Load necessary library
library(ggplot2)
library(dplyr)

# Read the dataset
data <- read.csv("titles.csv")

# Calculate runner-up statistics
runner_up_stats <- data %>%
  group_by(runner_up_metro) %>%
  summarise(total_runner_up = n())

# Calculate winner statistics
city_championships <- data %>%
  group_by(winner_metro) %>%
  summarise(total_championships = n())

# Merge winner and runner-up statistics
comparison_data <- full_join(city_championships, runner_up_stats, by = c("winner_metro" = "runner_up_metro"))
comparison_data <- comparison_data %>%
  replace_na(list(total_championships = 0, total_runner_up = 0)) %>%
  rename(City = winner_metro)

# Create Comparison Chart
comparison_chart <- ggplot(comparison_data, aes(x = reorder(City, -total_championships))) +
  geom_bar(aes(y = total_championships, fill = "Championships"), stat = "identity") +
  geom_bar(aes(y = total_runner_up, fill = "Runner-Up"), stat = "identity", alpha = 0.5) +
  labs(title = "Championships vs Runner-Up Statistics",
       x = "City",
       y = "Count") +
  scale_fill_manual(values = c("Championships" = "blue", "Runner-Up" = "red")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
print(comparison_chart)
# Save the plot
ggsave("comparison_chart.png", plot = comparison_chart, width = 8, height = 6)
```
