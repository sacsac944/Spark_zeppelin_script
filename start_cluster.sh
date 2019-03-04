#!/bin/bash
#start the spark cluster
whoami
#Environment varaibles
installation_directory=/usr/local
spark_version=spark-2.4.0
hadoop_version=2.7

su - root << EOF
cd $installation_directory/$spark_version-bin-hadoop$hadoop_version
./sbin/start-all.sh
EOF
#./sbin/start-master.sh

#change the port of the master if its used by any other app

