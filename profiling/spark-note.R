docker run -p 9000:9000 -p 4040-4045:4040-4045 andypetrella/spark-notebook:0.6.3-scala-2.11.7-spark-1.6.0-hadoop-2.2.0-with-hive-with-parquet

jupyter notebook
ssh -N -L localhost:6005:localhost:9999 farm ssh jolyang@bigmem2 -L localhost:6005:localhost:9999


srun -p bigmemh --pty jupyter notebook JUPYTER_RUNTIME_DIR=/home/jolyang