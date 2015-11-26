FROM sequenceiq/hadoop-docker
RUN mkdir /spark
WORKDIR /spark
RUN curl http://www.apache.org/dyn/closer.lua/spark/spark-1.5.2/spark-1.5.2-bin-without-hadoop.tgz > spark-1.5.2-bin-without-hadoop.tgz
RUN tar xf spark-1.5.2-bin-without-hadoop.tgz
WORKDIR /spark/spark-1.5.2-bin-without-hadoop
COPY conf/spark-env.sh.template conf/spark-env.sh
RUN echo "export SPARK_DIST_CLASSPATH=$($HADOOP_PREFIX/bin/hadoop classpath)" >> conf/spark-env.sh
