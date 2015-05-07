#!/bin/bash

#install the sbt
#see http://www.scala-sbt.org
#see http://www.scala-sbt.org/0.13/tutorial/Installing-sbt-on-Linux.html

echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-get update
sudo apt-get install sbt

#install the spark to /usr/local/share
#see http://spark.apache.org
#see http://spark.apache.org/downloads.html
#see http://www.apache.org/dyn/closer.cgi/spark/spark-1.3.1/spark-1.3.1.tgz

mkdir /tmp/download
cd /tmp/download

wget http://apache.fayea.com/spark/spark-1.3.1/spark-1.3.1-bin-hadoop2.6.tgz
mkdir -p $HOME/spark
tar -xvf spark-1.3.1-bin-hadoop2.6.tgz -C $HOME/spark

export SPARK_HOME=$HOME/spark/spark-1.3.1-bin-hadoop2.6

echo "
export SPARK_HOME=$SPARK_HOME
export PATH=\$PATH:\$SPARK_HOME/bin:\$SPARK_HOME/sbin
" | tee -a $HOME/.profile

