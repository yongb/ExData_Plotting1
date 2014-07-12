# Exploratory Data Analysis
# Plot 1
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
str(sub)

# Create png device
png("plot1.png", width = 480, height = 480)
# Make the plot 1
hist(as.numeric(sub$Global_active_power), col="red", 
     main = "Global Active Power",xlab="Global Active Power (kilowatts)")

# Close device
dev.off()
