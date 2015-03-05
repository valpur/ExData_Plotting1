
plot1 <- function() {
  # Create date type
  setClass('myDate');
  setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") );
  # Load data
  data <- subset(read.table("hpc.txt",header = TRUE,sep = ";",na.strings="?", colClasses=c("myDate","character",rep("numeric",7))), Date == "2007-02-01" |  Date == "2007-02-02" );  
  # create date-time column
  data$DateTime<-strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
  # Generate device
  png(file = "plot1.png", width = 480, height = 480);
  # Generate Histogram
  hist(data$Global_active_power,main = "Global Active Power", col = "red", xlab="Global Active Power (Kilowatts)");
  # Close device
  dev.off();
}