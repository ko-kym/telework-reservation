# 開発メモ
# SQL
`SELECT * FROM reservations WHERE reservation_date BETWEEN '2024-09-01' AND '2024-08-10';`
## フロント
- 日付(月始め～月終わり)

## バックエンド
- roomテーブルのカウントをとってくる
  - `SELECT COUNT(*) FROM rooms;`
- 日付毎のデータをとってくる
  - `SELECT COUNT(*) FROM reservations WHERE reservation_date = '2024-08-01';`
- 上記2つを引き算、空き部屋を計算する

- カレンダーの日付のところに各日の空き部屋を表示する


- available_rooms(空き部屋の数)を返す

## やること(CalendarController、calendar.jsp)
- 今：8月だけ全データとれる
-　使えそうなもの：　test.sqlのコメント文
    - `SELECT (SELECT COUNT(*) FROM rooms) - (SELECT COUNT(*) FROM reservations WHERE reservation_date = ?) AS available_rooms;`
      - ↑空き部屋の数を求める({roomsテーブルのデータ数} - {その日の予約が入っている部屋の数})
    - `SELECT * FROM reservations WHERE EXTRACT(YEAR FROM reservation_date) = 2024 AND EXTRACT(MONTH FROM reservation_date) = 8;`
      - ↑ 2024年8月の予約データを出す
    - 必要なもの
      - 年
      - 月
      - フロントから送られてきた内容から年と月をとってくる
      - →リストを生成したい(年と月で何日あるかをとる)
      - dateListに渡す
  - jsonを作りたい： 2024-08-01:16
  - resultSet.getInt("available_rooms")　で空き部屋をとっている
    - jsonの作り方は調べる
    - jsonの渡し方も調べる
- calendar.jspに対してjsonを返したい
- loginコントローラーでcalendar.jspに遷移するまでにカレンダーコントローラーのDOGETの処理を行う
  - jsonを作っておく
  - jsp側で

- 画面から年と月を渡してほしい
- calendar.jspに飛ばした後にcalendarのエンドポイントをたたく(GETで投げる)←フェッチかなにか
- 映るカレンダーの年と月を投げてもらう
- 帰ってきたjsonをavailable_roomsに渡す
- jsonをなんやかんやするのはJavascript
- 月を切り替えるときにもエンドポイントを押してもらう＆年と月を渡す