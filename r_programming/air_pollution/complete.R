convert_to_station_file <- function(number){
  # This function will prepend or pad 0's upon a given number
  if (number < 10){station_id <- paste0("00", number)}
  else if (number < 100 && number > 9){station_id <- paste0("0", number)}
  else if (number < 1000 && number > 99){station_id <- number}
  file_name <- paste(station_id,".csv", sep="")
  file_name
}

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  old.dir <- getwd()
  setwd(directory)
  i <- 1
  nobs <- vector("numeric", length=length(id))
  for(station in id){
    file_name <- convert_to_station_file(station)
    data <- read.csv(file_name)
    complete_cases <- complete.cases(data)
    complete_data <- data[complete_cases, ]
    nobs[i] <- nrow(complete_data)
    i <- i + 1
  }
  completely_observed_cases <- data.frame(id = id, nobs = nobs)
  setwd(old.dir)
  completely_observed_cases
}