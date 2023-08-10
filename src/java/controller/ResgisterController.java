/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDBContext;
import jakarta.servlet.AsyncContext;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet("/register")
public class ResgisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            UserDBContext userDBContext = new UserDBContext();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            boolean gender = request.getParameter("gender").equals("1");
            String address = request.getParameter("address");
            String phone_number = request.getParameter("phonenumber");
            if (userDBContext.findByEmail(email) != null) {
                out.print("email is existed");
            } else {
                out.print("success");
                Random rand = new Random();
                int otpvalue = rand.nextInt(1255650);
                User user = new User(fullname, email, password, gender, address, phone_number, Integer.toString(otpvalue), false, true, 1);
                userDBContext.registerUSer(user, true);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ResgisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
