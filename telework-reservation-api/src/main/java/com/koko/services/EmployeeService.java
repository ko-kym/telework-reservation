package com.koko.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.koko.dtos.EmployeeDto;
import com.koko.utils.DBUtil;

public class EmployeeService {

    public EmployeeDto verifyCredentials(String email, String password)
            throws ClassNotFoundException, SQLException {
        Logger logger = LoggerFactory.getLogger(EmployeeService.class);

        logger.info("Verifying credentials for email: {}", email);
        String sql = "SELECT employee_id,employee_name,email,role FROM employees WHERE email = ? AND password = ?;";

        try (
                Connection connection = DBUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = executeQueryWithParams(email, password, statement);) {
            logger.debug("Executing query: {}", statement.toString());

            if (resultSet.next()) {
                EmployeeDto employeeDto = new EmployeeDto(
                        resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4));

                logger.info("Successfully verified credentials for email: {}", email);
                return employeeDto;

            } else {
                logger.warn("Failed to verify credentials: Invalid email or password for email: {}", email);
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
