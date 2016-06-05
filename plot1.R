# R code to read in the household data and create plot 1

# Read in the data
file <- './exdata-data-household_power_consumption/household_power_consumption.txt'
data <- read.csv(file, header=T, sep=';', na.strings='?')

# Convert the dates so they are easy to subset
data$Date <- as.Date(data$Date, '%d/%m/%Y')
#Subset the dates
data_sub <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')

# Initialize the graphics device (using PNG as intstructed)
png(filename='plot1.png', width=480, height=480)

# Build the graph (red bars, changed title and x label to match the assignment)
hist(data_sub$Global_active_power, 
     col='red', 
     main='Global Active Power', 
     xlab='Global Active Power (kilowatts)')
# Turn off the graphics device or else babies will die
dev.off()