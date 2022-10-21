# Tidytuesday - Week 42: Stranger Things Dialogue

This week's tidytuesday dataset is about dialogues from Stranger Things!  
This offers me an opportunity for some exercise in **text mining** and  **sentiment analysis**.

Since I'm pretty much new to the topic (just briefly played with it in the past) for this exercise I will follow along the very nice [Text Mining in R: A tidy Approach](https://www.tidytextmining.com/index.html) by **Julia Silge and David Robinson**. I will start with the same kind of approach they use in the text, and maybe add something more original once I familiarize with the tools and the topic.

From the [tidytuesday page of this week](https://github.com/rfordatascience/tidytuesday/tree/master/data/2022/2022-10-18) we can read that we have two datasets (for more detail, see the tidytuesday page):

- "episodes.csv":

| !variable              | class     | description                      |
| :--------------------- | :-------- | :------------------------------- |
| !season                | integer   | Season number                    |
| !episode               | integer   | Episode number within the season |
| !title                 | character | Title of the episode             |
| !directed_by           | character | Director(s) of the episode       |
| !written_by            | character | Writer(s) of the episode         |
| !original_release_date | character | Release date of the episode      |

- "stranger_things_all_dialogue.csv":

| variable        | class     | description                                               |
| :-------------- | :-------- | :-------------------------------------------------------- |
| season          | integer   | Season number                                             |
| episode         | integer   | Episode number within the season                          |
| line            | integer   | Order in which line appears in episode                    |
| raw_text        | character | Original text with both dialogue and stage directions     |
| stage_direction | character | Text describing what’s happening, or who is talking       |
| dialogue        | character | Dialogue spoken within the episode                        |
| start_time      | character | Time within the episode when the line starts being spoken |
| end_time        | character | Time within the episode when the line stops being spoken  |

This is the plan for the moment (might grow while exploring the data)

- Prepare the data
- Some text mining:
  - Who talks the most in the series?
  - Who has the longest dialogue?
  - Who talks most with whom?
- Sentiment analysis:
  - Visualize the lexicon categories of the main characters
  - Which are the most common positive and negative words in the series?
  - What's the sentiment of the episodes across the seasons?