# JSPって。。。

- javaを使用して画面をレンダリングするためのファイル???
    - 従来はJavascriptを使用していた
    - Javascript学習はしんどいのでFrontendもJavaで賄えるようになった
- JSPのお作法
    - 頭に以下の内容を記載
    ```
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    ```
    - 隠蔽したいファイル(今回だと`top.html`)
        - `/src/main/webapp/WEB-INF`配下に配置する
        - `/src/main/webapp/WEB-INF/view` ← 一般的にはここ

    - java側は？
        - 画面遷移するとき
            - sendRedirect
                - aタグみたいなもん
                - 一般的な画面遷移
                - PublicでだれでもURLが直叩きできるやつ
            - forward
                - dispatcherっていうわけわからんものでレンダリング
                - レンダリングしたもの(動的HTML)をレスポンスにいれて返却
                - WEB-INFの中身だろうが素材として使うものを選択


