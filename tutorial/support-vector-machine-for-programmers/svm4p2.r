# SVM for Programmers part 2 codes
dat <- read.table("body.data", header=TRUE)
dat$Gender <- factor(dat$Gender)
plot(dat[,c(4,1)], pch=c(1,4)[dat[,5]], col=c("green","red")[dat[,5]])

library(e1071)
m1 <- svm(Gender~Height+Average, data=dat, kernel='linear')
plot(m1, data=dat[,c(1,4,5)], svSymbol=2, dataSymbol=1)