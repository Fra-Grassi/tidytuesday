# Tidytuesday - Week 44: Horror Movies

To celebrate Halloween, [this week's tidytuesday](https://github.com/rfordatascience/tidytuesday/tree/master/data/2022/2022-11-01) theme is **Horror Movies**!

This time we have one single dataset, containing lots of info about ~35K horror movies from [The Movie Database](https://www.themoviedb.org)

| Variable          | Type | Definition                 | Example                         |
| :---------------- | :--- | :------------------------- | :------------------------------ |
| id                | int  | unique movie id            | 4488                            |
| original_title    | char | original movie title       | Friday the 13th                 |
| title             | char | movie title                | Friday the 13th                 |
| original_language | char | movie language             | en                              |
| overview          | char | movie overview/desc        | Camp counselors are stalked...  |
| tagline           | char | tagline                    | They were warned...             |
| release_date      | date | release date               | 1980-05-09                      |
| poster_path       | char | image url                  | /HzrPn1gEHWixfMOvOehOTlHROo.jpg |
| popularity        | num  | popularity                 | 58.957                          |
| vote_count        | int  | total votes                | 2289                            |
| vote_average      | num  | average rating             | 6.4                             |
| budget            | int  | movie budget               | 550000                          |
| revenue           | int  | movie revenue              | 59754601                        |
| runtime           | int  | movie runtime (min)        | 95                              |
| status            | char | movie status               | Released                        |
| genre_names       | char | list of genre tags         | Horror, Thriller                |
| collection_id     | num  | collection id (nullable)   | 9735                            |
| collection_name   | char | collection name (nullable) | Friday the 13th Collection      |