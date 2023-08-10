/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RoleDAO;
import dao.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.User;

/**
 *
 * @author Huy Linh
 */
@WebServlet(name="UserDetail", urlPatterns={"/userdetail"})
public class UserDetail extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserDetail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            String uid = request.getParameter("uid");
            UserDBContext udb = new UserDBContext();
            RoleDAO roleDAO = new RoleDAO();
            
            List<Role> listR = roleDAO.getListRole();
            User u = udb.getDetailUser(uid);
            
            request.setAttribute("listR", listR);
            request.setAttribute("u", u);
            request.getRequestDispatcher("userDetail.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int role = Integer.parseInt(request.getParameter("role"));
            int status = Integer.parseInt(request.getParameter("status"));
            UserDBContext udbc = new UserDBContext();
            RoleDAO roleDAO = new RoleDAO();
            
            udbc.editUserRoleAndStatus(userId, role, status);
            List<Role> listR = roleDAO.getListRole();
            User u = udbc.getDetailUser(request.getParameter("userId"));
            
            request.setAttribute("listR", listR);
            request.setAttribute("u", u);
            request.getRequestDispatcher("userDetail.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
