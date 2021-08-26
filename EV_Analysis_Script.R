#Load all sheets from Excel Workbook resource.xlsx

library(readxl)

setwd('/Users/GavinAiello/R/NYSERDA EV Data')

sheet_names <- excel_sheets('resources.xlsx')
ev_data_list <- lapply(sheet_names, read_excel, path = 'resources.xlsx')
names(ev_data_list) <- sheet_names