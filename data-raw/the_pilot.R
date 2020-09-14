# PACOTES NECESSARIOS

library(ggplot2)
library(magrittr)
library(tidyverse)
library(stringr)
library(jpeg)
library(paletaCores)


# IMPORTACAO

friends <- readxl::read_excel("data/friends.xlsx")


# ARRUMACAO

friends <- friends %>%
  janitor::clean_names()


readr::write_rds(friends, "data/friends.rds")

