package controller;

import dao.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Lesson;

@WebServlet(name = "MyListLesson", urlPatterns = {"/myListLesson"})
public class MyListLesson extends HttpServlet {

    LessonDAO lessonDAO = new LessonDAO();
    int subjectId = -3;
    int lessonId = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyListLesson</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyListLesson at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        try {
            subjectId = Integer.parseInt(request.getParameter("courseId"));
        } catch (NumberFormatException e) {
        }
        if (request.getParameter("lessonId") != null) {
            lessonId = Integer.parseInt(request.getParameter("lessonId"));
        }
        List<Lesson> listL = lessonDAO.findAllLessonBySubjectId(subjectId, 1);
        String content = "";
        
        for (Lesson lesson : listL) {
            System.out.println(lesson.getId() + " " + lessonId);
            if (lesson.getId() == lessonId) {
                System.out.println("Ok");
                content = lesson.getHtmlContent();
                break;
            }
        }

        request.setAttribute("content", content);
        request.setAttribute("listL", listL);
        request.getRequestDispatcher("myListLesson.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
