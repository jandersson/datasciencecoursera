convert_to_station_file <- function(number){
  # This function will prepend or pad 0's upon a given number
  if (number < 10){station_id <- paste0("00", number)}
  else if (number < 100 && number > 9){station_id <- paste0("0", number)}
  else if (number < 1000 && number > 99){station_id <- number}
  file_name <- paste(station_id,".csv", sep="")
  file_name
}

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  cases <- complete(directory)
  meets_threshold <- cases$nobs > threshold
  filtered_cases <- cases[meets_threshold, ]
  old.dir <- getwd()
  setwd(directory)
  corr <- vector("numeric", length=length(filtered_cases$id))
  i <- 1
  for(case in filtered_cases$id){
    file_name <- convert_to_station_file(case)
    data <- read.csv(file_name)
    complete_cases <- complete.cases(data)
    complete_data <- data[complete_cases, ]
    corr[i] <- cor(complete_data$sulfate, complete_data$nitrate)
    i <- i + 1
  }
  setwd(old.dir)
  corr
}
