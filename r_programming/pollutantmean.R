convert_to_station_file <- function(number){
  # This function will prepend or pad 0's upon a given number
  if (number < 10){station_id <- paste0("00", number)}
  if (number < 100 && number > 9){station_id <- paste0("0", number)}
  if (number < 1000 && number > 99){station_id <- number}
  file_name <- paste(station_id,".csv", sep="")
  file_name
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  old.dir <- getwd()
  setwd(directory)
  mean_vec <- vector("numeric", length=length(id))
  for(single_id in id){
    file_name <- convert_to_station_file(id[single_id])
    print(file_name)
    if(file.exists(file_name)){data <- read.csv(file_name)}
    if(pollutant == "sulfate"){
      nas <- is.na(data$sulfate)
      sulfate <- data$sulfate[!nas]
      avg_sulfate <- mean(sulfate)
      mean_vec[single_id] <- avg_sulfate
    }
  }
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
#   if(pollutant == "sulfate"){
#     print("calculate sulfate mean")
#     nas <- is.na(data$sulfate)
#     sulfates <- data$sulfate[!nas]
#     avg_sulfates[] <- mean(sulfates)
#   }
#   else if(pollutant == "nitrate"){
#     print("calculate the nitrate mean")
#     nas <- is.na(data$nitrate)
#   }
#   else{
#     print("not a valid pollutant")
#   }
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
#   | These sorts of functions are excessive for interactive use. But, if you are running a program that loops
#   | through a series of files and does some processing on each one, you will want to check to see that each
#   | exists before you try to process it.
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  setwd(old.dir)
  mean(mean_vec)
}
