
install.packages("mlbench")
install.packages("h2o")
#1.How to set up and connect to a local H2O cluster from R.
#2.How to train a deep neural networks model.
#3.How to use the model for predictions.
#4.Out-of-bag performance of non-regularized and regularized models.
#5.How does the memory usage vary over time.

library(mlbench)


library(h2o)
## Setting Up and Connecting to a H2O Cluster
## Start a local cluster with 1GB RAM (default)
## By default, H2O starts a cluster using all available threads (8 in my case). 
h2o.init(ip = "localhost", port = 54321, nthreads = 8, max_mem_size = '4g')
h2o.clusterInfo()

## Start a local cluster with 2GB RAM
localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE,  Xmx = '2g')

## Convert Breast Cancer into H2O
library(mlbench)
## Load Breast Cancer data from 'mlbench'
data(BreastCancer)

dat <- BreastCancer[, -1]  # remove the ID column
dat <- as.factor(as.matrix(dat))
dat_h2o <- as.h2o( dat, destination_frame = "dat_h2o")



## Split 60/40 for Training/Test Dataset
set.seed(1234)
y_all <- as.matrix(dat_h2o$Class)
rand_folds <- createFolds(as.factor(y_all), k = 5)
row_train <- as.integer(unlist(rand_folds[1:3]))
row_test <- as.integer(unlist(rand_folds[4:5]))
y_train <- as.factor(y_all[row_train])
y_test <- as.factor(y_all[row_test])



## Import MNIST CSV as H2O
dat_h2o <- h2o.importFile(localH2O, path = ".../mnist_train.csv")


## Split 60/40 for Training/Test Dataset
set.seed(1234)
y_all <- as.matrix(dat_h2o$Class)
rand_folds <- createFolds(as.factor(y_all), k = 5)
row_train <- as.integer(unlist(rand_folds[1:3]))
row_test <- as.integer(unlist(rand_folds[4:5]))
y_train <- as.factor(y_all[row_train])
y_test <- as.factor(y_all[row_test])


### Training a Deep Neural Network Model
model <- h2o.deeplearning(x = 2:785,  # column numbers for predictors
                          y = 1,   # column number for label
                          data = train_h2o, # data in H2O format
                          activation = "TanhWithDropout", # or 'Tanh'
                          input_dropout_ratio = 0.2, # % of inputs dropout
                          hidden_dropout_ratios = c(0.5,0.5,0.5), # % for nodes dropout
                          balance_classes = TRUE, 
                          hidden = c(50,50,50), # three layers of 50 nodes
                          epochs = 100) # max. no. of epochs

    

### Using the Model for Prediction
## Using the DNN model for predictions
h2o_yhat_test <- h2o.predict(model, test_h2o)

## Converting H2O format into data frame
df_yhat_test <- as.data.frame(h2o_yhat_test)


##########

