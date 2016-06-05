# R code to read in the household data and create plot 3

# Read in the data
file <- './exdata-data-household_power_consumption/household_power_consumption.txt'
data <- read.csv(file, header=T, sep=';', na.strings='?')

# Convert the dates so they are easy to subset
data$Date <- as.Date(data$Date, '%d/%m/%Y')
# Subset the dates
data_sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Combine the Date and Time cols into one
data_sub$date_plus_time <- paste(data_sub$Date, data_sub$Time)
# Convert the Time col to a time class
data_sub$date_plus_time <- strptime(data_sub$date_plus_time, 
                                    format = "%Y-%m-%d %H:%M:%S")

# Initialize the graphics device (using PNG as intstructed)
png(filename='plot3.png', width=480, height=480)

# Build the base graph
plot(data_sub$date_plus_time, 
     data_sub$Sub_metering_1,
     type='l', 
     xlab='',
     ylab='Energy sub metering')
# Create the other 2 sub metering lines over the top
lines(data_sub$date_plus_time,
      data_sub$Sub_metering_2,
      type='l', col='red')
lines(data_sub$date_plus_time,
      data_sub$Sub_metering_3,
      type='l', col='blue')
# Finally, create the legened
legend('topright',
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=1,
       col=c('black', 'red', 'blue'))

# Turn off the graphics device or else babies will die
dev.off()