################################################################################
# A file containing objects (variables) which are available both in ui.R and server.R
# It may support the app in several fields, such as package installation, 
# data preprocessing, database connection etc.
################################################################################
setwd('C:\\Users\\lenovo\\Desktop\\shiny_darmowe_pakiet_startowy-master')
library(maps)
library(shiny)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(rvest)
library(ggmap)

data <- read.csv('lifeexpectancy2.csv')

data$Status <- ifelse(data$Country %in% 
                        c('France', 'Canada'), 'Developed', as.character(data$Status))

url <- "https://www.nationsonline.org/oneworld/country_code_list.htm"

iso_codes <- url %>%
  read_html() %>%
  html_nodes(xpath = '//*[@id="CountryCode"]') %>%
  html_table()

iso_codes <- iso_codes[[1]][, -1]

iso_codes <- iso_codes[!apply(iso_codes, 1, function(x){all(x == x[1])}), ]

names(iso_codes) <- c("Country", "ISO2", "ISO3", "UN")


world_data <- ggplot2::map_data('world')
world_data <- fortify(world_data)

statusofthecountry <- data %>% 
  count(Status) %>% 
  arrange(desc(Status))

summary(data)

world_data <- world_data %>% rename(Country = region)

datajoin <- left_join(world_data, data)

ggplot(datajoin, aes(x = long, y = lat,
                     group = group, fill = Status))+
  geom_polygon(colour = "black")
  
