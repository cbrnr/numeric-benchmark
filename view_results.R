library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)

theme_set(theme_minimal())

df <- read_csv("results.csv")

df %>% 
    filter(threads==-1) %>% 
    unite("lang", language:blas, sep="/") %>% 
    ggplot(aes(y=benchmark, x=time, fill=lang)) +
    geom_col(position=position_dodge()) +
    labs(y=NULL) +
    coord_cartesian(xlim=c(0, 8))
