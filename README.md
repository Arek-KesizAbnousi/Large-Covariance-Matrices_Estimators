# Large-Covariance-Matrices_Estimators
We Compare three different Generalized Thresholding Estimators For Large Covariance Matrices. soft-thresholding, hard-thresholding, and adaptive-soft-thresholding Estimators.

For each of the thresholding estimators, we will choose the tuning parameter lambda by
minimizing a sum-of-squares criterion in V -fold cross-validation.

With the three estimators, we record three performance metrics for each replication. 
These are (i) Frobenius norm error (ii) True positive rate  (iii) False positive rate.

 -  Obtain simulation results and create three tables, one for each of the three performance
metrics. 

 - Finally, we will conclude which  Thresholding Estimators among soft, hard, and adaptive-soft worked best in terms of each of the three performances metrics (i)Frobenius norm error (ii) True positive rate  (iii) False positive rate.

 # Data 

   We have 100 independent replications for each ρ ∈{10,25,50,75,100} , Hence in total we will 500  replication.
   We generate the data by implementing our code to simulate it.





 # Conlusion
Based on the resulting matrices, we conclude the below:

The  Adaptive-Soft thresholding estimator worked best under Frobenius norm error.

As we observe the mean score matrix of the True positive rate, we conclude that The soft thresholding has the most significant value by checking the. Thus, the best estimator for True Positive Rate was Soft thresholding.

Checking the mean score matrix of False positive rate, the hard thresholding is the smallest. Thus, the estimator that worked best for False Positive Rate was hard thresholding.

