package com.example.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.utils.DBController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        // データベースのユーザー認証ロジック
        try {
            String sql = "SELECT employee_id,email,role FROM employees WHERE email = ? AND password = ?;";
            connection = DBController.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);

            resultSet = statement.executeQuery();

            response.setContentType("text/html");
            if (resultSet.next()) {
                String employeeId = resultSet.getString("employee_id");

                HttpSession session = request.getSession();
                session.setAttribute("employeeId", employeeId);

                String role = resultSet.getString("role");
                String jsp = role.equals("ADMIN") 
                    ? "/WEB-INF/view/manager.jsp" 
                    :  "/WEB-INF/view/calendar.jsp";

                RequestDispatcher dispatcher = request.getRequestDispatcher(jsp);
                dispatcher.forward(request, response);

            } else {
                response.sendRedirect("index.html");
            }

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

}
