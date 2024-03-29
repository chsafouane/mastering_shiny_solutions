library(shiny)
library(vroom)
library(tidyverse)
library(neiss)

# Producing the needed data using Hadley's code ----
top_prod <- injuries %>%
  filter(trmt_date >= as.Date("2017-01-01"), trmt_date < as.Date("2018-01-01")) %>%
  count(prod1, sort = TRUE) %>%
  filter(n > 5 * 365)

injuries %>%
  filter(trmt_date >= as.Date("2017-01-01"), trmt_date < as.Date("2018-01-01")) %>%
  semi_join(top_prod, by = "prod1") %>%
  mutate(age = floor(age), sex = tolower(sex), race = tolower(race)) %>%
  filter(sex != "unknown") %>%
  select(trmt_date, age, sex, race, body_part, diag, location, prod_code = prod1, weight, narrative) %>%
  vroom::vroom_write("./Chapter5/Data/neiss/injuries.tsv.gz")


injuries <- vroom::vroom("./Chapter5/Data/neiss/injuries.tsv.gz")
injuries
