### Anaconda environment installation
### April, 17th, 2016

##Create a conda environment called tensorflow:
conda create -n tensorflow python=2.7

## Activate the environment and use pip to install TensorFlow inside it. 
## Use the --ignore-installed flag to prevent errors about easy_install.

source activate tensorflow

### Mac OS X, CPU only:
sudo pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/mac/tensorflow-0.8.0rc0-py2-none-any.whl




