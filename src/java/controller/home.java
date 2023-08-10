/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BlogDAO;
import dao.SliderDAO;
import dao.courseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.Course;
import model.Slider;

/**
 *
 * @author Huy Linh
 */
@WebServlet(name="home", urlPatterns={"/home"})
public class home extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        courseDAO courseDAO = new courseDAO();
        String status_filter = request.getParameter("status_filter");
        String title_search = request.getParameter("title_search");
        if(status_filter == null)status_filter="";
        if(title_search == null) title_search ="";
        SliderDAO dbSlider = new SliderDAO();
        ArrayList<Slider> sliders = dbSlider.findSliderByTitleOrBackLinkAndActive(title_search, status_filter);
        BlogDAO dao = new BlogDAO();
        List<Blog> listB = dao.getListBlogsTop3();
        request.setAttribute("sliders", sliders);
        List<Course> listC = courseDAO.getHomeCourse();
        
        request.setAttribute("listC", listC);
        request.setAttribute("listB", listB);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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