package com.koko.controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // api
        String apiResponse = callLogin(email, password);

        response.setContentType("text/html");
        if (apiResponse.equals("login success")) {

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/calendar.jsp");
            dispatcher.forward(request, response);

        } else {
            request.setAttribute("errorMessage", "メールアドレスかパスワードが違います");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    private String callLogin(String email, String password) throws IOException {
        String endPoint = "http://localhost:8080/telework-reservation-api-1.0/login";
        URL url;
        try {
            url = new URI(endPoint.concat("?email=").concat(email).concat("&password=").concat(password)).toURL();
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            in.close();
            return response.toString();

        } catch (MalformedURLException | URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }

    }
}
