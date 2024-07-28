package com.example.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

import com.example.utils.DBController;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet {
    // 定数定義
    public static final String ROOM_VACANT = "予約可能"; // 空室
    public static final String NO_RESERVATION = "-";
    // 自分で予約
    public static final String RESERVATION_CONFIRMED = "予約確定";
    public static final String RESERVATION_PENDING = "予約申請中";
    // 他人が予約
    public static final String RESERVATION_CONFIRMED_OTHERS = "予約済み";
    public static final String RESERVATION_PENDING_OTHERS = "予約申請中（他者）";
    // ステータス比較用
    public static final String RESERVED = "RESERVED";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession currentSession = request.getSession(false);
        String employeeId = (currentSession != null) ? (String) currentSession.getAttribute("employeeId") : null;

        if (employeeId == null) {
            response.sendRedirect("index.html");
            return;
        }

        String selectedDate = request.getParameter("date");
        if (selectedDate == null || selectedDate.trim().isEmpty()) {
            response.sendRedirect("index.html");
            return;
        }

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<String[]> reservationList = new ArrayList<>();
        try {
            connection = DBController.getConnection();
            String sql = "SELECT rooms.room_name, reservations.status, employee_id FROM rooms LEFT JOIN reservations ON rooms.room_id = reservations.room_id AND reservations.reservation_date = ?;";
            statement = connection.prepareStatement(sql);
            Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(selectedDate);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            statement.setDate(1, sqlDate);

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String roomName = resultSet.getString("room_name");
                String status = resultSet.getString("status");
                String userId = resultSet.getString("employee_id");

                if (status == null) {
                    status = ROOM_VACANT;
                    userId = NO_RESERVATION;
                }

                if (userId.equals(NO_RESERVATION)) {
                    status = ROOM_VACANT; // 1.予約なし
                } else if (employeeId.equals(userId)) { // 2,3. 自分の予約確認
                    status = RESERVED.equals(status) ? RESERVATION_CONFIRMED : RESERVATION_PENDING;
                } else { // 4,5. 他人の予約の確認
                    status = RESERVED.equals(status) ? RESERVATION_CONFIRMED_OTHERS : RESERVATION_PENDING_OTHERS;
                }

                reservationList.add(new String[] { roomName, status, userId });
            }

            request.setAttribute("reservationList", reservationList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/reservation-screen.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException eSql) {
                eSql.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/calendar.jsp");
        dispatcher.forward(request, response);
    }
}
