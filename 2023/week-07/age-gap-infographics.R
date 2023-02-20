# Infographic on age-gap in same-gender couples from Hollywood movies

# Plots:
# - lollipop plot with age gap in woman-woman couples
# - lollipop plot with age gap in man-man couples
# - Age pyramid with women and men age distributions
# - text with additional info

# Libraries and fonts ----
library(tidyverse)
library(ggpubr)
library(patchwork)
library(showtext)

font_add_google(name = "Roboto Condensed", family = "Roboto Condensed")
showtext_auto()

# Get data ----

# tuesdata <- tidytuesdayR::tt_load(2023, week = 7)
# age_gaps <- tuesdata$age_gaps
# saveRDS(age_gaps, file = "2023/week-07/raw-data/age-gaps.RDS")
age_gaps <- readRDS(file = "2023/week-07/raw-data/age-gaps.RDS")

# Some general plot settings ----

col_woman <- scico::scico(1, palette = "berlin", direction = -1)  # color for women
col_man <- scico::scico(1, palette = "berlin", direction = 1)  # color for men
age_lims <- c(-81, 81)  # age scale limits for lollipop plots
age_breaks <- seq(-80, 80, by = 20)  # age scale breaks for lollipop plots
age_labels <- c(seq(80, 20, by = -20), seq(0, 80, by = 20))  # age scale labels for lollipop plots
lineW <- 1  # line width for lollipop plots
pointSize <- 3  # point size for lollipop plots
base_size <- 20  # base font size


# Clean and prepare data ----

# Select same-gender couples and add identifier to each couple (there are multiple couples in some movies)
age_gaps <- age_gaps %>% 
  filter(character_1_gender == character_2_gender) %>%  
  arrange(release_year, movie_name) %>%  # sort also by release year in case of further plotting for this dimension
  mutate(ID = 1:n())  

# Lollipop plots ----

# "Actor 2" is always the youngest. Turn their age negative to plot them on the left:
lollipop_df <- age_gaps %>% 
  mutate(actor_2_age = -actor_2_age)

# Woman-woman couples plot:
ww_plot <- lollipop_df %>% 
  filter(character_1_gender == "woman") %>% 
  mutate(ID = fct_reorder(factor(ID), age_difference)) %>%  # reorder entries based on age difference
  ggplot() +
  geom_vline(xintercept = 0, color = "black", linewidth = 0.5) +
  geom_segment(aes(x = actor_2_age, xend = actor_1_age, y = ID, yend = ID), color = col_woman, linewidth = lineW) +
  geom_point(aes(x = actor_2_age, y = ID), color = col_woman, size = pointSize) +
  geom_point(aes(x = actor_1_age, y = ID), color = col_woman, size = pointSize) +
  scale_x_continuous(limits = age_lims, breaks = age_breaks, labels = age_labels) +
  theme_minimal(base_size = base_size) +
  theme(
    panel.grid.minor.x = element_line(linewidth = 0.5, linetype = "dashed"),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    axis.title = element_blank(),
    axis.text.y = element_blank(),
  )

# Man-man couples plot:
mm_plot <- lollipop_df %>% 
  filter(character_1_gender == "man") %>% 
  mutate(ID = fct_reorder(factor(ID), age_difference)) %>%  # reorder entries based on age difference
  ggplot() +
  geom_vline(xintercept = 0, color = "black", linewidth = 0.5) +
  geom_segment(aes(x = actor_2_age, xend = actor_1_age, y = ID, yend = ID), color = col_man, linewidth = lineW) +
  geom_point(aes(x = actor_2_age, y = ID), color = col_man, size = pointSize) +
  geom_point(aes(x = actor_1_age, y = ID), color = col_man, size = pointSize) +
  scale_x_continuous(limits = age_lims, breaks = age_breaks, labels = age_labels) +
  theme_minimal(base_size = base_size) +
  theme(
    panel.grid.minor.x = element_line(linewidth = 0.5, linetype = "dashed"),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    axis.title = element_blank(),
    axis.text.y = element_blank()
  )
  
# Age pyramid plot ----

# HT to Kitt Konathan for this trick. Check their beautiful code and plot at: https://github.com/KittJonathan/tidytuesday/blob/master/R/2023_07_holywood_age_gaps.R

# First, combine the age of both actors in one variable:
temp_df <- rbind(
  age_gaps %>% select(character_1_gender, actor_1_age) %>% rename(gender = character_1_gender, age = actor_1_age),
  age_gaps %>% select(character_2_gender, actor_2_age) %>% rename(gender = character_2_gender, age = actor_2_age)
  ) 

# Then, separate by gneder:
temp_w_df <- temp_df %>% filter(gender == "woman")
temp_m_df <- temp_df %>% filter(gender == "man")

# For each gender, break age in bins and count entries in each bin:
temp_w_df <- temp_w_df %>% 
  mutate(bin = cut(age, 
                   breaks = seq(20, 85, by = 5), # bins of 5 years each
                   include.lowest = TRUE, right = FALSE)) %>%  # "right = FALSE" -> create right-open intervals
  group_by(bin) %>% 
  summarize(count = n()) %>% 
  complete(bin, fill = list(count=0)) %>%  # add count for empty bins
  rename(women = count)
  
temp_m_df <- temp_m_df %>% 
  mutate(bin = cut(age, 
                   breaks = seq(20, 85, by = 5), # bins of 5 years each
                   include.lowest = TRUE, right = FALSE)) %>%  # "right = FALSE" -> create right-open intervals
  group_by(bin) %>% 
  summarize(count = n()) %>% 
  complete(bin, fill = list(count=0)) %>%  # add count for empty bins
  rename(men = count) 

# We can now re-join the two df by bin, and add better age labels:
hist_df <- temp_w_df %>% 
  left_join(temp_m_df) %>% 
  mutate(age_labels = fct_relabel(bin, ~ gsub("[]\\[\\)]", "", .x)),  # add proper age labels. First remove parentheses...
         age_labels = fct_relabel(age_labels, ~gsub(",", "-", .x)))  # then replace commas with dashes (surely there is a more elegant way)

# Finally, add a unique ID per row (it will be used for positioning bars in the plot):
hist_df <- hist_df %>% rowid_to_column()

rm(temp_df, temp_w_df, temp_m_df)

rect_dist <- 0.6  # distance (in plot unit) between rectangles and y intercept

age_plot <- hist_df %>% ggplot() +
  geom_rect(aes(xmin = -women - rect_dist, xmax = -rect_dist,  # women rect on the left
                ymin = rowid - 0.4, ymax = rowid + 0.4), fill = col_woman) +
  geom_rect(aes(xmin = rect_dist, xmax = men + rect_dist,  # men rect on the right
                ymin = rowid - 0.4, ymax = rowid + 0.4), fill = col_man) +
  geom_text(aes(x = 0, y = rowid, label = age_labels), size = 12/.pt) +
  scale_x_continuous(limits = c(-8, 8), 
                     breaks = c(seq(-6 - rect_dist, - rect_dist, by = 1), seq(rect_dist, 6 + rect_dist, by = 1)), 
                     labels = c(seq(6, 0, by = -1), seq(0, 6, by = 1)),
                     expand = c(0, 0)) +
  theme_minimal(base_size = base_size) +
  theme(
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    axis.title = element_blank(),
    axis.text.y = element_blank()
    )

age_plot
