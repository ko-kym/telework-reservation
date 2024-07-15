package com.example.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBController {

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        final String DB_URL = "jdbc:postgresql://localhost:5432/TeleworkReservations";
        final String DB_USER = "postgres";
        final String DB_PASSWORD = "postgres";

        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

}
