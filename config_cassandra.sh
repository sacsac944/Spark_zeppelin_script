#!/bin/bash
cd /root
touch /etc/yum.repos.d/cassandra.repo
cd /etc/yum.repos.d
echo '[cassandra]' >> cassandra.repo
echo 'name=Apache Cassandra' >> cassandra.repo
echo 'baseurl=https://www.apache.org/dist/cassandra/redhat/311x/' >> cassandra.repo
echo 'gpgcheck=1' >> cassandra.repo
echo 'repo_gpgcheck=1' >> cassandra.repo
echo 'gpgkey=https://www.apache.org/dist/cassandra/KEYS' >> cassandra.repo

yum -y install cassandra
echo "JVM_OPTS='$JVM_OPTS -Djava.rmi.server.hostname=$1'" >> /etc/cassandra/default.conf/cassandra-env.sh

systemctl daemon-reload
systemctl start cassandra
systemctl enable cassandra
nodetool status

