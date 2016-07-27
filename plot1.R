plot1 <- function(){
	
	#download needed libraries
	library("dplyr")
	library("lubridate")
	
	#read text file into the data variable
	data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", rep("numeric",7)))
		
	#convert date to proper format
	data$Date<-as_date(data$Date, "%d/%m/%Y")
	
	#filter to the dates we are interested in
	data<-filter(data, Date=="2007-02-01"|Date=="2007-02-02")
	
	#save as .png file of 480X480 pixels
	png("plot1.png", width=480, height=480, units="px")

	#create a histogram of the frequency of Global Active Power
	hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
	
	#clean and close
	dev.off()
	return(cat("Plot 1 created as plot1.png", "\n"))
}	
	
