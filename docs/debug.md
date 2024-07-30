# Debug Flow

```mermaid
sequenceDiagram
    participant Tomcat as Server
    participant Vscode as Editor
    participant Client as RestClient (Vscode Extension)

    Tomcat->>Tomcat: 1. debug mode (port 8000 socket)
    Vscode->>Tomcat: 2. connect (port 8000)
    Vscode->>Tomcat: 3. request stop at LoginController Line 19 
    Client->>Tomcat: 4. request (/login)
    Tomcat->>Vscode: 5. response info at Line 19 
    Vscode->>Vscode: 6.  show info 
    Tomcat->>Client: 7.  return response

```

# Introoduction

-  `export JPDA_ADDRESS=8000 `
-  `export JPDA_TRANSPORT=dt_socket `
- `cd $TOMCAT_HOME/bin`
-  `./catalina.sh jpda start `
-  launch.jsonで実行

- `sudo systemctl start postgresql`