# Check whether data has already been loaded
if(sum(c("NEI","SCC") %in% ls())!=2)
    source("./load_data.R")

# Coal Related Source
motor_scc <- SCC[grep("Motor Vehicles",SCC$Short.Name,ignore.case = TRUE),]


# Group by County/Year
motor_data <- NEI %>%
    filter(fips=="24510",SCC%in%motor_scc$SCC) %>%
    group_by(year) %>%
    summarize(total_pm25=sum(Emissions))

png(filename = "./figures/plot5.png",bg="transparent")

x<- ggplot(data = motor_data, 
    aes(x=year,y=total_pm25))+
    geom_line(col = "#0072B2")+
    geom_point(col="#0072B2")+
    ggtitle("Total PM2.5 Emissions by Motor Vehicles in Baltimore")+
    ylab("Emissions")
print(x)
dev.off()
