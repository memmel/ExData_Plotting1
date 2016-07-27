plot2 <- function(){
	
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
	png("plot2.png", width=480, height=480, units="px")

	#create plot2
	plot(data$Global_active_power ~ data$fullDate, type="l", ylab="Global Active Power (kilowatts)", xlab="")
	  	
	#clean and close
	dev.off()
	return(cat("Plot 2 created as plot2.png", "\n"))
}	
	




    
    
