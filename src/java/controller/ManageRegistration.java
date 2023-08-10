/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Registration;

/**
 *
 * @author admin
 */
@WebServlet(name="ManageRegistration", urlPatterns={"/manageRegistration"})
public class ManageRegistration extends HttpServlet {
   
    RegistrationDAO rdao = new RegistrationDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageRegistration</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageRegistration at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String action = "";
        if(request.getParameter("action") != null)
            action = request.getParameter("action");
        
        switch (action) {
            case "cancel":
                cancelRegistration(request, response);
                redirectToPage(request, response);
                break;
            case "accept":
                acceptRegistration(request, response);
                redirectToPage(request, response);
                break;
            default:
                redirectToPage(request, response);
                break;
        }
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
    }

    
    private void redirectToPage(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        List<Registration> listR = rdao.getAllRegistration();
        request.setAttribute("listR", listR);
        request.getRequestDispatcher("manageRegistration.jsp").forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void cancelRegistration(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("rid"));
            rdao.cancelRegistration(id);
            request.setAttribute("message", "Cancel Registration Successfully");
        } catch (Exception e) {
        }
    }

    private void acceptRegistration(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("rid"));
            rdao.changeStatusRegistration(id, "Done");
            request.setAttribute("message", "Accept Registration Successfully");
        } catch (Exception e) {
        }
    }

}
