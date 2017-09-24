
filepaths<-list.files(path="Data/htm", full.names=TRUE)

filepaths[8]

#MPDE are 5 and 8
ClassCShip1 <- read.csv(filepaths[5], header=TRUE, sep=",")
ClassCShip2 <- read.csv(filepaths[8], header=TRUE, sep=",")

#colnames(MyData)

SortedData <- ClassCShip1[order(ClassCShip1$DateTime),]

as.POSIXct("9/30/2016 10:38:04 AM",tz="","$m/%d/%Y %I:%M:%S %p")

strptime("9/30/2016 10:38:04 AM","$m/%d/%Y %I:%M:%OS %p")


par(mfrow=c(2,2))
plot(ClassCShip1$X1A.FUEL.SPLY.FLOW,ClassCShip1$X1A.FUEL.RTN.FLOW,xlim=c(0,15),ylim=c(0,10))
plot(ClassCShip1$X1B.FUEL.SPLY.FLOW,ClassCShip1$X1B.FUEL.RTN.FLOW,xlim=c(0,15),ylim=c(0,10))
plot(ClassCShip1$X2A.FUEL.SPLY.FLOW,ClassCShip1$X2A.FUEL.RTN.FLOW,xlim=c(0,15),ylim=c(0,10))
plot(ClassCShip1$X2B.FUEL.SPLY.FLOW,ClassCShip1$X2B.FUEL.RTN.FLOW,xlim=c(0,15),ylim=c(0,10))
plot(ClassCShip2$X1A.FUEL.RACK,ClassCShip2$X1A.FUEL.SPLY.FLOW)
plot(ClassCShip2$X1B.FUEL.RACK,ClassCShip2$X1B.FUEL.SPLY.FLOW)
plot(ClassCShip2$X2A.FUEL.RACK,ClassCShip2$X2A.FUEL.SPLY.FLOW)
plot(ClassCShip2$X2B.FUEL.RACK,ClassCShip2$X2B.FUEL.SPLY.FLOW)

#par(mfrow=c(2,2))
#plot(ClassCShip1$X1A.RKR.ARM.PMP.DIS.PRES,ClassCShip1$X1A.FUEL.SPLY.FLOW-ClassCShip1$X1A.FUEL.RTN.FLOW)
#plot(ClassCShip1$X1B.RKR.ARM.PMP.DIS.PRES,ClassCShip1$X1B.FUEL.SPLY.FLOW-ClassCShip1$X1B.FUEL.RTN.FLOW)
#plot(ClassCShip1$X2A.RKR.ARM.PMP.DIS.PRES,ClassCShip1$X2A.FUEL.SPLY.FLOW-ClassCShip1$X2A.FUEL.RTN.FLOW)
#plot(ClassCShip1$X2B.RKR.ARM.PMP.DIS.PRES,ClassCShip1$X2B.FUEL.SPLY.FLOW-ClassCShip1$X2B.FUEL.RTN.FLOW)
plot(ClassCShip2$X1A.ENGINE.SPEED,ClassCShip2$X1A.FUEL.SPLY.FLOW-ClassCShip2$X1A.FUEL.RTN.FLOW,xlim=c(0,650),ylim=c(-1,15),pch=".",xlab="Engine Speed",ylab="Fuel Usage (Supply Flow - Return Flow)",main="MPDE - X1A")
#plot(ClassCShip2$X1B.ENGINE.SPEED,ClassCShip2$X1B.FUEL.SPLY.FLOW-ClassCShip2$X1B.FUEL.RTN.FLOW,xlim=c(0,650),ylim=c(-1,15),pch=".",xlab="Engine Speed",ylab="Fuel Usage (Supply Flow - Return Flow)",main="MPDE - X1B")
#plot(ClassCShip2$X2A.ENGINE.SPEED,ClassCShip2$X2A.FUEL.SPLY.FLOW-ClassCShip2$X2A.FUEL.RTN.FLOW,xlim=c(0,650),ylim=c(-1,15),pch=".",xlab="Engine Speed",ylab="Fuel Usage (Supply Flow - Return Flow)",main="MPDE - X2A")
#plot(ClassCShip2$X2B.ENGINE.SPEED,ClassCShip2$X2B.FUEL.SPLY.FLOW-ClassCShip2$X2B.FUEL.RTN.FLOW,xlim=c(0,650),ylim=c(-1,15),pch=".",xlab="Engine Speed",ylab="Fuel Usage (Supply Flow - Return Flow)",main="MPDE - X2B")

enginespeeds<-ClassCShip2[c("X1A.ENGINE.SPEED","X1B.ENGINE.SPEED","X2A.ENGINE.SPEED","X2B.ENGINE.SPEED")]
fofdp<-ClassCShip2[c("X1A.FO.FILTER.DP","X1B.FO.FILTER.DP","X2A.FO.FILTER.DP","X2B.FO.FILTER.DP")]
na_count <- apply(enginespeeds, 1, function(x) sum(is.na(x)))
running_speed <- apply(enginespeeds, 1, function(x) sum(x,na.rm=TRUE))
op_dp <- apply(fofdp, 1, function(x) sum(x,na.rm=TRUE))
plot(running_speed)

dim(ClassCShip1[running_speed<500,])

#plot(ClassCShip1$X1A.CYL.12.EXHAUST.TEMP,ClassCShip1$X1A.CYL.2.EXHAUST.TEMP)

par(mfrow=c(2,2))
hist(ClassCShip1$X1A.ENGINE.SPEED,xlim=c(0,600),breaks=10)
hist(ClassCShip1$X2A.ENGINE.SPEED,xlim=c(0,600),breaks=10)
hist(ClassCShip1$X1B.ENGINE.SPEED,xlim=c(0,600),breaks=10)
hist(ClassCShip1$X2B.ENGINE.SPEED,xlim=c(0,600),breaks=10)

par(mfrow=c(2,2))
hist(ClassCShip1$X1A.FUEL.RACK,xlim=c(0,60),breaks=10)
hist(ClassCShip1$X2A.FUEL.RACK,xlim=c(0,60),breaks=10)
hist(ClassCShip1$X1B.FUEL.RACK,xlim=c(0,60),breaks=10)
hist(ClassCShip1$X2B.FUEL.RACK,xlim=c(0,60),breaks=10)

n<-22000
slow1<-ClassCShip2[0:n,]
fast1<-ClassCShip2[n:dim(ClassCShip2)[1],]



#par(mfrow=c(2,2))
#plot(ClassCShip2$X1A.FUEL.RACK,ClassCShip2$X1A.FUEL.SPLY.FLOW-ClassCShip2$X1A.FUEL.RTN.FLOW)
#plot(ClassCShip2$X2A.FUEL.RACK,ClassCShip2$X2A.FUEL.SPLY.FLOW-ClassCShip2$X2A.FUEL.RTN.FLOW)
#plot(ClassCShip2$X1B.FUEL.RACK,ClassCShip2$X1B.FUEL.SPLY.FLOW-ClassCShip2$X1B.FUEL.RTN.FLOW)
#plot(ClassCShip2$X2B.FUEL.RACK,ClassCShip2$X2B.FUEL.SPLY.FLOW-ClassCShip2$X2B.FUEL.RTN.FLOW)
#plot(slow1$X1A.FUEL.RACK,slow1$X1A.FUEL.SPLY.FLOW-slow1$X1A.FUEL.RTN.FLOW,xlim=c(0,55),ylim=c(0,16),col="blue",pch=".")
#par(new=TRUE)
#plot(fast1$X1A.FUEL.RACK,fast1$X1A.FUEL.SPLY.FLOW-fast1$X1A.FUEL.RTN.FLOW,xlim=c(0,55),ylim=c(0,16),col="red",ann= FALSE,pch=".")

#plot(slow1$X1B.FUEL.RACK,slow1$X1B.FUEL.SPLY.FLOW-slow1$X1B.FUEL.RTN.FLOW,xlim=c(0,55),ylim=c(0,16),col="blue",pch=".")
#par(new=TRUE)
#plot(fast1$X1B.FUEL.RACK,fast1$X1B.FUEL.SPLY.FLOW-fast1$X1B.FUEL.RTN.FLOW,xlim=c(0,55),ylim=c(0,16),col="red",ann= FALSE,pch=".")

#plot(slow1$X2A.FUEL.RACK,slow1$X2A.FUEL.SPLY.FLOW-slow1$X2A.FUEL.RTN.FLOW,xlim=c(0,55),ylim=c(0,16),col="blue",pch=".")
#par(new=TRUE)
#plot(fast1$X2A.FUEL.RACK,fast1$X2A.FUEL.SPLY.FLOW-fast1$X2A.FUEL.RTN.FLOW,xlim=c(0,55),ylim=c(0,16),col="red",ann= FALSE,pch=".")


plot(slow1$X2B.FUEL.RACK,slow1$X2B.FUEL.SPLY.FLOW-slow1$X2B.FUEL.RTN.FLOW,xlim=c(0,55),ylim=c(0,16),col="blue",pch=".",title="",xlab="Fuel Rack Position",ylab="Fuel Usage (Supply Flow - Return Flow)")
par(new=TRUE)
plot(fast1$X2B.FUEL.RACK,fast1$X2B.FUEL.SPLY.FLOW-fast1$X2B.FUEL.RTN.FLOW,xlim=c(0,55),ylim=c(0,16),col="red",ann= FALSE,pch=".")

ClassCShip2[22000,]$DateTime

length(ClassCShip2)

par(mfrow=c(2,2))
plot(ClassCShip2$X1A.FUEL.RACK,ClassCShip2$X1A.FUEL.SPLY.FLOW,ylim=c(5,20),pch=".",xlab="Fuel Rack Position",ylab="Fuel Supply Flow",main="MPDE - X1A")
plot(ClassCShip2$X1B.FUEL.RACK,ClassCShip2$X1B.FUEL.SPLY.FLOW,ylim=c(5,20),pch=".",xlab="Fuel Rack Position",ylab="Fuel Supply Flow",main="MPDE - X2B")
plot(ClassCShip2$X2A.FUEL.RACK,ClassCShip2$X2A.FUEL.SPLY.FLOW,ylim=c(5,20),pch=".",xlab="Fuel Rack Position",ylab="Fuel Supply Flow",main="MPDE - X1B")
plot(ClassCShip2$X2B.FUEL.RACK,ClassCShip2$X2B.FUEL.SPLY.FLOW,ylim=c(5,20),pch=".",xlab="Fuel Rack Position",ylab="Fuel Supply Flow",main="MPDE - X2B")

typeof(op_dp)

nums<-ClassCShip1[c("X1A.FO.HEADER.PRES","X1A.FUEL.SPLY.FLOW","X1A.FUEL.RTN.FLOW","X1A.FUEL.RACK", "X1A.R.BANK.AIR.PRES","X1A.L.BANK.AIR.PRES","X1A.R.T.C.SPEED","X1A.ENGINE.SPEED")]
nums[]

covShip1<-cor(na.omit(nums))

covShip1

nums[1:100,]
