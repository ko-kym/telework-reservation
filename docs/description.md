
# 依存関係 Maven

- 何かライブラリが足りない。。
- 赤い波線がでる
- ビルドツール ⇒ Maven

# 解決方法

- pom.xmlに記入
※ 依存関係のあるJar達を（依存関係）解決したい

```
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.7.3</version>
</dependency>
```

- dependencyを追加するためには？
    - [MVNレポジトリ](https://mvnrepository.com/)で調べる
    - MavenのDependencyタグを貼り付け
    - `mvn clean install `
    - `mvn clean package`