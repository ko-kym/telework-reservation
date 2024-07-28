package com.example.controllers;

import java.io.IOException;
// import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.text.SimpleDateFormat;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.utils.DBController;

@WebServlet("/request")
public class RequestController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession currentSession = request.getSession(false);
        String employeeId = (currentSession != null) ? (String) currentSession.getAttribute("employeeId") : null;
        String roomName = request.getParameter("roomName");
        roomName = roomName.trim();
        String selectedDate = request.getParameter("reservationDate");

        // 確認用
        // response.setContentType("text/html;charset=UTF-8");
        // PrintWriter out = response.getWriter();

        if (employeeId == null) {
            // out.println(employeeId);
            // out.println(selectedDate);
            // out.println(roomName);
            response.sendRedirect("index.html");
            return;
        }
        if (selectedDate == null || selectedDate.trim().isEmpty() || roomName == null || roomName.trim().isEmpty()) {
            // out.println(employeeId);
            // out.println(selectedDate);
            // out.println(roomName);

            response.sendRedirect("index.html");
            return;
        }

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DBController.getConnection();
            String sql = "INSERT INTO reservations (employee_id, room_id, reservation_date, status) VALUES ( ?, (SELECT room_id FROM rooms WHERE room_name =?), ?, 'PENDING');";
            statement = connection.prepareStatement(sql);

            Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(selectedDate);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

            statement.setString(1, employeeId);
            statement.setString(2, roomName);
            statement.setDate(3, sqlDate);

            // String executedSql = sql.replaceFirst("\\?", "'" + employeeId + "'")
            //         .replaceFirst("\\?", "'" + roomName + "'")
            //         .replaceFirst("\\?", "'" + sqlDate + "'");
            // out.println("Executed SQL: " + executedSql);

            int rowsAffected = statement.executeUpdate();
            System.out.println("reservation add : " + rowsAffected);
            // response.setContentType("text/html;charset=UTF-8");
            // if (rowsAffected > 0) {
            //     // Insert was successful
            //     response.getWriter().println("<html><body><h1>予約が成功しました。</h1></body></html>");
            // } else {
            //     // Insert failed
            //     response.getWriter().println("<html><body><h1>予約に失敗しました。</h1></body></html>");
            // }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException eSql) {
                eSql.printStackTrace();
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/calendar.jsp");
        dispatcher.forward(request, response);
    }

}
