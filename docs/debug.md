# Debug Flow

```mermaid
sequenceDiagram
    participant Tomcat as Server
    participant Vscode as Editor
    participant Client as RestClient (Vscode Extension)

    Tomcat->>Tomcat: 1. debug mode (port 8000 socket)
    Vscode->>Tomcat: 2. connect (port 8000)
    Client->>Tomcat: 3. request (/login)
    Vscode->>Tomcat: 4. request stop at LoginController Line 19 
    Tomcat->>Vscode: 5. response info at Line 19 
    Vscode->>Vscode: 6.  show info 
    Note over Tomcat,Vscode: repeat 4, 5, 6
    Tomcat->>Client: 7.  return response

```

# Introoduction

-  デプロイする
-  別ターミナルを出す
-  `export JPDA_ADDRESS=8000 `
-  `export JPDA_TRANSPORT=dt_socket `
-  `cd $TOMCAT_HOME/bin`
-  `./catalina.sh stop `
-  `./catalina.sh jpda start `
-  Ctrl + Shift + D -> 緑(Start Debugging)でデバッグ開始(Debug Attach)
-  login.httpのリクエストを送る

- `sudo systemctl start postgresql`

# reference 
- [vscode debug](https://qiita.com/a__i__r/items/5a9a65195fe82cebd25b)
- [How to start debug mode from command prompt for apache tomcat server?](https://stackoverflow.com/questions/16689274/how-to-start-debug-mode-from-command-prompt-for-apache-tomcat-server#comment24017695_16689274)