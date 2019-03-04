#!/bin/bash
#Check for the pre-requisites
whoami
#Environment variable declaration
#default spark webui port is 8080
scala_version=2.11.8
spark_version=spark-2.4.0
hadoop_version=2.7
installation_directory=/usr/local
java_home=/usr/lib/jvm/java-1.8.0-openjdk
#give the java home accoridng to your system

#Check for the pre-requisites
java -version || yum install -y java-1.8.0-openjdk-devel
if [[ $? -ne 0 ]]
then
   yum install -y java-1.8.0-openjdk-devel
   echo 'Java Installed'
else
   echo 'Java already installed'
fi
scala -version || wget http://downloads.lightbend.com/scala/$scala_version/scala-$scala_version.rpm
if [[ $? -ne 0 ]] 
then 
   wget http://downloads.lightbend.com/scala/$scala_version/scala-$scala_version.rpm
   yum install -y scala-$scala_version.rpm
   echo 'Scala Installed'
else 
   echo 'The scala is already installed'
fi



#untar the file
tar xvf /root/$spark_version-bin-hadoop$hadoop_version.tgz -C $installation_directory

#Edit the ~/.bash_profile file
echo "export PATH=$PATH:$installation_directory/$spark_version-bin-hadoop$hadoop_version/bin" >> ~/.bash_profile
source ~/.bash_profile
