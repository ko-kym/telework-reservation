package com.koko.controllers;

import java.io.IOException;

import com.koko.services.LoginService;

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

        Boolean isSuccess = LoginService.verifyCredentials(email, password);

        response.setContentType("text/plain");
        if (isSuccess) {
            response.getWriter().println("login success");
        } else {
            response.getWriter().println("login fail");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

}
