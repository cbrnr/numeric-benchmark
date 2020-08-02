library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)
library(purrr)

theme_set(theme_minimal())

df <- map_df(list.files(pattern="*.csv"), read_csv)

df %>% 
    unite("lang", language:blas, sep="/") %>% 
    ggplot(aes(y=benchmark, x=time, fill=lang)) +
    geom_col(position=position_dodge()) +
    labs(y=NULL)
