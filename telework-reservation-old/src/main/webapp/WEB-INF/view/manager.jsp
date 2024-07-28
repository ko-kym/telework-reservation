<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>管理者画面</title>
    </head>

    <body>

        <h1>管理者画面</h1>
        <form action="employees" method="get">
            <button type="submit" class="btn-submit">ユーザー登録</button>
        </form>
        <form action="reservation" method="get">
            <button type="submit" class="btn-submit">予約承認画面</button>
        </form>
        <form action="reservation" method="get">
            <button type="submit" class="btn-submit">予約カレンダー</button>
        </form>
    </body>

    </html>