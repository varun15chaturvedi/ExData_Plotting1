# Loading Data from dataset and only keeping data related to dates
# "2007-02-01" and "2007-02-02"

data<- read.table('household_power_consumption.txt',sep = ';',header = T,)
data$Date<- as.Date(data$Date,'%d/%m/%Y')
rows<- (data$Date>="2007-02-01" & data$Date<= "2007-02-02")
data<- data[rows,]
remove(rows)

#opening Graphic Device 
temp<- paste(data$Date,data$Time,sep = ' ')
temp<- strptime(temp,"%Y-%m-%d %H:%M:%S")
data$Sub_metering_1<- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<- as.numeric(as.character(data$Sub_metering_3))
png(filename ='plot3.png' ,height = 480,width = 480)
plot(temp,data$Sub_metering_1,pch ="|",type = "l",xlab = "",ylab = "Energy sub metering",col= "black",ygap.axis = 5)
points(temp,data$Sub_metering_2,pch ="|",type = "l",col= "red")
points(temp,data$Sub_metering_3,pch ="|",type = "l",col= "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),pch = c("_","_","_"),seg.len = 3)
dev.off()
