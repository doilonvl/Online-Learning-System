/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.courseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Course;
import model.CourseCategory;

/**
 *
 * @author ACER
 */
@WebServlet(name = "CourseList", urlPatterns = {"/courses"})
public class CourseList extends HttpServlet {

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
        String search = request.getParameter("search") == null ? "" : request.getParameter("search");
        String cid = request.getParameter("cid") == null ? "" : request.getParameter("cid");
        String sortType = request.getParameter("sortType") == null ? "" : request.getParameter("sortType");
        String index = request.getParameter("index") == null ? "1" : request.getParameter("index");
        courseDAO courseDAO = new courseDAO();
        List<Course> listC = courseDAO.getListCourses(search, cid, sortType, index);
        List<Course> top3 = courseDAO.getTop3ListCourses();
        List<CourseCategory> cc = courseDAO.getBlogCategories();
        int numberPage = (int) Math.ceil((double) courseDAO.countCourses(search, cid)/ 9);
        request.setAttribute("listC", listC);
        request.setAttribute("clist", cc);
        request.setAttribute("numberPage", numberPage);
        request.setAttribute("top3", top3);
        request.getRequestDispatcher("courseList.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
