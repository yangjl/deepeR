### Jinliang Yang
### H2O documentation
### http://h2o-release.s3.amazonaws.com/h2o/rel-lambert/5/docs-website/Ruser/Rinstall.html

## install on farm
# The following two commands remove any previously installed H2O packages for R.
if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }

# Next, we download, install and initialize the H2O package for R.
install.packages("h2o", repos=(c("http://s3.amazonaws.com/h2o-release/h2o/master/1497/R", getOption("repos"))))

##
library(h2o)
## Setting Up and Connecting to a H2O Cluster
## Start a local cluster with 1GB RAM (default)
## By default, H2O starts a cluster using all available threads (8 in my case). 
h2o.init(ip = "localhost", port = 54321, nthreads = 8, max_mem_size = '64g')
h2o.clusterInfo()

## Start a local cluster with 2GB RAM
localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE,  Xmx = '2g')

# Finally, let's run a demo to see H2O at work.
demo(h2o.glm)

