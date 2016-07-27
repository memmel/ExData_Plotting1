plot4 <- function(){
	
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
	png("plot4.png", width=480, height=480, units="px")

  #create plot4
  #set 2 rows and columns
  par(mfrow=c(2,2))
    
  #create the first graph
	plot(data$Global_active_power ~ data$fullDate, type="l", ylab="Global Active Power", xlab="")
	
	#create the second graph
	plot(data$fullDate, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
	
	#create the third graph
	plot(data$Sub_metering_1 ~ data$fullDate, type="l", ylab="Energy sub metering", xlab="", col="black")
	lines(data$Sub_metering_2 ~ data$fullDate, type="l", ylab="Energy sub metering", xlab="", col="red", new=TRUE)
	lines(data$Sub_metering_3 ~ data$fullDate, type="l", ylab="Energy sub metering", xlab="", col="blue", new=TRUE)
	legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")
	
	#create the fourth graph
	plot(data$fullDate, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
   	
	#clean and close
	dev.off()
	return(cat("Plot 4 created as plot4.png", "\n"))
}	
	


     
    
