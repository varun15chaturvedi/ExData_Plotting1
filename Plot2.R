library(lubridate)
# Loading Data from dataset and only keeping data related to dates
# "2007-02-01" and "2007-02-02"

data<- read.table('household_power_consumption.txt',sep = ';',header = T)
data$Date<- as.Date(data$Date,'%d/%m/%Y')
rows<- (data$Date>="2007-02-01" & data$Date<= "2007-02-02")
data<- data[rows,]
remove(rows)

#opening Graphic Device 

data$Global_active_power<- as.numeric(data$Global_active_power)/500
temp<- paste(data$Date,data$Time,sep = ' ')
temp<- strptime(temp,"%Y-%m-%d %H:%M:%S")
png(filename ='plot2.png',height = 480,width = 480 )
plot(temp, data$Global_active_power,pch ='|',ylab = 'Global Active Power(Kilowatts)',xlab ='',type = 'l' )
dev.off()
