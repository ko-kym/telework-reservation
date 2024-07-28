<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>管理者画面</title>
    </head>

    <body>

        <h1>ユーザー登録画面</h1>
        <form action="employees" method="post">
            <input type="text" placeholder="社員番号" name="employeeId" required />
            <input type="text" placeholder="社員名" name="employeeName" required />
            <input type="email" placeholder="メールアドレス" name="email" required />
            <input type="text" placeholder="パスワード" name="password" required />
            <input type="text" placeholder="社員権限" name="role" required />
            <button type="submit">登録</button>
        </form>
    </body>

    </html>