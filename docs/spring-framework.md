# spring-framework

## dependecy
- spring-core ← Springframeworkを使用する中心的な部分 ← 共通部品
- spring-context ← DIをするための箱
- spring-beans ← 箱に詰めるInstance
- spring-aop ← AOPで使用する
- spring-webmvc ← WebはWebでもリクエストとレスポンスを上手いことする Controller的なもので使用
- spring-web ← Front側で主に使用されるWeb関連
- spring-expression ← 知らない

## What is Servlet?

## Tomcat only

```mermaid
    graph LR
        subgraph localhost
            subgraph Tomcat:8080
                subgraph App
                    subgraph api
                        employeeServlet[employee servlet]
                    end
                    subgraph client
                        loginServlet[login servlet]
                    end
                end
            end
        end

        User[👤 User]

        User -- request --> loginServlet
        loginServlet -- request --> employeeServlet
        employeeServlet -- response --> loginServlet
        loginServlet -- response --> User
```

## Tomcat with spring framework

```mermaid
    graph LR
        subgraph localhost
            subgraph Tomcat:8080
                subgraph App
                    subgraph api
                        employeeServlet[employee servlet]
                        dispatchApiServlet[dispatch api servlet]
                    end
                    subgraph client
                        loginServlet[login servlet]
                        dispatchClientServlet[dispatch client servlet]
                    end
                end
            end
        end

        User[👤 User]

        User -- request --> dispatchClientServlet
        dispatchClientServlet -- request --> loginServlet
        loginServlet -- request --> dispatchApiServlet
        dispatchApiServlet -- request --> employeeServlet
        employeeServlet -- response --> dispatchApiServlet
        dispatchApiServlet -- response --> loginServlet
        loginServlet -- response --> dispatchClientServlet
        dispatchClientServlet -- response --> User
```