#!/bin/bash

# 環境変数の設定
PROJECT_DIR=$(pwd)
WAR_FILE="telework-reservation-1.0.war"

# UTF-8エンコーディングに設定
export LANG=en_US.UTF-8

# Tomcatを停止
$TOMCAT_HOME/bin/catalina.sh stop

# MavenでWARファイルを作成
mvn clean package

if [ $? -eq 0 ]; then
    echo "WAR file created successfully."
    cp $PROJECT_DIR/target/$WAR_FILE $TOMCAT_HOME/webapps/
    echo "WAR file copied to Tomcat webapps directory."
    $TOMCAT_HOME/bin/catalina.sh start
    # echo "Tomcat started."
else
    echo "Failed to create WAR file."
fi
