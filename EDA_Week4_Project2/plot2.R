# These first two if statements are here so that you only have to open the file once.
if(!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.

baltimore <- NEI[NEI$fips == "24510",]
byYear <- aggregate(Emissions ~ year, data = baltimore, FUN = sum)

png('plot2.png')
barplot(height = byYear$Emissions, names.arg = byYear$year,
        xlab = "years", ylab = expression('total PM'[2.5]*' emission'),
        main = expression('Total PM'[2.5]*' for Baltimore City, MD Emissions'))
dev.off()