#Load all sheets from Excel Workbook resource.xlsx

library(readxl)

setwd('/Users/GavinAiello/R/NYSERDA EV Data')

sheet_names <- excel_sheets('resources.xlsx')
ev_data_list <- lapply(sheet_names, read_excel, path = 'resources.xlsx')
names(ev_data_list) <- sheet_names

#Begin work with Charging Use data

#Load tidyverse

library(tidyverse)

charging_data <- ev_data_list$`Charging Use`
names(charging_data) <- names(charging_data) %>%
  str_replace_all(c("[(]" = "", "[)]" = "", " " = "_"))
  
#Summarize total energy usage by zip code

charging_data %>%
  group_by(ZIP_Code) %>%
  summarise(total_energy = sum(Energy_kWh))

