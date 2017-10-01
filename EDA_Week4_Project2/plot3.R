library(ggplot2)

# These first two if statements are here so that you only have to open the file once.
if(!exists("NEI")){
  NEI <- readRDS("./summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./Source_Classification_Code.rds")
}

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999-2008
# for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the
# ggplot2 plotting system to make a plot answer this question.

baltimore  <- NEI[NEI$fips=="24510",]
byYearType <- aggregate(Emissions ~ year + type, baltimore, sum)

png('plot3.png', width = 640, height = 480)
g <- ggplot(byYearType, aes(year, Emissions, color = type)) +
  geom_line() +
  xlab("year") +
  ylab(expression('total PM'[2.5]*" emissions")) +
  ggtitle('Total Emissions in Baltimore City, MD from 1999 to 2008')
print(g)
dev.off()