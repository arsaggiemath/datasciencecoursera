library(ggplot2)

# These first two if statements are here so that you only have to open the file once.
if(!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}
if(!exists("combined")) {
  combined <- merge(NEI, SCC, by="SCC")
}

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

subset <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",  ]
byYear <- aggregate(Emissions ~ year, subset, sum)

png('plot5.png', width=640, height=480)
g <- ggplot(byYear, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Motor Vehicles (type = ON-ROAD) in Baltimore City, MD (fips = "24510")')
print(g)
dev.off()