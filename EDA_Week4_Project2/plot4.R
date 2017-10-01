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

# Across the United States, how have emissions from coal combustion-related sources
# changed from 1999-2008?

searchCoal <- grepl("coal", combined$Short.Name, ignore.case=TRUE)
coal <- combined[searchCoal, ]
byYear <- aggregate(Emissions ~ year, coal, sum)

png('plot4.png', width=640, height=480)
g <- ggplot(byYear, aes(factor(year), Emissions)) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Coal from 1999 to 2008')
print(g)
dev.off()