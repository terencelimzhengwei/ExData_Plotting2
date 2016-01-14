# Check whether data has already been loaded
if(sum(c("NEI","SCC") %in% ls())!=2)
    source("./load_data.R")

# Group by County/Year
county_data <- NEI %>%
    filter(fips=="24510") %>%
    group_by(year) %>%
    summarize(total_pm25=sum(Emissions))

png(filename = "./figures/plot2.png",bg="transparent")

plot(county_data$year,county_data$total_pm25,xlab="year",ylab="Emissions",main="Total PM2.5 Emission in Baltimore", type = "l",lwd=2)
points(county_data$year,county_data$total_pm25,xlab="year",ylab="Emissions",main="Total PM2.5 Emission in Baltimore",col="red",lwd=2)

dev.off()
