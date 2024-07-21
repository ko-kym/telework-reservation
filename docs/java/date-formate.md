# 日付Format Java使用したい

- 下記はSampleコード

```java
// java.util.Date を使用して java.sql.Date を生成
            java.util.Date utilDate = new java.text.SimpleDateFormat("yyyy-MM-dd").parse("2024-08-01");
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

            // または、Calendar を使用して java.sql.Date を生成
            java.util.Calendar cal = java.util.Calendar.getInstance();
            cal.set(2024, Calendar.AUGUST, 1); // 月は0から始まるので、8月は 7 を指定
            java.sql.Date sqlDate = new java.sql.Date(cal.getTimeInMillis());
```

## 必要知識

- Formatするためには便利なutil関数
    `'2024-08-01'` ⇒ Date型にしたい

- java.util.Dateとjava.sql.Dateは違う
    - java.util.Date ⇒ Javaの世界で使用される
    - java.sql.Date ⇒ DBの世界で通用する型
        - java.sql.Date JavaのDate型 ⇒ `org.postgresql.Driver` ⇒ ポスグレのDate型
        