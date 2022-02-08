data<-function(rho){
  p <- 300; n <- 150;
  SigmaX <- matrix(0, nrow = p, ncol = p)
  for (j in 1:p) {
    for (k in 1:p) {
      SigmaX[j,k] <- max(1 - abs(j-k)/rho, 0)
    }
  }
  eo <- eigen(SigmaX)
  SigmaXsqrt <- eo$vec%*%diag(sqrt(eo$val))%*%t(eo$vec)
  X <- matrix(rnorm(n*p), nrow = n, ncol = p)%*%SigmaXsqrt
  return(list(X,SigmaX))}

threshold_soft=function(z,lambda)
{
  return(pmax(abs(z)-lambda, 0)*sign(z))
}
threshold_hard=function(z,lambda)
{
  return(z*(abs(z)>lambda))
}
threshold_adaptive_soft=function(z,lambda,eta)
{
  return(pmax(abs(z)-lambda^{eta+1}*abs(z)^{-eta}, 0)*sign(z))
}
threshold_CV=function(data,kfold,method=c("soft","hard","adaptive_soft"))
  {
  n=nrow(data)
  fold=sample(rep(1:kfold, length=n))
  index=split(1:n, fold)
  lambda=seq(0, max(var(data)),length.out=10)
  eta=seq(0,4,length.out = 10)
  error_cv=matrix(0,10,kfold)
  adaptive_soft_error_cv=array(0,c(10,10,kfold))
  for (i in 1:kfold)
  {
    train_X=data[-index[[i]], ]
    test_X=data[index[[i]], ]
    if(method=="soft")
    {
      error_cv[,i]=sapply(1:10, function(i)
      {
        return(norm(threshold_soft(var(train_X),lambda[i])-var(test_X),type = "F")^2)
      })
    }
    if(method=="hard")
    {
      error_cv[,i]=sapply(1:10, function(i)
      {
        return(norm(threshold_hard(var(train_X),lambda[i])-var(test_X),type = "F")^2)
      })
    }
    if(method=="adaptive_soft")
    {
      for(j in 1:10)
      {
        for(k in 1:10)
        {
          adaptive_soft_error_cv[j,k,i]=norm(threshold_adaptive_soft(var(train_X),lambda[j],eta[k])
                                             -var(test_X),type = "F")^2
        }
      }
    }
  }
  if(method=="soft" )
  {
    optimal_lambda=lambda[which.min(rowMeans(error_cv))]
    return(threshold_soft(var(data),optimal_lambda))
  }
  if(method=="hard" )
  {
    optimal_lambda=lambda[which.min(rowMeans(error_cv))]
    return(threshold_hard(var(data),optimal_lambda))
  }
  if(method=="adaptive_soft")
  {
    adap_optimal=which(apply(adaptive_soft_error_cv,c(1,2),mean)==min(apply(adaptive_soft_error_cv,c(1,2),arr.ind = TRUE)
                                                                      return(threshold_adaptive_soft(var(data),lambda[adap_optimal[1]],eta[adap_optimal[2]]))
  }
}


# We compute the records for the performances for each of the methods  and ρ

FN_10=matrix(0,100,3)
FN_25=matrix(0,100,3)
FN_50=matrix(0,100,3)
FN_75=matrix(0,100,3)
FN_100=matrix(0,100,3)
TPR_10=matrix(0,100,3)
TPR_25=matrix(0,100,3)
TPR_50=matrix(0,100,3)
TPR_75=matrix(0,100,3)
TPR_100=matrix(0,100,3)
FPR_10=matrix(0,100,3)
FPR_25=matrix(0,100,3)
FPR_50=matrix(0,100,3)
FPR_75=matrix(0,100,3)
FPR_100=matrix(0,100,3)



mean_score_matrix_FN=matrix(0,5,3)
mean_score_matrix_TPR=matrix(0,5,3)
mean_score_matrix_FPR=matrix(0,5,3)
mean_score_matrix_FN[1,]=colMeans(FN_10)
mean_score_matrix_FN[2,]=colMeans(FN_25)
mean_score_matrix_FN[3,]=colMeans(FN_50)
mean_score_matrix_FN[4,]=colMeans(FN_75)
mean_score_matrix_FN[5,]=colMeans(FN_100)
mean_score_matrix_TPR[1,]=colMeans(TPR_10)
mean_score_matrix_TPR[2,]=colMeans(TPR_25)
mean_score_matrix_TPR[3,]=colMeans(TPR_50)
mean_score_matrix_TPR[4,]=colMeans(TPR_75)
mean_score_matrix_TPR[5,]=colMeans(TPR_100)
mean_score_matrix_FPR[1,]=colMeans(FPR_10)
mean_score_matrix_FPR[2,]=colMeans(FPR_25)
mean_score_matrix_FPR[3,]=colMeans(FPR_50)
mean_score_matrix_FPR[4,]=colMeans(FPR_75)


mean_score_matrix_FPR[5,]=colMeans(FPR_100)
mean_score_matrix_FN


mean_score_matrix_TPR


mean_score_matrix_FPR
