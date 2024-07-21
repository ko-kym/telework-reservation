package com.example.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.example.utils.DBController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/calendar")
public class CalendarController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DBController.getConnection();

            String sql = "SELECT (SELECT COUNT(*) FROM rooms) - (SELECT COUNT(*) FROM reservations WHERE reservation_date = ?) AS available_rooms;";
            statement = connection.prepareStatement(sql);

            List<String> dateList = generateDateList();

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            // var roomAvailability = {
            // '2024-07-01': 5,
            // '2024-07-02': 3,
            // '2024-07-03': 8,
            // '2024-07-04': 2,
            // '2024-07-05': 10,
            // '2024-07-06': 7,
            // '2024-07-07': 4,
            // // 他の日付も同様に追加
            // };
            out.println("空き部屋(テスト)");

            for (String date : dateList) { // 1 : 2024-08-01 2: 2024-08-02
                Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                statement.setDate(1, sqlDate);
                resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    int availableRooms = resultSet.getInt("available_rooms");
                    out.println(date + ": " + String.valueOf(availableRooms));
                }
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException | ParseException e) {
            e.printStackTrace();
            try {
                resultSet.close();
                statement.close();
                connection.close();
            } catch (SQLException eSql) {
                e.printStackTrace();
            }
        }
    }
    // private List<String> generateDateList(String year, String month) {
    // year, monthを使用してで何日あるかが分かればいい

    // }

    private List<String> generateDateList() {

        List<String> dateList = new ArrayList<>();

        dateList.add("2024-08-01");
        dateList.add("2024-08-02");
        dateList.add("2024-08-03");
        dateList.add("2024-08-04");
        dateList.add("2024-08-05");
        dateList.add("2024-08-06");
        dateList.add("2024-08-07");
        dateList.add("2024-08-08");
        dateList.add("2024-08-09");
        dateList.add("2024-08-10");
        dateList.add("2024-08-11");
        dateList.add("2024-08-12");
        dateList.add("2024-08-13");
        dateList.add("2024-08-14");
        dateList.add("2024-08-15");
        dateList.add("2024-08-16");
        dateList.add("2024-08-17");
        dateList.add("2024-08-18");
        dateList.add("2024-08-19");
        dateList.add("2024-08-20");
        dateList.add("2024-08-21");
        dateList.add("2024-08-22");
        dateList.add("2024-08-23");
        dateList.add("2024-08-24");
        dateList.add("2024-08-25");
        dateList.add("2024-08-26");
        dateList.add("2024-08-27");
        dateList.add("2024-08-28");
        dateList.add("2024-08-29");
        dateList.add("2024-08-30");
        dateList.add("2024-08-31");

        return dateList;
    }

}
