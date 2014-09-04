if (!file.exists("Exploratory Data Analysis")){
        dir.create("Exploratory Data Analysis")
}
if (!file.exists("Exploratory Data Analysis/Electric power consumption.zip")){
        # Download the data if it has not been downloaded before
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = "Exploratory Data Analysis/Electric power consumption.zip")
}
# Unzip the downloaded file
unzip("Exploratory Data Analysis/Electric power consumption.zip", exdir = "Exploratory Data Analysis")

text <- read.table("Exploratory Data Analysis/household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880)
colnames(text) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

png("Exploratory Data Analysis/plot1.png", width = 480, height = 480)
hist(text$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red",main="Global Active Power")
dev.off()