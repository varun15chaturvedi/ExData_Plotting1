# Loading Data from dataset and only keeping data related to dates
# "2007-02-01" and "2007-02-02"

data<- read.table('household_power_consumption.txt',sep = ';',header = T)
data$Date<- as.Date(data$Date,'%d/%m/%Y')
rows<- (data$Date>="2007-02-01" & data$Date<= "2007-02-02")
data<- data[rows,]
remove(rows)


#opening Graphic Device 

png(filename ='plot1.png',height = 480,width = 480)
data$Global_active_power<- as.numeric(data$Global_active_power)/500
hist(data$Global_active_power,xlab ='Global Active Power(Kilowatts)',col = 'red',main = 'Global Active Power')
dev.off()

