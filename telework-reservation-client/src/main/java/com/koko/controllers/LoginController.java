package com.koko.controllers;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.koko.dtos.EmployeeDto;
import com.koko.dtos.ErrorResponse;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/call-login")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            HttpResponse<String> apiResponse = callLogin(email, password);
            String body = apiResponse.body();

            String pathToForward = null;
            response.setContentType("text/html");
            ObjectMapper objectMapper = new ObjectMapper();

            if (apiResponse.statusCode() == HttpServletResponse.SC_OK) {
                EmployeeDto employeeDto = objectMapper.readValue(body, EmployeeDto.class);
                HttpSession session = request.getSession();
                session.setAttribute("employeeDto", employeeDto);

                pathToForward = "/WEB-INF/view/calendar.jsp";
            } else if ((apiResponse.statusCode() == HttpServletResponse.SC_UNAUTHORIZED)) {
                ErrorResponse errorResponse = objectMapper.readValue(body, ErrorResponse.class);
                request.setAttribute("message", errorResponse.getMessage());
                pathToForward = "/index.jsp";
            } else {
                ErrorResponse errorResponse = objectMapper.readValue(body, ErrorResponse.class);
                request.setAttribute("message", errorResponse.getMessage());
                pathToForward = "/error.jsp";
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher(pathToForward);
            dispatcher.forward(request, response);

        } catch (URISyntaxException | IOException | InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    private HttpResponse<String> callLogin(String email, String password)
            throws URISyntaxException, IOException, InterruptedException {
        String endPoint = "http://localhost:8080/telework-reservation-api-1.0/employees";
        String url = String.format("%s?email=%s&password=%s", endPoint, email, password);

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(new URI(url))
                .GET()
                .build();

        return client.send(request, HttpResponse.BodyHandlers.ofString());

    }
}
