# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=aggregatedTotalByYear$Emissions,
      names.arg=aggregatedTotalByYear$year,
      xlab="years",
      ylab=expression('total PM'[2.5]*' emission'),
      main=expression('Total PM'[2.5]*' emissions by year'),
      col="red"
      )

dev.off()
