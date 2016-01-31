# Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")# merge the two data sets

subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",]

aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1080, height=500)

g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g +
      geom_bar(stat="identity")  +
      xlab("year") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from motor vehicle in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037") in 1999-2008')

print(g)

dev.off()
