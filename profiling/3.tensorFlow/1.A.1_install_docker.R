## Dockerized Jupyter with tensorflow
## https://hub.docker.com/r/xblaster/tensorflow-jupyter/

docker run -d -p 8888:8888 satoshun/tensorflow-notebook

docker ps -a
docker kill fc79820df7c4
