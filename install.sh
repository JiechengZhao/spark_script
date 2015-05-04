#!/bin/bash
echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-get update
sudo apt-get install sbt

mkdir /tmp/download
cd /tmp/download

wget -T 10 http://downloads.typesafe.com/scala/2.10.5/scala-2.10.5.tgz?_ga=1.106928195.1176586385.1430617673 \
  -O scala-2.10.5.tgz
mkdir -p /usr/local/share/scala
tar -xvf scala-2.10.5.tgz -C /usr/local/share/scala/

wget http://apache.fayea.com/spark/spark-1.3.1/spark-1.3.1-bin-hadoop2.6.tgz
mkdir -p /usr/local/share/spark
tar -xvf spark-1.3.1-bin-hadoop2.6.tgz -C /usr/local/share/spark


export SCALA_HOME=/usr/local/share/scala/scala-2.10.5
export SPARK_HOME=/usr/local/share/spark/spark-1.3.1-bin-hadoop2.6

chown -R root:root $SCALA_HOME
chown -R root:root $SPARK_HOME
mkdir $SPARK_HOME/logs
chmod +w $SPARK_HOME/logs

echo "
export SCALA_HOME=$SCALA_HOME
export SPARK_HOME=$SPARK_HOME
export PATH=\$PATH:\$SCALA_HOME/bin:\$SPARK_HOME/bin:\$SPARK_HOME/sbin
" | tee -a /etc/profile

