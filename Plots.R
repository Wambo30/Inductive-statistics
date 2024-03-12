## Plots
#####################################

f.theta  <- function(x, theta){
    f <- rep(NULL,length(x))
    f[x==-1]  <- 2*theta*(1-theta)
    f[x== 0]  <- theta^2
    f[x== 1]  <- (1-theta)^2
    return(f)
}

x <- c(-1:1); xlim <- c(-2,2)
par(mfrow=c(3,1))
theta <- 0.3; titel <- paste("theta =",theta)
plot(x,f.theta(x,theta),xlim=xlim,ylim=c(0,1),type="h",col="blue",lwd=3,main=titel)
theta <- 0.5; titel <- paste("theta =",theta)
plot(x,f.theta(x,theta),xlim=xlim,ylim=c(0,1),type="h",col="blue",lwd=3,main=titel)
theta <- 0.7; titel <- paste("theta =",theta)
plot(x,f.theta(x,theta),xlim=xlim,ylim=c(0,1),type="h",col="blue",lwd=3,main=titel)
par(mfrow=c(1,1))

    
## Aufgabe 2/3
#####################################

n <- c(10,300,2000,50000)

par(mfrow=c(2,2))
nn <- n[1]; x <- sample(0:1,nn,replace=TRUE)
barplot(table(x),main=paste("n =",nn))
nn <- n[2]; x <- sample(0:1,nn,replace=TRUE)
barplot(table(x),main=paste("n =",nn))
nn <- n[3]; x <- sample(0:1,nn,replace=TRUE)
barplot(table(x),main=paste("n =",nn))
nn <- n[4]; x <- sample(0:1,nn,replace=TRUE)
barplot(table(x),main=paste("n =",nn))
par(mfrow=c(1,1))


## Aufgabe 2/5
#####################################


## (a)
n <- c(10,300,2000,50000)
par(mfrow=c(2,2))
nn <- n[1]; x1 <- sample(0:1,nn,replace=TRUE); x2 <- sample(0:1,nn,replace=TRUE)
s <- x1+x2; barplot(table(s),main=paste("n =",nn))
nn <- n[2]; x1 <- sample(0:1,nn,replace=TRUE); x2 <- sample(0:1,nn,replace=TRUE)
s <- x1+x2; barplot(table(s),main=paste("n =",nn))
nn <- n[3]; x1 <- sample(0:1,nn,replace=TRUE); x2 <- sample(0:1,nn,replace=TRUE)
s <- x1+x2; barplot(table(s),main=paste("n =",nn))
nn <- n[4]; x1 <- sample(0:1,nn,replace=TRUE); x2 <- sample(0:1,nn,replace=TRUE)
s <- x1+x2; barplot(table(s),main=paste("n =",nn))
par(mfrow=c(1,1))

## (b)
plot(0:2, dbinom(0:2,prob=0.5,size=2), type="h", xlim=c(-1,3), ylim=c(0,1), col="blue", lwd=3)
title("f(x) fuer B(2,0.5)")

## (c)
nn <- 100 ## verschiedene n probieren!
x1 <- sample(0:1,nn,replace=TRUE); x2 <- sample(0:1,nn,replace=TRUE)
x <- x1+x2
plot(ecdf(x), col="red")
points(0:2, pbinom(0:2,prob=0.5,size=2), pch=19,col="blue")
legend("right",c("theoretisch: F(x)","empirisch: ecdf"),col=c("blue","red"),pch=19)
