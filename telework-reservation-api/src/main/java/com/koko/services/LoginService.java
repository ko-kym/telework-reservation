package com.koko.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.koko.utils.DBController;

public class LoginService {
    public static Boolean verifyCredentials(String email, String password) {
        String sql = "SELECT employee_id,email,role FROM employees WHERE email = ? AND password = ?;";

        try (
                Connection connection = DBController.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = executeQueryWithParams(email, password, statement);) {

            return resultSet.next();
        } catch (Exception e) {
            e.printStackTrace();
            // TODO error handling 
            return null;
        }
    }

    private static ResultSet executeQueryWithParams(String email, String password, PreparedStatement statement) throws SQLException {
        statement.setString(1, email);
        statement.setString(2, password);

        return statement.executeQuery();
    }

}
