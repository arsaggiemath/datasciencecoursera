complete <- function(directory, id = 1:332) {
    
    setwd(file.path(getwd(), directory)) 
    filenames <- list.files(path = getwd()) #Find the names of the files in the
                                            #directory.
    nobs <- rep(0, length(id)) #Initialize vector of 0's the size of id vector.
    j <- 1
    #The following loop reads in the file corresponding to each entry in our
    #id vector and computes the number of rows, then stores that value in the
    #j-th position of the nobs vector.
    for (i in id) {
        selectmonitors <- read.csv(filenames[i])
        nobs[j] <- sum(complete.cases(selectmonitors))
        j <- j + 1
    }
    #We then make a data frame with the given id values and the number of rows.
    nrows <- data.frame(id, nobs)
    setwd("~") #Reset the working directory.
    return(nrows) #Return our nrows data frame.
}

complete("specdata", 3)