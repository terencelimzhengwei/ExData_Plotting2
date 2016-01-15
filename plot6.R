# Check whether data has already been loaded
if(sum(c("NEI","SCC") %in% ls())!=2)
    source("./load_data.R")

# Coal Related Source
motor_scc <- SCC[grep("Vehicle", SCC$EI.Sector ,ignore.case = TRUE),]

# Group by County/Year
motor_data <- NEI %>%
    filter(SCC %in%motor_scc$SCC) %>%
    filter(fips=="24510"|fips=="06037") %>%
    group_by(fips,year) %>%
    summarize(total_pm25=sum(Emissions))

motor_data$fips[motor_data$fips=="24510"]="Baltimore City"
motor_data$fips[motor_data$fips=="06037"]="Los Angeles County"


png(filename = "./figures/plot6.png",bg="transparent")

x<- ggplot(data = motor_data, 
           aes(x=year,y=total_pm25,col=fips))+
    geom_line()+
    geom_point()+
    ggtitle("Total PM2.5 Emissions by Motor Vehicles")+
    ylab("Emissions")+
    facet_grid(fips~.,scales="free")
print(x)
dev.off()
