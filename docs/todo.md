# TODO
## must
- [ ] デバッグ方法決める
- [ ]  launch.json / tasks.json 作成

## リファクタリング項目
- [ ] セッション機能の追加(user <-> client間)
- [ ] oldの処理を振り分け
- [ ] 未実装の機能追加
- [ ] リソースの閉じ方変える


## あとで
- [ ] ログインパスワードのハッシュ化
- [ ] 画面デザイン
- [ ] サーバー分ける
- [ ] 管理者と一般ユーザーの振り分け


## refactoring
- api 
    - error handling
        - error.jsp
        - response message
    - aop
        - method単位でのログ出力 slf4
    - utils
        - DBControllerもなんかうまいことしたい。な
    - DI
        - serviceの取り出し
    - config
        - orm
    - model dto
        - lombok 自動生成
    - constants
        - enumとか使いたい
    - junit
        - test codeとか走らしたい


