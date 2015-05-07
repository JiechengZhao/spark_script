#!/bin/bash
echo "deb http://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-get update
sudo apt-get install sbt

mkdir /tmp/download
cd /tmp/download

wget http://apache.fayea.com/spark/spark-1.3.1/spark-1.3.1-bin-hadoop2.6.tgz
mkdir -p /usr/local/share/spark
tar -xvf spark-1.3.1-bin-hadoop2.6.tgz -C /usr/local/share/spark

export SPARK_HOME=/usr/local/share/spark/spark-1.3.1-bin-hadoop2.6

chown -R root:root $SPARK_HOME
mkdir $SPARK_HOME/logs
chmod a+w $SPARK_HOME/logs

mkdir $SPARK_HOME/work
chmod a+w $SPARK_HOME/work

echo "
export SPARK_HOME=$SPARK_HOME
export PATH=\$PATH:\$SPARK_HOME/bin:\$SPARK_HOME/sbin
" | tee -a /etc/profile

