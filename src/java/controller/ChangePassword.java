package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import dao.UserDBContext;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/changepassword")

public class ChangePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<User> users = new ArrayList<>();
        String oldPassword = request.getParameter("oldpass");
        String newPassword = request.getParameter("newpass");
        String confPassword = request.getParameter("renewpass");

        RequestDispatcher dispatcher = null;
        if (!oldPassword.isEmpty() && !newPassword.isEmpty() && !confPassword.isEmpty() && newPassword.equals(confPassword) && oldPassword!=newPassword && oldPassword!=confPassword) {

            try {
                UserDBContext udbc = new UserDBContext();
                User user = (User) request.getSession().getAttribute("user");
                udbc.changePass(user, newPassword);
                request.setAttribute("status", "Reset Success");
//                dispatcher = request.getRequestDispatcher("home.jsp");
//                dispatcher.forward(request, response);
                response.sendRedirect("home");
            } catch (Exception e) {
                e.printStackTrace();
            }

        }else if (newPassword.length() < 6 && newPassword.length() > 32 
                && confPassword.length() < 6 && confPassword.length() > 32 ){
            request.setAttribute("status", "Please enter password from 6 to 32 character");
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
            
                
        } else if (oldPassword == null || oldPassword.isEmpty()
                || newPassword == null || newPassword.isEmpty() 
                || confPassword == null || newPassword.isEmpty()) {
            request.setAttribute("errorMessage", "Please enter your password to change");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        } 
        
        else {
            request.setAttribute("status", "Change password Failed");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);

        }

    }

    
    
}
