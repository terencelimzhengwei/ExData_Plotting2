# Check whether data has already been loaded
if(sum(c("NEI","SCC") %in% ls())!=2)
    source("./load_data.R")

# Group by County/Year
type_data <- NEI %>%
    filter(fips=="24510") %>%
    group_by(year,type) %>%
    summarize(total_pm25=sum(Emissions))

png(filename = "./figures/plot3.png",bg="transparent")

x<- ggplot(data = type_data, 
        aes(x=year,y=total_pm25,
        col=type))+
        geom_line()+
        geom_point()+
        ggtitle("Total PM2.5 Emissions by type in Baltimore")+
        ylab("Emissions")
print(x)
dev.off()
