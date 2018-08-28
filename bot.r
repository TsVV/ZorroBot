# Fetch command line arguments
myArgs <- commandArgs(trailingOnly = TRUE)

# Return the population by country

countries = c(as.character(myArgs))

wb.names = c('Population')

wb.indicators = c('SP.POP.TOTL')

library(wbstats)

countriesFile = 'countries.csv'

if (file.exists(countriesFile)) {
  countries.iso3 = unlist(read.csv2(countriesFile))
} else {
  countries.iso3 = unique(wb(indicator = wb.indicators)$iso3c)
  write.csv2(countries.iso3, countriesFile, row.names = FALSE)
}

if (as.character(myArgs) %in% countries.iso3) {
  pop_data <- wb(country   = countries, 
                 indicator = wb.indicators)
  
  png(paste0(as.character(myArgs), '.png'), bg="transparent")
  plot(x = pop_data$date,  xlab = 'year',
       y = pop_data$value, ylab = 'people', 
       main = pop_data$country[pop_data$date == max(pop_data$date)])
  dev.off()
  
  cat(paste0('Country ', 
             pop_data$country[pop_data$date == max(pop_data$date)],
             ' at year ',
             pop_data$date[pop_data$date == max(pop_data$date)],
             ' has population ', 
             pop_data$value[pop_data$date == max(pop_data$date)],
             ' people.'))  
} else {
  cat(paste0('Something wrong! No population data for country ', as.character(myArgs),
             '. Use ISO3 code'))
}

