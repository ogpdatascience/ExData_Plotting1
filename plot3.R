tab <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", strip.white=TRUE)
col_names <- colnames(tab)
tab <- cbind(as.Date(tab[,1], "%d/%m/%Y"), tab[,2:dim(tab)[2]])
colnames(tab) <- col_names
table_2days <- tab[(tab[,"Date"]=="2007-02-01")|(tab[,"Date"]=="2007-02-02"),]
rm(tab)

dates <- strptime(paste(table_2days[,1],table_2days[,2]), tz= "EST",format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "C")

png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

plot(dates,table_2days[,"Sub_metering_1"], type= "n",  xlab= "", ylab = "Energy sub metering")
points(dates,table_2days[,"Sub_metering_1"], type = "l", col = "black")
points(dates,table_2days[,"Sub_metering_2"], type = "l", col = "red")
points(dates,table_2days[,"Sub_metering_3"], type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"), text.col= c("black","red","blue"))

dev.off()

