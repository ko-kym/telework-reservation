# log

## logの考えかた
- `System.out.println`でいいはず
    - consoleに出力　Fileに書き込んでいるわけではない！
    - tomcatは？
        - consoleに出力された文字列を`catalina.log`に出力している
- fileに書き込むには？
    - `Writer`クラスを使う必要が出てくる ← [BufferedWriter](https://qiita.com/smk7758/items/e26e267cfbdf00621969)
        - 上記を使用してログ書き込む！！
- 文字列は文字列でもある程度簡潔な文字列を書き込みたい
    - ex) `login-callが呼ばれましたよ` ← when? login-call っていうエンドポイントを叩かれたときに
        - `login-call` ← 他のエンドポイントでも代用できそう
        - `String.format("%s が呼ばれましたよ")`
        - 下記内容もほしい
            - そのほかにもいつ？
            - 誰が？
    - formatも考える必要が出てくる
    - 優先順位(log level)
        - info
        - error
        - debug
        - atc...

## 従来のログライブラリ
- log4j
- logback
- [slf4j](https://qiita.com/opengl-8080/items/49719f2d35171f017aa9)
  - loggerを使ってログ出力できるようにする。
    - これにより、log4jやlog-backでも同じように書くことができる。