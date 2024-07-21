@echo off
setlocal

set TOMCAT_HOME=C:\apache-tomcat-10.1.26
set PROJECT_DIR=C:\telework-reservation
set WAR_FILE=telework-reservation-1.0.war

chcp 65001 

@REM REM Tomcatが起動しているか確認
@REM netstat -ano | findstr :8080
@REM if %ERRORLEVEL% equ 0 (
@REM     REM Tomcatを停止
@REM     %TOMCAT_HOME%\bin\catalina.bat stop
@REM     timeout /t 5 /nobreak > nul
@REM ) else (
@REM     echo Tomcat is not running.
@REM )

REM MavenでWARファイルを作成
cd %PROJECT_DIR% && mvn clean package && echo "create war" && copy /Y %PROJECT_DIR%\target\%WAR_FILE% %TOMCAT_HOME%\webapps\ && echo "copy war" && %TOMCAT_HOME%\bin\catalina.bat start && echo "Tomcat start"


endlocal