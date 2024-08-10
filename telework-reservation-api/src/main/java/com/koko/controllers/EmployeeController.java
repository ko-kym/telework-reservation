package com.koko.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

        Logger logger = LoggerFactory.getLogger(EmployeeController.class);
        logger.info("Received request for /employees endpoint.");
        logger.debug("Request parameters: email={}, password={}",
                request.getParameter("email"),
                request.getParameter("password"));

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        ObjectMapper mapper = new ObjectMapper();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (email == null || password == null) {
            ErrorResponse badRequestResponse = new ErrorResponse(HttpServletResponse.SC_BAD_REQUEST,
                    "Email and password are required.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(mapper.writeValueAsString(badRequestResponse));
            logger.warn("Request failed: Email and password are required.");
            return;
        }

        try {
            EmployeeDto employeeDto = EmployeeService.verifyCredentials(email, password);

            if (employeeDto != null) {
                String json = mapper.writeValueAsString(employeeDto);
                response.setStatus(HttpServletResponse.SC_OK);
                out.print(json);
                logger.info("Successfully processed request for /employees.");

            } else {
                ErrorResponse unauthorizedResponse = new ErrorResponse(HttpServletResponse.SC_UNAUTHORIZED,
                        "Invalid email or password.");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                out.print(mapper.writeValueAsString(unauthorizedResponse));
                logger.warn("Request failed: Invalid email or password.");
                return;
            }

            out.flush();

        } catch (ClassNotFoundException | SQLException e) {
            ErrorResponse internalServerErrorResponse = new ErrorResponse(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Internal server error.");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(mapper.writeValueAsString(internalServerErrorResponse));
            logger.error("Internal server error while processing request for /employees.", e);
            
        } finally {
            logger.info("Completed processing of request for /employees.");
        }
    }
}
