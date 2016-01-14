# Check whether data has already been loaded
if(sum(c("NEI","SCC") %in% ls())!=2)
    source("./load_data.R")
   
# Group data by year
year_data <- NEI %>%
    group_by(year) %>%
    summarize(total_pm25=sum(Emissions))

png(filename = "./figures/plot1.png",bg="transparent")

plot(year_data$year,year_data$total_pm25,xlab="year",ylab="Emissions",main="Total PM2.5 Emission in the US", type = "l",lwd=2)
points(year_data$year,year_data$total_pm25,xlab="year",ylab="Emissions",main="Total PM2.5 Emission in the US",col="red",lwd=2)

dev.off()