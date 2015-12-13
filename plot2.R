tab <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", strip.white=TRUE)
col_names <- colnames(tab)
tab <- cbind(as.Date(tab[,1], "%d/%m/%Y"), tab[,2:dim(tab)[2]])
colnames(tab) <- col_names
table_2days <- tab[(tab[,"Date"]=="2007-02-01")|(tab[,"Date"]=="2007-02-02"),]
rm(tab)

dates <- strptime(paste(table_2days[,1],table_2days[,2]), tz= "EST",format="%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "C")

png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

plot(dates,table_2days[,"Global_active_power"], type= "l", xlab= "", ylab = "Global Active Power (kilowatts)")

dev.off()
