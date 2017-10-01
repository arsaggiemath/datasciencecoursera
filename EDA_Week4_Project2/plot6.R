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

# Compare emissions from motor vehicle sources in Baltimore City with emissions from
# motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city
# has seen greater changes over time in motor vehicle emissions?

subset <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

byYearFips <- aggregate(Emissions ~ year + fips, subset, sum)
byYearFips$fips[byYearFips$fips=="24510"] <- "Baltimore, MD"
byYearFips$fips[byYearFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=840, height=480)
g <- ggplot(byYearFips, aes(factor(year), Emissions)) +
  facet_grid(. ~ fips) +
  geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Motor Vehicles (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")')
print(g)
dev.off()