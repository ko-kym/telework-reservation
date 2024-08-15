# setup-in-wsl

## requeirement software
|  software  |  version  |
| ---- | ---- |
|  Java  |  21.0.4  |
|  Tomcat  |  10.1.20  |
|  Postgres  |  14  |
|  Maven  |  3.9.8  |

## how to
### 前提
- sdkman が必要
    - `sdk -v`
### java
- `sdk list java` ← どのJavaのVersionをInstallするか確認
- `sdk isntall java 21.0.4-amzn`
- 基本的にDefault
### tomcat
- before installing 
    - `sdk list tomcat` ← どのtomcatのVersionをInstallするか確認
    - `sdk isntall tomcat 10.1.20`
    - 基本的にDefault
- after installing
    - 実行方法
        - `cd $TOMCAT_HOME/bin`
        - `chmod 755 catalina.sh`
        - `./catalina.sh start` 
        - PORTS -> Add Port -> 8080 -> Forwarded Address -> 地球儀(Open in Browser)
    - 設定 AdminUser追加
        - 下記 `$TOMCAT_HOME/conf/tomcat-users.xml` の内容
            ``` xml
                <role rolename="manager-gui" />
                <user username="manager" password="manager_password" roles="manager-gui" />

                <role rolename="admin-gui" />
                <user username="admin" password="admin" roles="manager-gui,admin-gui" /> 
            ```
### maven
- `sdk list maven` ← どのmavenのVersionをInstallするか確認
- `sdk isntall maven 3.9.8`
- 基本的にDefault
### docker-postgres
- currentディレクトリに`docker-compose.yml`があるか確認
- ` docker -v` : Docker version xx.x.x, build xxxxxxx
- ` docker-compose -v` : Docker Compose version v2.xx.x-desktop.1
- ` docker-compose up -d`
### postgres(in wsl) 
- `sudo apt update`
- `sudo apt install postgresql postgresql-contrib`
- `sudo -i -u postgres` ← postgresユーザーに変更
- `psql`
- `ALTER ROLE postgres WITH password 'postgres';` postgresユーザーのパスワード設定
- `CREATE DATABASE teleworkreservations;`
- `psql -U postgres -d teleworkreservations`
- generate-table.sql ,generate-data.sql を実行
### z
- 'git clone https://github.com/rupa/z.git'
- `. ~/z/z.sh` ← ~/.bashrcに追記
- `source .bashrc`
- [git hub repository](https://github.com/rupa/z.git)