/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.Price_PackageDAO;
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
import model.Price_package;
import model.User;




@WebServlet(name="CourseDetailsController", urlPatterns={"/details"})
public class CourseDetailsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        courseDAO dbCourse = new courseDAO();
        User user = (User) request.getSession().getAttribute("user");
        Price_PackageDAO dbPrice_Package = new Price_PackageDAO();
        List<Price_package> price_packages = dbPrice_Package.findAll();
        Course course = dbCourse.findByCouseId(Integer.parseInt(courseId));
        boolean checkUserRegister = false;
        if (user != null) {
            checkUserRegister = dbCourse.checkUserRegisterCourse(user.getUser_id(), Integer.parseInt(courseId));
        }
        
        List<Course> top3 = dbCourse.getTop3ListCourses();
        List<CourseCategory> cc = dbCourse.getBlogCategories();
        request.setAttribute("clist", cc);
        request.setAttribute("top3", top3);
        
        request.setAttribute("checkRegister", checkUserRegister);
        request.setAttribute("price_packages", price_packages);
        request.setAttribute("course", course);
        request.getRequestDispatcher("courseDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String courseId = request.getParameter("courseId");
        courseDAO dbCourse = new courseDAO();
        User user = (User) request.getSession().getAttribute("user");
        Price_PackageDAO dbPrice_Package = new Price_PackageDAO();
        List<Price_package> price_packages = dbPrice_Package.findAll();
        Course course = dbCourse.findByCouseId(Integer.parseInt(courseId));
        boolean checkUserRegister = false;
        if (user != null) {
            checkUserRegister = dbCourse.checkUserRegisterCourse(user.getUser_id(), Integer.parseInt(courseId));
        }
        
        List<Course> top3 = dbCourse.getTop3ListCourses();
        List<CourseCategory> cc = dbCourse.getBlogCategories();
        request.setAttribute("clist", cc);
        request.setAttribute("top3", top3);
        
        request.setAttribute("checkRegister", checkUserRegister);
        request.setAttribute("price_packages", price_packages);
        request.setAttribute("course", course);
        request.getRequestDispatcher("courseDetails.jsp").forward(request, response);
    }
}