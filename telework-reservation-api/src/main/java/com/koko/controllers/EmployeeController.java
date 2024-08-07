package com.koko.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.koko.dtos.EmployeeDto;
import com.koko.dtos.ErrorResponse;
import com.koko.services.EmployeeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/employees")
public class EmployeeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        ObjectMapper mapper = new ObjectMapper();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (email == null || password == null) {
            ErrorResponse badRequestResponse = new ErrorResponse(HttpServletResponse.SC_BAD_REQUEST,
                    "メールアドレスとパスワードは必須です。");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(mapper.writeValueAsString(badRequestResponse));
            return;
        }

        try {
            EmployeeDto employeeDto = EmployeeService.verifyCredentials(email, password);

            if (employeeDto != null) {
                String json = mapper.writeValueAsString(employeeDto);
                response.setStatus(HttpServletResponse.SC_OK);
                out.print(json);

            } else {
                ErrorResponse unauthorizedResponse = new ErrorResponse(HttpServletResponse.SC_UNAUTHORIZED,
                        "無効なメールアドレスまたはパスワードです。");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                out.print(mapper.writeValueAsString(unauthorizedResponse));
                return;
            }

            out.flush();

        } catch (ClassNotFoundException | SQLException e) {
            ErrorResponse internalServerErrorResponse = new ErrorResponse(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "内部サーバーエラー。");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(mapper.writeValueAsString(internalServerErrorResponse));
        }
    }

}
