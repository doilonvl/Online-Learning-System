/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.LessonDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Lesson;
import model.LessonTopic;
import model.LessonType;

@WebServlet(name="LessonsController", urlPatterns={"/lessons"})
public class LessonsController extends HttpServlet {
   
    int courseId = 1;
    LessonDAO lessonDAO = new LessonDAO();
    SubjectDAO subjectDAO = new SubjectDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LessonController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String action = request.getParameter("action");
        try {
            if(request.getParameter("courseId") != null)
                courseId = Integer.parseInt(request.getParameter("courseId"));
        } catch (Exception e) {
        }
        
        action = action == null ? "" : action;
        switch (action) {
            case "changeStatus":
                changeStatusLesson(request, response);
                redirectToManageLessonPage(request, response);
                break;
            default:
                redirectToManageLessonPage(request, response);
                break;
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String action = request.getParameter("action");
        try {
            if(request.getParameter("courseId") != null)
                courseId = Integer.parseInt(request.getParameter("courseId"));
        } catch (Exception e) {
        }
        
        action = action == null ? "" : action;
        switch (action) {
            case "create":
                createLesson(request, response);
                redirectToManageLessonPage(request, response);
                break;
            case "update":
                updateLesson(request, response);
                redirectToManageLessonPage(request, response);
                break;
            default:
                redirectToManageLessonPage(request, response);
                break;
        }
    }

    
    private void redirectToManageLessonPage(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        List<Lesson> listL = lessonDAO.findAllLessonBySubjectId(courseId, -1);
        List<LessonType> listType = lessonDAO.getAllLessonType();
        List<LessonTopic> listTopic = lessonDAO.getAllLessonTopic();
        
        
        request.setAttribute("listL", listL);
        request.setAttribute("listType", listType);
        request.setAttribute("listTopic", listTopic);
        request.getRequestDispatcher("manageLesson.jsp").forward(request, response);
    }
    
    private void createLesson(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        int topic = Integer.parseInt(request.getParameter("topic"));
        int order = Integer.parseInt(request.getParameter("order"));
        String link = request.getParameter("link");
        String content = request.getParameter("content");
        content = content.replaceAll("\"", "&quot;");
        Lesson lesson = new Lesson();
        lesson.setName(name);
        lesson.setType_id(type);
        lesson.setTopic_id(topic);
        lesson.setSubject_id(courseId);
        lesson.setOrder(order);
        lesson.setVideoLink(link);
        lesson.setHtmlContent(content);
        lesson.setStatus(true);
        
        lessonDAO.addNewLesson(lesson);
    }
    
    private void updateLesson(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        int topic = Integer.parseInt(request.getParameter("topic"));
        int order = Integer.parseInt(request.getParameter("order"));
        String link = request.getParameter("link");
        String content = request.getParameter("content");
        content = content.replaceAll("\"", "&quot;");
        Lesson lesson = new Lesson();
        lesson.setName(name);
        lesson.setType_id(type);
        lesson.setTopic_id(topic);
        lesson.setSubject_id(courseId);
        lesson.setOrder(order);
        lesson.setVideoLink(link);
        lesson.setHtmlContent(content);
        lesson.setStatus(true);
        lesson.setId(id);
        
        lessonDAO.updateLesson(lesson);
    }
    
    private void changeStatusLesson(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("lessonId"));
        lessonDAO.changeStatusLesson(id);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

    

    

}