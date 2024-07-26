package com.example.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.utils.DBController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// @WebServlet("/employees")
public class EmployeeController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");
        String employeeName = request.getParameter("employeeName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (employeeId == null || employeeId.trim().isEmpty() ||
                employeeName == null || employeeName.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                role == null || role.trim().isEmpty()) {
                
            // アラームか何か出す
            response.sendRedirect("index.html");
            return;
        }

        if (!role.trim().equals("ADMIN") && !role.trim().equals("NOT_ADMIN")) {
            // アラームか何か出す
            response.sendRedirect("index.html");
            return;
        }

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DBController.getConnection();

            String checkSql = "SELECT * FROM employees WHERE employee_id = ? OR email = ?;";
            statement = connection.prepareStatement(checkSql);
            statement.setString(1, employeeId);
            statement.setString(2, email);
            
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                // アラームか何か出す
                response.sendRedirect("index.html");
                return;
            }
            
            String insertSql = "INSERT INTO employees (employee_id, employee_name, email, password, role) VALUES ( ?, ?, ?, ?, ?);";
            statement = connection.prepareStatement(insertSql);
            statement.setString(1, employeeId);
            statement.setString(2, employeeName);
            statement.setString(3, email);
            statement.setString(4, password);
            statement.setString(5, role);

            int rowsAffected = statement.executeUpdate();
            System.out.println("employee add : " + rowsAffected);

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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/manager.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/employee.jsp");
        dispatcher.forward(request, response);
    }
}
