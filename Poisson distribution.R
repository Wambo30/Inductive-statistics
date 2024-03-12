## Poisson Verteilung
#########################################################


n_sim <- 1000;
lambda <- 3;
x <- 3

pois <- matrix(
  c(rpois(3*n_sim,lambda)),
  nrow=n_sim,ncol=x);

lambda_n <- matrix(
  nrow=n_sim,ncol=4);

lambda_n[1:n_sim,1] = 1/4*(pois[1:n_sim,1] + 3*pois[1:n_sim,2]);
lambda_n[1:n_sim,2] = 1/2*(pois[1:n_sim,1] + pois[1:n_sim,2] + pois[1:n_sim,3]);
lambda_n[1:n_sim,3] = 1/4*(pois[1:n_sim,1] + 2*pois[1:n_sim,2] + pois[1:n_sim,3]);
lambda_n[1:n_sim,4] = 1/3*(pois[1:n_sim,1] + pois[1:n_sim,2] + pois[1:n_sim,3]);
lambda_n;
boxplot(lambda_n);

plot(density(lambda_n[1:n_sim,1]), ylim = c(0,0.4), col = "blue", main = ("Schaetzfunktionen fuer Lambda der Poissonverteilung"));
lines(density(lambda_n[1:n_sim,2]), col = "red");
lines(density(lambda_n[1:n_sim,3]), col = "orange");
lines(density(lambda_n[1:n_sim,4]), col = "green");
legend("topright", legend=c("lambda.hut_1","lambda.hut_2","lambda.hut_3","lambda.hut_4"),
       col=c("blue","red","orange","green"),pch=1, cex=1.0);



