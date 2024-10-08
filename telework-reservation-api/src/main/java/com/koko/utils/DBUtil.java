package com.koko.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        final String DB_URL = "jdbc:postgresql://localhost:5432/teleworkreservations";
        final String DB_USER = "postgres";
        final String DB_PASSWORD = "postgres";

        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

}
