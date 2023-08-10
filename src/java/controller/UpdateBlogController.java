/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Blog;
import model.BlogCategory;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name = "UpdateBlogController", urlPatterns = {"/updateBlog"})
public class UpdateBlogController extends HttpServlet {

    String FileUpload_Directory = "C:\\Users\\admin\\Downloads\\SWP391_Project\\summer2023-swp391.se1721-g2\\SWP391_Project\\web\\image\\";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateBlogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBlogController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String blogId = request.getParameter("bid");
        BlogDAO dao = new BlogDAO();
        Blog b = dao.getDetailBlogsById(blogId);
        List<BlogCategory> blogCategorys = dao.getBlogCategories();
        request.setAttribute("b", b);
        request.setAttribute("category", blogCategorys);
        request.getRequestDispatcher("updateBlog.jsp").forward(request, response);
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
//        processRequest(request, response);
        PrintWriter out = response.getWriter();
        String fileName = "";
        try {
            Part filePart = request.getPart("file");
            fileName = filePart.getSubmittedFileName();
            if(!fileName.equals("")){
                for (Part part : request.getParts()) {
                    part.write(FileUpload_Directory + fileName);
                }
            }
            int blog_id = Integer.parseInt(request.getParameter("blog_id"));
            String title = request.getParameter("title");
            String brief_info = request.getParameter("brief_info");
            String blog_content = request.getParameter("blog_content");
            int category_id = Integer.parseInt(request.getParameter("category_id"));
            Boolean status = request.getParameter("status").equals("1");
            String flag = request.getParameter("flag");
            String old_image = request.getParameter("old_image");
            
            BlogDAO dao = new BlogDAO();
            Blog blog = new Blog();
            
            blog.setBlog_id(blog_id);
            blog.setTitle(title);
            blog.setImage(fileName.equals("") ? old_image : "image/"+fileName);
            blog.setBrief_info(brief_info);
            blog.setCate_id(category_id);
            blog.setStatus(status);
            blog.setThumbnail(fileName.equals("") ? old_image : "image/"+fileName);
            blog.setFlag(flag);
            blog.setBlog_content(blog_content);
            
            dao.updateBlog(blog);
            response.sendRedirect("blog");
        } catch (Exception e) {
            out.print(e.getMessage());
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