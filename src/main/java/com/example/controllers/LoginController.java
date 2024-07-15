package com.example.controllers;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        // データベースのユーザー認証ロジック
        try {
            String sql = "SELECT * FROM employees WHERE email = ? AND password = ?;";
            connection = DBController.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/calendar.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("index.html");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                resultSet.close();
                statement.close();
                connection.close();
            } catch (SQLException eSql) {
                eSql.printStackTrace();
            }

        }
    }

}
