<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="java.util.ArrayList" %>
            <%@ page import="jakarta.servlet.http.HttpSession" %>

                <% HttpSession currentSession=request.getSession(false); String employeeId=(currentSession !=null) ?
                    (String)currentSession.getAttribute("employeeId") : null; if (employeeId==null) {
                    response.sendRedirect("index.html"); } String selectedDate=request.getParameter("date"); %>

                    <!DOCTYPE html>
                    <html lang="ja">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>予約画面</title>
                        <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet" />
                        <style>
                            body {
                                font-family: Arial, sans-serif;
                                margin: 0;
                                padding: 20px;
                                display: flex;
                                flex-direction: column;
                                justify-content: flex-start;
                                min-height: 100vh;
                                align-items: center;
                                background-color: white;
                            }


                            .container {
                                width: 100%;
                                max-width: 800px;
                                text-align: center;
                            }

                            table {
                                width: 100%;
                                border-collapse: collapse;
                                margin-top: 20px;
                            }

                            th,
                            td {
                                border: 1px solid #ddd;
                                padding: 8px;
                                text-align: left;
                            }

                            th {
                                background-color: #f2f2f2;
                            }

                            .scrollable-table {
                                max-height: 250px;
                                overflow-y: auto;
                            }

                            .footer {
                                margin-top: auto;
                                padding: 20px;
                                width: 95%;
                                text-align: center;
                                background-color: #fff;
                                display: flex;
                                justify-content: center;
                                gap: 100px;
                                /* ボタンの間の距離を広げる */
                            }

                            .btn {
                                background: navy;
                                color: white;
                                padding: 10px 20px;
                                text-decoration: none;
                                border-radius: 5px;
                                border: none;
                                cursor: pointer;
                            }

                            .btn-submit {
                                background: gray;
                                color: white;
                                padding: 12px 20px;
                                text-decoration: none;
                                border-radius: 5px;
                                border: none;
                                cursor: pointer;
                            }

                            .modal {
                                display: none;
                                position: fixed;
                                z-index: 1;
                                left: 0;
                                top: 0;
                                width: 100%;
                                height: 100%;
                                overflow: auto;
                                background-color: rgb(0, 0, 0);
                                background-color: rgba(0, 0, 0, 0.4);
                                padding-top: 60px;
                            }

                            .modal-content {
                                background-color: white;
                                margin: 5% auto;
                                padding: 20px;
                                border: 1px solid #888;
                                width: 60%;
                                text-align: center;
                            }

                            .close {
                                color: #aaa;
                                float: right;
                                font-size: 28px;
                                font-weight: bold;
                            }

                            .close:hover,
                            .close:focus {
                                color: black;
                                text-decoration: none;
                                cursor: pointer;
                            }

                            .modal-buttons {
                                margin-top: 20px;
                                display: flex;
                                justify-content: center;
                                gap: 10px;
                            }

                            .modal-message,
                            .modal-buttons button {
                                font-size: 20px;
                                font-weight: bold;
                            }

                            .modal-buttons button {
                                margin: 20px 10px;
                                padding: 10px 20px;
                                cursor: pointer;
                            }

                            .status {
                                color: white;
                            }
                        </style>

                    </head>

                    <body>
                        <div class="container">
                            <h1>テレワーク部屋予約</h1>
                            <h3>ログインユーザー: <%= employeeId %>
                            </h3>
                            <h3 id="dateDisplay">
                                <%= selectedDate %> 予約状況
                            </h3>
                            <div class="scrollable-table">
                                <table id="myTable">
                                    <thead>
                                        <tr>
                                            <th>部屋番号</th>
                                            <th>ステータス</th>
                                            <th>社員番号</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<String[]> reservationList = (List<String[]>
                                                )request.getAttribute("reservationList");
                                                if (reservationList != null) {
                                                for (String[] reservation : reservationList) {
                                                String roomName = reservation[0];
                                                String status = reservation[1];
                                                String userId = reservation[2]; %>
                                                <tr>
                                                    <td>
                                                        <%= roomName %>
                                                    </td>
                                                    <td class="status">
                                                        <%= status %>
                                                    </td>
                                                    <td>
                                                        <%= userId.equals("-") ? "-" : userId %>
                                                    </td>
                                                </tr>
                                                <% } } else { %>
                                                    <tr>
                                                        <td colspan="3">予約情報はありません。</td>
                                                    </tr>
                                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="footer">
                                <form action="reservation" method="get">
                                    <button type="submit" class="btn-submit">戻る</button>
                                </form>
                                <a href="logout" class="btn">ログアウト</a>
                            </div>

                        </div>

                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <p id="modalMessage" class="modal-message"></p>
                                <div class="modal-buttons">
                                    <form id="confirmForm" action="request" method="post">
                                        <input type="hidden" id="roomName" name="roomName" value="">
                                        <input type="hidden" id="reservationDate" name="reservationDate"
                                            value="<%= selectedDate %>">
                                        <button type="submit" id="confirmButton">はい</button>
                                    </form>
                                    <button id="cancelButton">いいえ</button>
                                </div>
                            </div>
                        </div>

                        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                var table = document.getElementById('myTable');
                                var rows = table.querySelectorAll('tbody > tr');
                                var modal = document.getElementById("myModal");
                                var span = document.getElementsByClassName("close")[0];
                                var modalMessage = document.getElementById("modalMessage");
                                var confirmButton = document.getElementById("confirmButton");
                                var cancelButton = document.getElementById("cancelButton");

                                // Ensure the script is loaded after the DOM
                                rows.forEach(function (row) {
                                    var statusCell = row.querySelector('.status');
                                    console.log('Status:', statusCell.textContent.trim());
                                    switch (statusCell.textContent.trim()) {
                                        case '予約可能':
                                            statusCell.style.backgroundColor = 'green';
                                            break;
                                        case '予約申請中（他者）':
                                            statusCell.style.backgroundColor = 'gray';
                                            break;
                                        case '予約済み':
                                            statusCell.style.backgroundColor = 'gray';
                                            break;
                                        case '予約申請中':
                                            statusCell.style.backgroundColor = 'orange';
                                            break;
                                        default:
                                            statusCell.style.backgroundColor = 'red';
                                    }
                                });
                                rows.forEach(function (row) {
                                    var statusCell = row.querySelector('.status');
                                    row.addEventListener('click', function () {
                                        if (statusCell.textContent.trim() == '予約可能') {
                                            var roomName = row.cells[0].textContent;
                                            modalMessage.textContent = '<%= selectedDate %>：' + roomName + '号室を予約しますか？';
                                            document.getElementById('roomName').value = roomName;
                                            modal.style.display = "block";
                                        }


                                    });
                                });

                                span.onclick = function () {
                                    modal.style.display = "none";
                                }

                                cancelButton.onclick = function () {
                                    modal.style.display = "none";
                                }

                                confirmButton.onclick = function () {
                                    alert("予約が確認されました。");
                                    modal.style.display = "none";
                                    // リクエストを送信
                                }

                                window.onclick = function (event) {
                                    if (event.target == modal) {
                                        modal.style.display = "none";
                                    }
                                }
                            });
                        </script>
                    </body>

                    </html>