# Total emissions from PM2.5 in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

subsetNEI  <- NEI[NEI$fips=="24510",]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png');

barplot(
      height=aggregatedTotalByYear$Emissions,
      names.arg=aggregatedTotalByYear$year,
      xlab="years", ylab=expression('total PM'[2.5]*' emission'),
      main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions by year'),
      col="red"
      );

dev.off()
