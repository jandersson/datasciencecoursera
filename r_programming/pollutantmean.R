convert_to_station_file <- function(number){
  # This function will prepend or pad 0's upon a given number
  if (number < 10){station_id <- paste0("00", number)}
  else if (number < 100 && number > 9){station_id <- paste0("0", number)}
  else if (number < 1000 && number > 99){station_id <- number}
  file_name <- paste(station_id,".csv", sep="")
  file_name
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  old.dir <- getwd()
  setwd(directory)
  #Create empty vectors with a size equal to the length of the id vector
  points_vec <- vector("numeric", length=length(id))
  sum_vec <- vector("numeric", length=length(id))
  id_len <- length(id)
  i <- 1
  for(single_id in id){
    file_name <- convert_to_station_file(single_id)
    if(file.exists(file_name)){data <- read.csv(file_name)}
    if(pollutant == "sulfate"){
      nas <- is.na(data$sulfate)
      sulfate <- data$sulfate[!nas]
      sum_vec[i] <- sum(data$sulfate[!nas])
      points_vec[i] <- length(sulfate)
    }
    else if(pollutant == "nitrate"){
      nas <- is.na(data$nitrate)
      nitrate <- data$nitrate[!nas]
      sum_vec[i] <- sum(data$nitrate[!nas])
      points_vec[i] <- length(nitrate)
    }
    i <- i + 1
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
  points_sum <- sum(points_vec)
  sum_of_sums <- sum(sum_vec)
  sum_of_sums/points_sum
}
