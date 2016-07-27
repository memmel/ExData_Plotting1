plot3 <- function(){
	
	#download needed libraries
	library("dplyr")
	library("lubridate")
	
	#read text file into the data variable
	data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", rep("numeric",7)))
		
	#convert date to proper format
	data$Date<-as_date(data$Date, "%d/%m/%Y")
	
	#filter to the dates we are interested in
	data<-filter(data, Date=="2007-02-01"|Date=="2007-02-02")
	
	#combine the date and time column for the graph
	data<-mutate(data, fullDate=ymd_hms(paste(data$Date, " ", data$Time)))
	
	#save as .png file of 480X480 pixels
	png("plot3.png", width=480, height=480, units="px")

	#create plot3
	plot(data$Sub_metering_1 ~ data$fullDate, type="l", ylab="Energy sub metering", xlab="", col="black")
    lines(data$Sub_metering_2 ~ data$fullDate, type="l", ylab="Energy sub metering", xlab="", col="red", new=TRUE)
    lines(data$Sub_metering_3 ~ data$fullDate, type="l", ylab="Energy sub metering", xlab="", col="blue", new=TRUE)
    legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")
    	
	#clean and close
	dev.off()
	return(cat("Plot 3 created as plot3.png", "\n"))
}	
	




    
    
