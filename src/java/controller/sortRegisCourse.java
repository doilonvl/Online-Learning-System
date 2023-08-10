/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import model.Registration;
import model.User;

/**
 *
 * @author Huy Linh
 */
@WebServlet(name = "sortRegisCourse", urlPatterns = {"/sortRC"})
public class sortRegisCourse extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sortRegisCourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sortRegisCourse at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String opC = request.getParameter("opC");
            UserDBContext udb = new UserDBContext();
            User u = (User) request.getSession().getAttribute("user");
            List<Registration> listC = udb.getUserRegistration(u.getUser_id());
            switch (opC) {
                case "op1":
                    listC = udb.sortByNewRelease(u.getUser_id());
                    break;
                case "op2":
                    listC = udb.sortByPriceAsc(u.getUser_id());
                    break;
                case "op3":
                    listC = udb.sortByPriceDesc(u.getUser_id());
                    break;
                case "op4":
                    listC = udb.getUserRegistrationDone(u.getUser_id());
                    break;
                case "op5":
                    listC = udb.getUserRegistrationSubmitted(u.getUser_id());
                    break;
                default:
                    request.setAttribute("listC", listC);
                    request.getRequestDispatcher("myRegistration.jsp").forward(request, response);

            }
            request.setAttribute("listC", listC);
            request.getRequestDispatcher("myRegistration.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(sortRegisCourse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
