# Tidytuesday - Week 33: Open Psychometrics

[Tidytuesday's Week 33](https://github.com/rfordatascience/tidytuesday/tree/master/data/2022/2022-08-16) is about [Open-Source Psychometric Project](https://openpsychometrics.org/), courtesy of [Tanya Shapiro](https://twitter.com/tanya_shapiro/status/1558936093390774272?s=20&t=tI4nccuwEG4SjWd3H1Suew).

The datasets contain psychometrics about characters from 100 fictional universes. There are three datasets:

**Characters**

High level information about characters. Includes a notability score and links to related pages.

| Variable   | Type    | Description                         |
| :--------- | :------ | :---------------------------------- |
| id         | varchar | Character ID                        |
| name       | varchar | Character Name                      |
| uni_id     | varchar | Universe ID, e.g. GOT               |
| uni_name   | varchar | Universe Name, e.g. Game of Thrones |
| notability | num     | Notability Score                    |
| link       | varchar | Link to Character Page              |
| image_link | varchar | Link to Character Image             |

**Psychology Stats**

Personality/Psychometric Stats per character.

| Variable       | Type    | Description                            |
| :------------- | :------ | :------------------------------------- |
| char_id        | varchar | Character ID                           |
| char_name      | varchar | Character Name                         |
| uni_id         | varchar | Universe ID, e.g. GOT                  |
| uni_name       | varchar | Universe Name, e.g. Game of Thrones    |
| question       | varchar | Personality Question - e.g. messy/neat |
| personality    | varchar | Character Personality, e.g. neat       |
| avg_rating     | num     | Score out of 100                       |
| rank           | int     | Rank                                   |
| rating_sd      | num     | Rating Standard Deviation              |
| number_ratings | int     | Number of Ratings (Responses)          |

**Myers-Briggs**

Users who took the personal personality assessment tests were subsequently asked to self-identify their Myers-Briggs types. Dataset contains results.

| Variable       | Type    | Description                         |
| :------------- | :------ | :---------------------------------- |
| char_id        | varchar | Character ID                        |
| char_name      | varchar | Character Name                      |
| uni_id         | varchar | Universe ID, e.g. GOT               |
| uni_name       | varchar | Universe Name, e.g. Game of Thrones |
| myers_briggs   | varchar | Myers Briggs Type, e.g. ENFP        |
| avg_match_perc | num     | Percentage match                    |
| number_users   | int     | Number of user respondents          |