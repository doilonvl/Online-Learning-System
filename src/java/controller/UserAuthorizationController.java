/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name="UserAuthorizationController", urlPatterns={"/userAuthorization"})
public class UserAuthorizationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        RoleDAO r = new RoleDAO();
        User u = (User) session.getAttribute("user");
        String role = null;
        if (u != null) {
            role = r.getRoleNameByUserId(u.getUser_id());
        }
        if (role == null) {
            role = "Guest";
        }
        if (role.equals("Guest")) {
            req.getRequestDispatcher("home").forward(req, resp);
        } 
//        else {
//            req.getRequestDispatcher("home").forward(req, resp);
//        }
    }
    
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserAuthorizationController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserAuthorizationController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
