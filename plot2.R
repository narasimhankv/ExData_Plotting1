# Create URL location

dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# Download file to working directory

download.file(dataset_url, "power.zip")

# Unzip file to folder

unzip("power.zip", exdir = "power")

# Read file

power <- read.table("./power/household_power_consumption.txt",header=T,sep=";")


#  formats  as date and time

power$Date <- as.Date(power$Date, format="%d/%m/%Y")


datetime <- paste(as.Date(power$Date), power$Time)

power$Datetime <- as.POSIXct(datetime)


# Subset dates

power_new <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create plot

plot(power_new$Global_active_power~power_new$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")


# Save
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()





