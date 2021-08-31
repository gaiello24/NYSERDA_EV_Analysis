#Load packages

library(readxl)
library(tidyverse)
library(lubridate)
library(sf)

#Load all sheets from Excel Workbook resource.xlsx

setwd('/Users/GavinAiello/R/NYSERDA EV Data')

sheet_names <- excel_sheets('resources.xlsx')
ev_data_list <- lapply(sheet_names, read_excel, path = 'resources.xlsx')
names(ev_data_list) <- sheet_names

#Import shapefile of NY zip codes for mapping

ny_zips_df <- st_read(paste(getwd(),'/ZIP_CODE_040114', sep = ""))

#Begin work with Charging Use data
#mutate data to include Year Month and Day columns

charging_data <- ev_data_list$`Charging Use`
names(charging_data) <- names(charging_data) %>%
  str_replace_all(c("[(]" = "", "[)]" = "", " " = "_"))
  
#Summarize total energy usage by zip code

charging_data <- charging_data %>% 
  mutate(Start_Year = year(Start_Date), Start_Month = month(Start_Date))
