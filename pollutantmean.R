pollutantmean <- function(directory, pollutant, id = 1:332) {
    #Set the current working directory
    setwd(file.path(getwd(), directory)) 
    filenames <- list.files(path = getwd()) #Find the names of the files in the
                                            #directory.
    filenames <- filenames[id] #Select the files corresponding to id variable.
    #Read in the csv's corresponding to the filenames.
    selectmonitors <- lapply(filenames, read.csv, header = TRUE)
    #Use rbind to create one data frame to work from.
    combinemonitors <- do.call(rbind, selectmonitors) 
    #Calculate the mean where NA values are ignored.
    means <- mean(combinemonitors[, pollutant], na.rm = TRUE)
    setwd("~") #Reset the working directory.
    return(means) #Return our vector of means.
}

pollutantmean("specdata", "nitrate", 23)