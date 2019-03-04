#!/bin/bash

#change the environment variable according to ur needs
spark_url=$1
#spark_folder=spark-2.4.0-bin-hadoop2.7
zeppelin_version=zeppelin-0.8.1
spark_install_directory=/usr/local
spark_version=spark-2.4.0
hadoop_version=2.7
spark_home=$spark_install_directory/$spark_version-bin-hadoop$hadoop_version
zeppelin_install_directory=/usr/local



ls /root/$zeppelin_version-bin-all.tgz
if [[ $? -ne 0 ]]
then
   cd /root
   wget http://mirrors.estointernet.in/apache/zeppelin/$zeppelin_version/$zeppelin_version-bin-all.tgz
   echo 'Zeppelin Downloaded'
else
   echo 'Zeppelin Already present from the first build'
fi

#untar the zeppelin notebook
tar xvf $zeppelin_version-bin-all.tgz -C $zeppelin_install_directory

#Configure the spark master url for the zeppelin
cd $zeppelin_install_directory/$zeppelin_version-bin-all
cp ./conf/zeppelin-env.sh.template ./conf/zeppelin-env.sh
chmod 777 ./conf/zeppelin-env.sh
echo "export MASTER=$spark_url" >> ./conf/zeppelin-env.sh
echo "export SPARK_HOME=$spark_home" >> ./conf/zeppelin-env.sh

#directory creation
mkdir logs
mkdir run

#start the zeppelin daemon
./bin/zeppelin-daemon.sh start
