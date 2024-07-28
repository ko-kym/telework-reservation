<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FullCalendar Example</title>
        <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
        <style>
            @charset "UTF-8";

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                min-height: 100vh;
                align-items: center;
                background-color: #fff;
            }

            #reservationButton {
                background: navy;
                margin-bottom: 50px;
                color: white;
            }

            #calendar {
                width: 80%;
                max-width: 800px;
            }

            #logoutButton {
                background: navy;
                margin-top: 50px;
                color: white;
            }

            .footer {
                margin-top: auto;
                padding: 20px;
                width: 100%;
                text-align: center;
                background-color: #fff;
            }

            .btn {
                background: navy;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
            }
        </style>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');

                // 空き部屋数データ（静的な例）
                var roomAvailability = {
                    '2024-07-01': 5,
                    '2024-07-02': 3,
                    '2024-07-03': 8,
                    '2024-07-04': 2,
                    '2024-07-05': 10,
                    '2024-07-06': 7,
                    '2024-07-07': 4,
                    '2024-07-08': 4,
                    '2024-07-09': 4,
                    '2024-07-10': 5,
                    '2024-07-11': 4,
                    '2024-07-12': 4,
                    '2024-07-13': 4,
                    '2024-07-14': 3,
                    '2024-07-15': 4,
                    '2024-07-16': 4,
                    '2024-07-17': 4,
                    '2024-07-18': 7,
                    '2024-07-19': 4,
                    '2024-07-20': 4,
                    '2024-07-21': 2,
                    '2024-07-22': 4,
                    '2024-07-23': 4,
                    '2024-07-24': 6,
                    '2024-07-25': 4,
                    '2024-07-26': 4,
                    '2024-07-27': 3,
                    '2024-07-28': 4,
                    '2024-07-29': 4,
                    '2024-07-30': 5,
                    '2024-07-31': 4,
                    // 他の日付も同様に追加
                };
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    dateClick: function (info) {
                        var clickedDate = new Date(info.dateStr); // クリックされた日付をDateオブジェクトとして取得
                        var today = new Date();
                        today.setHours(0, 0, 0, 0); // 今日の日付のみを比較するため

                        if (clickedDate >= today) {
                            var dateString = clickedDate.toISOString().split('T')[0]; // 日付をISOフォーマットで取得
                            document.getElementById('selectedDate').value = dateString;
                            document.getElementById('dateForm').submit();
                        }
                    },

                    // 空き部屋数表示
                    // dayCellDidMount: function (info) {
                    //     var dateStr = info.date.toISOString().split('T')[0];
                    //     if (roomAvailability[dateStr]) {
                    //         var roomCount = roomAvailability[dateStr];
                    //         var roomInfo = document.createElement('div');
                    //         roomInfo.textContent = `空き部屋: ${roomCount}`;
                    //         roomInfo.style.fontSize = '12px';
                    //         roomInfo.style.color = 'red';
                    //         info.el.appendChild(roomInfo);
                    //     }
                    // }
                });

                calendar.render();
            });
        </script>
    </head>

    <body>
        <h1>予約カレンダー</h1>
        <div id="calendar"></div>
        <form id="dateForm" action="reservation" method="post">
            <input type="hidden" id="selectedDate" name="date">
        </form>
        <div class="footer">
            <a href="logout" class="btn">ログアウト</a>
        </div>

    </body>

    </html>