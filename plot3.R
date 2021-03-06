plot3 <- function() {
  # Create date type
  setClass('myDate');
  setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") );
  # Load data
  data <- subset(read.table("hpc.txt",header = TRUE,sep = ";",na.strings="?", colClasses=c("myDate","character",rep("numeric",7))), Date == "2007-02-01" |  Date == "2007-02-02" );  
  # create date-time column
  data$DateTime<-strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
  # Generate device
  png(file = "plot3.png", width = 480, height = 480);
  # Generate Plot
  plot(data$DateTime,c(data$Sub_metering_1), type="l", ylab=",Energy sub metering", xlab="", ylim = c(0, 38));
  par(new=T);
  plot(data$DateTime,c(data$Sub_metering_2), type="l", ylab=",Energy sub metering", xlab="", axes=F, ylim = c(0, 38),  col = "red");
  par(new=T);
  plot(data$DateTime,c(data$Sub_metering_3), type="l", ylab=",Energy sub metering", xlab="", axes=F, ylim = c(0, 38), col = "blue");
  legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"));
  
  # Close device
  dev.off();
}