# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

library(ggplot2)

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)



png("plot4.png", width=680, height=500)

g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g +
      geom_bar(stat="identity") +
      xlab("year") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle('Total Emissions from coal sources from 1999 to 2008')

print(g)

dev.off()
