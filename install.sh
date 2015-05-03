#!/bin/bash

mkdir /tmp/download
cd /tmp/download

wget http://downloads.typesafe.com/scala/2.10.5/scala-2.10.5.tgz?_ga=1.106928195.1176586385.1430617673 \
  -O scala-2.10.5.tgz
mkdir -p /usr/local/share/scala
tar -xvf scala-2.10.5.tgz -C /usr/local/share/scala/

wget http://apache.fayea.com/spark/spark-1.3.1/spark-1.3.1-bin-hadoop2.6.tgz
mkdir -p /usr/local/share/spark
tar -xvf spark-1.3.1-bin-hadoop2.6.tgz -C /usr/local/share/spark


echo "
export SCALA_HOME=/usr/local/share/scala/scala-2.10.5
export SPARK_HOME=/usr/local/share/spark/spark-1.3.1-bin-hadoop2.6/
export PATH=\$PATH:\$SCALA_HOME/bin:\$SPARK_HOME/bin
" | tee -a /etc/profile

source /etc/profile

echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
apt-get update
apt-get install sbt

