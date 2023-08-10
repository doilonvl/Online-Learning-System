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
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name="RegisterCourseController1", urlPatterns={"/courseRegister"})
public class CourseRegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        User user = (User) request.getSession().getAttribute("user");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        String price_packageId = request.getParameter("price_packageId");
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            request.setAttribute("message", "Please log in to register course");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            courseDAO dbCourse = new courseDAO();
            dbCourse.registerCourse(Integer.parseInt(courseId), user.getUser_id(), Integer.parseInt(price_packageId));
            request.setAttribute("message", "Register successfully!");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

}
