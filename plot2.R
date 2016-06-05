# R code to read in the household data and create plot 2

# Read in the data
file <- './exdata-data-household_power_consumption/household_power_consumption.txt'
data <- read.csv(file, header=T, sep=';', na.strings='?')

# Convert the dates so they are easy to subset
data$Date <- as.Date(data$Date, '%d/%m/%Y')
# Subset the dates
data_sub <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')

# Combine the Date and Time cols into one
data_sub$date_plus_time <- paste(data_sub$Date, data_sub$Time)
# Convert the Time col to a time class
data_sub$date_plus_time <- strptime(data_sub$date_plus_time, 
                                    format = '%Y-%m-%d %H:%M:%S')

# Initialize the graphics device (using PNG as intstructed)
png(filename='plot2.png', width=480, height=480)

# Build the graph, type 'l' for line graph
plot(data_sub$date_plus_time, data_sub$Global_active_power, 
     type='l', 
     xlab='',
     ylab='Global Active Power (kilowatts)')

# Turn off the graphics device or else babies will die
dev.off()