# Check whether data has already been loaded
if(sum(c("NEI","SCC") %in% ls())!=2)
    source("./load_data.R")

# Coal Related Source
coal_scc <- SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),]


# Group by County/Year
coal_data <- NEI %>%
    filter(SCC%in%coal_scc$SCC) %>%
    group_by(year) %>%
    summarize(total_pm25=sum(Emissions))

png(filename = "./figures/plot4.png",bg="transparent")

x<- ggplot(data = coal_data, 
    aes(x=year,y=total_pm25))+
    geom_line(col = "#CC79A7")+
    geom_point(col="#CC79A7")+
    ggtitle("Total PM2.5 Emissions by coal in the US")+
    ylab("Emissions")
print(x)
dev.off()
