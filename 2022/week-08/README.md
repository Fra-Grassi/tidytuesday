# Tidytuesday - Week 08: World Freedom Index

[Tidytuesday's Week 08](https://github.com/rfordatascience/tidytuesday/blob/master/data/2022/2022-02-22/readme.md) is about **World Freedom Index**

The dataset contains the following variables:

| variable    | class     | description                                     |
| :---------- | :-------- | :---------------------------------------------- |
| country     | character | Country Name                                    |
| year        | double    | Year                                            |
| CL          | double    | Civil Liberties                                 |
| PR          | double    | Political rights                                |
| Status      | character | Status (Free F, Not Free NF, Partially Free PF) |
| Region_Code | double    | UN Region code                                  |
| Region_Name | character | UN Region Name                                  |
| is_ldc      | double    | Is a least developed country (binary 0/1)       |

This is an exercise on:

1. **Parallel coordinates plots**:

    For this, I'll try to track the **Civil Liberties** and **Political Rights** indexes in Europe across the years

2. **Maps**:

    Never worked with geographical data. For this, I'll try to plot the same two indexes on a world map in a given year.
