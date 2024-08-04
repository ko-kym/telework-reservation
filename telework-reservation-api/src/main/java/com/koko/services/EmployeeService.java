package com.koko.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.koko.dtos.EmployeeDto;
import com.koko.utils.DBController;

public class EmployeeService {
    public static EmployeeDto verifyCredentials(String email, String password)
            throws ClassNotFoundException, SQLException {
        String sql = "SELECT employee_id,employee_name,email,role FROM employees WHERE email = ? AND password = ?;";

        try (
                Connection connection = DBController.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = executeQueryWithParams(email, password, statement);) {

            if (resultSet.next()) {
                return new EmployeeDto(
                        resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4));
            } else {
                return null;
            }
        }
    }

    private static ResultSet executeQueryWithParams(String email, String password, PreparedStatement statement)
            throws SQLException {
        statement.setString(1, email);
        statement.setString(2, password);

        return statement.executeQuery();
    }

}
