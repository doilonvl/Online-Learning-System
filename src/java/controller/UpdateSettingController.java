/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RoleDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Setting;

/**
 *
 * @author admin
 */
@WebServlet(name="UpdateSettingController", urlPatterns={"/updateSetting"})
public class UpdateSettingController extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateSettingController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSettingController at " + request.getContextPath () + "</h1>");
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
//        processRequest(request, response);
        String sid = request.getParameter("sid");
        SettingDAO dao = new SettingDAO();
        RoleDAO daoR = new RoleDAO();
        
        request.setAttribute("listR", daoR.getListRole());
        request.setAttribute("s", dao.getDetailSettingById(sid));
        request.getRequestDispatcher("updateSetting.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        try {
            SettingDAO dao = new SettingDAO();
            int setting_id = Integer.parseInt(request.getParameter("setting_id"));
            int type = Integer.parseInt(request.getParameter("type"));
            String value = request.getParameter("value");
            int order = Integer.parseInt(request.getParameter("order"));
            String description = request.getParameter("description");
            Boolean status = request.getParameter("status").equals("1");
            
            Setting setting = new Setting();
            setting.setSetting_id(setting_id);
            setting.setOrder(order);
            setting.setValue(value);
            setting.setDescription(description);
            setting.setStatus(status);
            dao.updateSetting(setting, type);
            response.sendRedirect("settingList");
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
