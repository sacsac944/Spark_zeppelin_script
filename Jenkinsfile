pipeline {
    agent none
    stages {
        stage('config_master'){
            agent{label 'spark_master'}
            steps{
            sh 'mkdir /root/scripts'    
            sh 'git clone https://github.com/svn123/Spark_zeppelin_script.git /root/scripts'
            sh 'sh /root/scripts/Spark_zeppelin_script/config_master.sh 15.213.95.216 9092 2 15.213.95.217 15.213.95.218'
            }
        }
        stage('config_slave'){
        parallel{
            stage('config_slave1'){
                agent{label 'spark_slave1'}
                steps{
                sh 'mkdir /root/scripts'    
                sh 'git clone https://github.com/svn123/Spark_zeppelin_script.git /root/scripts'
                sh 'sh /root/scripts/Spark_zeppelin_script/config_slave.sh'
                }
            }
            stage('config_slave2'){
                agent{label 'spark_slave2'}
                steps{
                sh 'mkdir /root/scripts'    
                sh 'git clone https://github.com/svn123/Spark_zeppelin_script.git /root/scripts'
                sh 'sh /root/scripts/Spark_zeppelin_script/config_slave.sh'
                }
            }
        }
        }
        stage('start_cluster'){
            agent{label 'spark_master'}
            steps{
                sh 'sh /root/scripts/Spark_zeppelin_script/start_cluster.sh'
            }
        }
        stage('zeppelin_start'){
            agent{label 'spark_master'}
            steps{
                sh 'sh /root/scripts/Spark_zeppelin_script/zeppelin_start.sh spark://15.213.95.216:7077'
            }
        }
        
        
    }
}
