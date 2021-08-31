#Functions to be used in EV_Analysis_Script

#Create choropleth of data in charging_data

choropleth_gen <- function(sf_df, ev_data, sum_value){
  
#Isolate the sum_value, grouping over zipcodes
  
  zip_code_data <- ev_data %>%
    group_by(ZIP_Code) %>%
    rename(ZIPCODE = ZIP_Code, Sum_Col = match(sum_value, colnames(ev_data))) %>%
    summarise(Total_Value = sum(Sum_Col))
  
#Join with sf_df
  
  sf_df <- sf_df %>%
    left_join(zip_code_data)
  
}