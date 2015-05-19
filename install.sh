#!/bin/bash

#install the java
sudo apt-get update
sudo apt-get －y install openjdk-7-jre-headless

#install the spark to $HOME/spark
#see http://spark.apache.org
#see http://spark.apache.org/downloads.html
#see http://www.apache.org/dyn/closer.cgi/spark/spark-1.3.1/spark-1.3.1.tgz

mkdir /tmp/download
cd /tmp/download

wget http://apache.fayea.com/spark/spark-1.3.1/spark-1.3.1-bin-hadoop2.6.tgz

# check the md5 code of the tgz.
#see http://www.apache.org/dist/spark/spark-1.3.1/spark-1.3.1-bin-hadoop2.6.tgz.md5
if [[ $(md5sum /tmp/download/spark-1.3.1-bin-hadoop2.6.tgz) != "b71cda077405411ef9c450ec4b43b56b  /tmp/download/spark-1.3.1-bin-hadoop2.6.tgz" ]]
	then echo "The md5 checksum doesn't match!"
	return 1
fi

mkdir -p $HOME/spark
tar -xvf spark-1.3.1-bin-hadoop2.6.tgz -C $HOME/spark

SPARK_HOME=$HOME/spark/spark-1.3.1-bin-hadoop2.6

echo "
export SPARK_HOME=$SPARK_HOME
export PATH=\$PATH:\$SPARK_HOME/bin:\$SPARK_HOME/sbin
" | tee -a $HOME/.profile

