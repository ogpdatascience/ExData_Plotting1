tab <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", strip.white=TRUE)
col_names <- colnames(tab)
tab <- cbind(as.Date(tab[,1], "%d/%m/%Y"), tab[,2:dim(tab)[2]])
colnames(tab) <- col_names
table_2days <- tab[(tab[,"Date"]=="2007-02-01")|(tab[,"Date"]=="2007-02-02"),]
rm(tab)

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

hist(table_2days[,"Global_active_power"], xlab="Global active power (kilowatts)", ylab = "Frequency", col= "red", main = "Histogram of global active power" )

dev.off()
