corr <- function(directory, threshold = 0) {
    source('complete.R')
    setwd(file.path(getwd(), directory)) 
    filenames <- list.files(path = getwd()) #Find the names of the files in the
                                            #directory.
    setwd("~") #Return to our home directory.
    nrows <- complete("specdata", 1:332) #Use our function complete to find the
                                         #counts of complete cases.
    #Here we select the id's that have counts above our threshold.
    at_threshold <- nrows[(nrows$nobs>threshold)&(nrows$nobs!=0), ]
    
    #We have a loop to make a NULL vector of correlations for those not in the
    #threshold value.
    if(nrow(at_threshold)==0){
        correlations <- as.numeric(NULL)
        return(correlations)
    }
    
    #We get our list of files that satisfy the threshold condition.
    files_yes <- filenames[at_threshold$id]
    
    #Initialize our null vector.
    correlations <- NULL
    
    #Loop over our number of filenames that satisfy the threshold.
    for(i in 1:length(files_yes)){
        
        #Read in the csv;s and omit the NA values.
        setwd(file.path("~", directory))
        selectmonitors <- read.csv(files_yes[i])
        selectmonitors <- na.omit(selectmonitors)
        
        #Get our correlations for the nitrate and sulfate columns.
        sample_correlations <- cor(selectmonitors$nitrate
                                   , selectmonitors$sulfate)
        #Combine our correlations into a vector replacing the null vector.
        correlations <- c(correlations, sample_correlations)
    }
    setwd("~") #Return to our home directory.
    return(correlations) #Output our correlations vector.
}

corr("specdata", 150)