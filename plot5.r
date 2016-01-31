# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2)

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC") # merge the two data sets

subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("plot5.png", width=880, height=500)

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))

g <- g +
      geom_bar(stat="identity") +
      xlab("year") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from motor vehicle in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')

print(g)

dev.off()
