#!/bin/bash

# 環境変数の設定
API_DIR="./telework-reservation-api"
CLIENT_DIR="./telework-reservation-client"
API_WAR="telework-reservation-api-1.0.war"
CLIENT_WAR="telework-reservation-client-1.0.war"

# UTF-8エンコーディングに設定
export LANG=en_US.UTF-8

# Tomcatを停止
$TOMCAT_HOME/bin/catalina.sh stop

# MavenでWARファイルを作成
mvn -f $API_DIR clean package 
mvn -f $CLIENT_DIR clean package 

if [ $? -eq 0 ]; then
    echo "WAR file created successfully."
    cp $API_DIR/target/$API_WAR $TOMCAT_HOME/webapps/
    cp $CLIENT_DIR/target/$CLIENT_WAR $TOMCAT_HOME/webapps/
    echo "WAR file copied to Tomcat webapps directory."
    $TOMCAT_HOME/bin/catalina.sh start
else
    echo "Failed to create WAR file."
fi
