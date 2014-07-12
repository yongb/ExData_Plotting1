# Plot 4
rm(list=ls())

# Load data
setwd("C:/Users/Yong/Google Drive/DataScience/")
hpc <- read.table("./ExData/household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

# Convert Date
head(hpc[,1])
head(hpc[,2])
hpc[,1] <- as.Date(hpc$Date,"%d/%m/%Y")

# subset the data of 2007-02-01 and 2007-02-02
sub <- subset(hpc, hpc$Date %in% as.Date(c("2007-02-01","2007-02-02")))
sub$DateTime <- strptime(paste(sub$Date, sub$Time), "%Y-%m-%d %H:%M:%S")

# Create png device
png("plot4.png", width = 480, height = 480)

# Make the plot 4
par(mfrow = c(2, 2)) 

# upleft plot
plot(sub$DateTime, as.numeric(sub$Global_active_power), type = "l",xlab="",
     ylab = "Global Active Power (kilowatts)")

# upright plot
plot(sub$DateTime, as.numeric(sub$Voltage), type="l",xlab="datetime",
     ylab="Voltage")

# downleft plot
plot(sub$DateTime, as.numeric(sub$Sub_metering_1), type="l",
     ylab="Energy Submetering", xlab="")
lines(sub$DateTime, as.numeric(sub$Sub_metering_2), type="l", col="red")
lines(sub$DateTime, as.numeric(sub$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
       col=c("black", "red", "blue"))

# downright plot
plot(sub$DateTime, as.numeric(sub$Global_reactive_power), type="l", xlab="datetime",
     ylab="Global_reactive_power")
# Close device
dev.off()
